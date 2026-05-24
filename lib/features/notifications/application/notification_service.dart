import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../app/providers/repository_providers.dart';
import '../../../i18n/strings.g.dart';
import '../../auth/application/auth_controller.dart';

part 'notification_service.g.dart';

const _kChannelId = 'vitolog_intakes';
const _kChannelName = 'Intake Reminders';
const _kChannelDesc = 'VitaLog supplement intake reminders';

// Sliding-window parameters: 7-day horizon, hard cap at 50 slots to stay
// within iOS's 64-notification limit while leaving headroom for edge cases.
const _kWindowDays = 7;
const _kMaxSlots = 50;

/// Manages OS-level local notification scheduling for supplement intake reminders.
///
/// All scheduling is done in a single "sliding window" pass covering the next
/// [_kWindowDays] days, bounded by [_kMaxSlots]. The entire schedule is rebuilt
/// from scratch on every trigger (login, resume, course save/delete).
class NotificationService {
  NotificationService(this._ref);

  final Ref _ref;
  // Not instantiated on web — flutter_local_notifications uses dart:io
  // internally, which is unavailable on the web compiler target.
  final FlutterLocalNotificationsPlugin? _fln =
      kIsWeb ? null : FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // ── Internal ──────────────────────────────────────────────────────────────

  bool get _isMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  Future<bool> _ensureInitialized() async {
    if (!_isMobile || _fln == null) return false;
    if (_initialized) return true;

    tz.initializeTimeZones();
    try {
      final tzName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(tzName.identifier));
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _fln.initialize(
      settings: const InitializationSettings(android: android, iOS: darwin),
    );

    _initialized = true;
    return true;
  }

  // ── Public API ────────────────────────────────────────────────────────────

  /// Requests OS notification and exact-alarm permissions.
  ///
  /// On Android 13+ requests POST_NOTIFICATIONS and SCHEDULE_EXACT_ALARM.
  /// On iOS requests alert, badge, and sound.
  /// No-op on web and desktop.
  Future<void> requestPermissions() async {
    if (!await _ensureInitialized()) return;

    final android = _fln?.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();
    await android?.requestExactAlarmsPermission();

    await _fln
        ?.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  /// Cancels all pending notifications and rebuilds the sliding-window schedule.
  ///
  /// Fetches the current user's active courses with product names in a single
  /// efficient JOIN query, then schedules up to [_kMaxSlots] notifications for
  /// the next [_kWindowDays] days.
  Future<void> scheduleNextIntakes() async {
    if (!await _ensureInitialized()) return;

    await _fln?.cancelAll();

    final authState = _ref.read(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    final rows = await _ref
        .read(coursesDaoProvider)
        .getActiveCoursesWithProductName(userId);

    if (rows.isEmpty) return;

    final tr = LocaleSettings.instance.currentTranslations;
    final now = tz.TZDateTime.now(tz.local);

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        _kChannelId,
        _kChannelName,
        channelDescription: _kChannelDesc,
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    var scheduled = 0;

    outer:
    for (var dayOffset = 0; dayOffset < _kWindowDays; dayOffset++) {
      final day = now.add(Duration(days: dayOffset));

      // Epoch-days to match the integer storage format in Courses table.
      final epochDay =
          DateTime.utc(day.year, day.month, day.day).millisecondsSinceEpoch ~/
              86400000;

      for (final row in rows) {
        if (scheduled >= _kMaxSlots) break outer;

        final course = row.course;

        if (course.startDate > epochDay) continue;
        if (course.endDate != null && course.endDate! < epochDay) continue;

        final hours = course.timeOfDay ~/ 3600;
        final minutes = (course.timeOfDay % 3600) ~/ 60;

        final scheduledTime = tz.TZDateTime(
          tz.local,
          day.year,
          day.month,
          day.day,
          hours,
          minutes,
        );

        if (!scheduledTime.isAfter(now)) continue;

        // Deterministic 32-bit ID: stable across rebuilds for the same
        // course+day combination so duplicate alarms are never registered.
        final notifId =
            Object.hash(course.id, day.year, day.month, day.day) & 0x7FFFFFFF;

        await _fln?.zonedSchedule(
          id: notifId,
          title: tr.notifications.title,
          body: tr.notifications.takeReminder(name: row.productName ?? ''),
          scheduledDate: scheduledTime,
          notificationDetails: details,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );

        scheduled++;
      }
    }
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) => NotificationService(ref);
