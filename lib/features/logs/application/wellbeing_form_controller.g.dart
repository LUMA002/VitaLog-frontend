// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellbeing_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages mood / energy / sleep / notes for the wellbeing diary form.

@ProviderFor(WellbeingFormController)
final wellbeingFormControllerProvider = WellbeingFormControllerProvider._();

/// Manages mood / energy / sleep / notes for the wellbeing diary form.
final class WellbeingFormControllerProvider
    extends $NotifierProvider<WellbeingFormController, WellbeingFormState> {
  /// Manages mood / energy / sleep / notes for the wellbeing diary form.
  WellbeingFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wellbeingFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wellbeingFormControllerHash();

  @$internal
  @override
  WellbeingFormController create() => WellbeingFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WellbeingFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WellbeingFormState>(value),
    );
  }
}

String _$wellbeingFormControllerHash() =>
    r'dc5a2e18df0cddd1a9081dba5b5591f5cb3d401d';

/// Manages mood / energy / sleep / notes for the wellbeing diary form.

abstract class _$WellbeingFormController extends $Notifier<WellbeingFormState> {
  WellbeingFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WellbeingFormState, WellbeingFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WellbeingFormState, WellbeingFormState>,
              WellbeingFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
