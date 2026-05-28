import 'package:flutter/material.dart';

abstract final class AppColors {
  // ── Backgrounds ─────────────────────────────────────────────────────────────
  static const background = Color(0xFF0A0A0C);
  static const foreground = Color(0xFFF4F4F5);
  static const card = Color(0xFF111114);
  static const cardElevated = Color(0xFF18181C);

  // ── Primary accent — Neon Green ──────────────────────────────────────────────
  static const primary = Color(0xFF39FF14);
  static const primaryForeground = Color(0xFF011300);
  static const primaryGlow = Color(0x4D39FF14);

  // ── Secondary / Muted ────────────────────────────────────────────────────────
  static const secondary = Color(0xFF27272A);
  static const secondaryForeground = Color(0xFFA1A1AA);
  static const muted = Color(0xFF1A1A1E);
  static const mutedForeground = Color(0xFF88889A);

  // ── Semantic ─────────────────────────────────────────────────────────────────
  static const destructive = Color(0xFFEF4444);
  static const border = Color(0x20FFFFFF);

  // ── Completed / Taken state ──────────────────────────────────────────────────
  /// Card background when an intake is marked as taken.
  static const completed = Color(0xFF0C1A0D);

  /// High-contrast text on [completed] background
  static const completedText = Color(0xFFB8F5C8);

  /// Neon-green border for taken-state cards.
  static const completedBorder = Color(0x7039FF14);

  // ── Supporting text ──────────────────────────────────────────────────────────
  static const pendingText = Color(0xFFB0B0BA);
  static const timeText = Color(0xFF90909A);
}
