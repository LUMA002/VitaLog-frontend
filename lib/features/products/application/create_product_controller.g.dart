// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateProductController)
final createProductControllerProvider = CreateProductControllerProvider._();

final class CreateProductControllerProvider
    extends $NotifierProvider<CreateProductController, CreateProductState> {
  CreateProductControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createProductControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createProductControllerHash();

  @$internal
  @override
  CreateProductController create() => CreateProductController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateProductState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateProductState>(value),
    );
  }
}

String _$createProductControllerHash() =>
    r'9f8e98ddecdb74db12be2302f1fa468488a764ce';

abstract class _$CreateProductController extends $Notifier<CreateProductState> {
  CreateProductState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CreateProductState, CreateProductState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateProductState, CreateProductState>,
              CreateProductState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
