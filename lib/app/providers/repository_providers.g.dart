// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single [AppDatabase] instance for the lifetime of the app.
/// Disposed automatically when the [ProviderScope] is torn down.

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// The single [AppDatabase] instance for the lifetime of the app.
/// Disposed automatically when the [ProviderScope] is torn down.

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// The single [AppDatabase] instance for the lifetime of the app.
  /// Disposed automatically when the [ProviderScope] is torn down.
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'7b764723bbcb89fc8495c0edf02613ef6f56ec21';

/// Application-wide [Clock]. Inject [TestClock] in tests via overrides.

@ProviderFor(clock)
final clockProvider = ClockProvider._();

/// Application-wide [Clock]. Inject [TestClock] in tests via overrides.

final class ClockProvider extends $FunctionalProvider<Clock, Clock, Clock>
    with $Provider<Clock> {
  /// Application-wide [Clock]. Inject [TestClock] in tests via overrides.
  ClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockHash();

  @$internal
  @override
  $ProviderElement<Clock> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Clock create(Ref ref) {
    return clock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Clock value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Clock>(value),
    );
  }
}

String _$clockHash() => r'55214d6539f7396a3ae1aa23b06eea79fdac0ebe';

@ProviderFor(productsDao)
final productsDaoProvider = ProductsDaoProvider._();

final class ProductsDaoProvider
    extends $FunctionalProvider<ProductsDao, ProductsDao, ProductsDao>
    with $Provider<ProductsDao> {
  ProductsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsDaoHash();

  @$internal
  @override
  $ProviderElement<ProductsDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProductsDao create(Ref ref) {
    return productsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsDao>(value),
    );
  }
}

String _$productsDaoHash() => r'959c888a1e216f18da32c109c7c174a3781d6271';

@ProviderFor(coursesDao)
final coursesDaoProvider = CoursesDaoProvider._();

final class CoursesDaoProvider
    extends $FunctionalProvider<CoursesDao, CoursesDao, CoursesDao>
    with $Provider<CoursesDao> {
  CoursesDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coursesDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coursesDaoHash();

  @$internal
  @override
  $ProviderElement<CoursesDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoursesDao create(Ref ref) {
    return coursesDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoursesDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoursesDao>(value),
    );
  }
}

String _$coursesDaoHash() => r'8e535d4c2bd005bfd50598c45f9d27217f82f82e';

@ProviderFor(globalIngredientsDao)
final globalIngredientsDaoProvider = GlobalIngredientsDaoProvider._();

final class GlobalIngredientsDaoProvider
    extends
        $FunctionalProvider<
          GlobalIngredientsDao,
          GlobalIngredientsDao,
          GlobalIngredientsDao
        >
    with $Provider<GlobalIngredientsDao> {
  GlobalIngredientsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalIngredientsDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalIngredientsDaoHash();

  @$internal
  @override
  $ProviderElement<GlobalIngredientsDao> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalIngredientsDao create(Ref ref) {
    return globalIngredientsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalIngredientsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalIngredientsDao>(value),
    );
  }
}

String _$globalIngredientsDaoHash() =>
    r'eaf5da4c3b0311f195f1b8adc1cd043537b87983';

@ProviderFor(wellbeingLogsDao)
final wellbeingLogsDaoProvider = WellbeingLogsDaoProvider._();

final class WellbeingLogsDaoProvider
    extends
        $FunctionalProvider<
          WellbeingLogsDao,
          WellbeingLogsDao,
          WellbeingLogsDao
        >
    with $Provider<WellbeingLogsDao> {
  WellbeingLogsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wellbeingLogsDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wellbeingLogsDaoHash();

  @$internal
  @override
  $ProviderElement<WellbeingLogsDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WellbeingLogsDao create(Ref ref) {
    return wellbeingLogsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WellbeingLogsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WellbeingLogsDao>(value),
    );
  }
}

String _$wellbeingLogsDaoHash() => r'a94cdf9a69250f2bf67552984ad238a3d17d62e8';

@ProviderFor(syncMetaDao)
final syncMetaDaoProvider = SyncMetaDaoProvider._();

final class SyncMetaDaoProvider
    extends $FunctionalProvider<SyncMetaDao, SyncMetaDao, SyncMetaDao>
    with $Provider<SyncMetaDao> {
  SyncMetaDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncMetaDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncMetaDaoHash();

  @$internal
  @override
  $ProviderElement<SyncMetaDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncMetaDao create(Ref ref) {
    return syncMetaDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncMetaDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncMetaDao>(value),
    );
  }
}

String _$syncMetaDaoHash() => r'897415cf82729e1bbbc111ee3e860f012827f4f8';

@ProviderFor(courseRepository)
final courseRepositoryProvider = CourseRepositoryProvider._();

final class CourseRepositoryProvider
    extends
        $FunctionalProvider<
          ICourseRepository,
          ICourseRepository,
          ICourseRepository
        >
    with $Provider<ICourseRepository> {
  CourseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'courseRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$courseRepositoryHash();

  @$internal
  @override
  $ProviderElement<ICourseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICourseRepository create(Ref ref) {
    return courseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICourseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICourseRepository>(value),
    );
  }
}

String _$courseRepositoryHash() => r'25dd05d478e6814001e653b7e8f6e1baccf183f9';

@ProviderFor(productRepository)
final productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          IProductRepository,
          IProductRepository,
          IProductRepository
        >
    with $Provider<IProductRepository> {
  ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<IProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'502e7e4e32683f8cfd42737ae52fea3204233d25';

@ProviderFor(productIngredientRepository)
final productIngredientRepositoryProvider =
    ProductIngredientRepositoryProvider._();

final class ProductIngredientRepositoryProvider
    extends
        $FunctionalProvider<
          IProductIngredientRepository,
          IProductIngredientRepository,
          IProductIngredientRepository
        >
    with $Provider<IProductIngredientRepository> {
  ProductIngredientRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productIngredientRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productIngredientRepositoryHash();

  @$internal
  @override
  $ProviderElement<IProductIngredientRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProductIngredientRepository create(Ref ref) {
    return productIngredientRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProductIngredientRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProductIngredientRepository>(value),
    );
  }
}

String _$productIngredientRepositoryHash() =>
    r'af2cb0aa0b284f8a0e6817535a7896a1dc130fcc';

@ProviderFor(intakeLogRepository)
final intakeLogRepositoryProvider = IntakeLogRepositoryProvider._();

final class IntakeLogRepositoryProvider
    extends
        $FunctionalProvider<
          IIntakeLogRepository,
          IIntakeLogRepository,
          IIntakeLogRepository
        >
    with $Provider<IIntakeLogRepository> {
  IntakeLogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'intakeLogRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$intakeLogRepositoryHash();

  @$internal
  @override
  $ProviderElement<IIntakeLogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IIntakeLogRepository create(Ref ref) {
    return intakeLogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IIntakeLogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IIntakeLogRepository>(value),
    );
  }
}

String _$intakeLogRepositoryHash() =>
    r'81afadf78d7dae5b3abdfc1aa0fbd24ff58e4b39';

@ProviderFor(globalIngredientRepository)
final globalIngredientRepositoryProvider =
    GlobalIngredientRepositoryProvider._();

final class GlobalIngredientRepositoryProvider
    extends
        $FunctionalProvider<
          IGlobalIngredientRepository,
          IGlobalIngredientRepository,
          IGlobalIngredientRepository
        >
    with $Provider<IGlobalIngredientRepository> {
  GlobalIngredientRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalIngredientRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalIngredientRepositoryHash();

  @$internal
  @override
  $ProviderElement<IGlobalIngredientRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IGlobalIngredientRepository create(Ref ref) {
    return globalIngredientRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IGlobalIngredientRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IGlobalIngredientRepository>(value),
    );
  }
}

String _$globalIngredientRepositoryHash() =>
    r'bea62230800c79e3f7757126e9c6f888e399832c';

@ProviderFor(wellbeingLogRepository)
final wellbeingLogRepositoryProvider = WellbeingLogRepositoryProvider._();

final class WellbeingLogRepositoryProvider
    extends
        $FunctionalProvider<
          IWellbeingLogRepository,
          IWellbeingLogRepository,
          IWellbeingLogRepository
        >
    with $Provider<IWellbeingLogRepository> {
  WellbeingLogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wellbeingLogRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wellbeingLogRepositoryHash();

  @$internal
  @override
  $ProviderElement<IWellbeingLogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IWellbeingLogRepository create(Ref ref) {
    return wellbeingLogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IWellbeingLogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IWellbeingLogRepository>(value),
    );
  }
}

String _$wellbeingLogRepositoryHash() =>
    r'703c72cb265627ba45100eaa1d94f428e49a06c7';

/// Stream of active courses for [userId] (null = guest mode).

@ProviderFor(activeCourseStream)
final activeCourseStreamProvider = ActiveCourseStreamFamily._();

/// Stream of active courses for [userId] (null = guest mode).

final class ActiveCourseStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Course>>,
          List<Course>,
          Stream<List<Course>>
        >
    with $FutureModifier<List<Course>>, $StreamProvider<List<Course>> {
  /// Stream of active courses for [userId] (null = guest mode).
  ActiveCourseStreamProvider._({
    required ActiveCourseStreamFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'activeCourseStreamProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeCourseStreamHash();

  @override
  String toString() {
    return r'activeCourseStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Course>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Course>> create(Ref ref) {
    final argument = this.argument as String?;
    return activeCourseStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveCourseStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeCourseStreamHash() =>
    r'492226ed9b5c291274b323288e07062c221dc0c0';

/// Stream of active courses for [userId] (null = guest mode).

final class ActiveCourseStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Course>>, String?> {
  ActiveCourseStreamFamily._()
    : super(
        retry: null,
        name: r'activeCourseStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Stream of active courses for [userId] (null = guest mode).

  ActiveCourseStreamProvider call(String? userId) =>
      ActiveCourseStreamProvider._(argument: userId, from: this);

  @override
  String toString() => r'activeCourseStreamProvider';
}

/// Stream of all intake logs for [userId] (null = guest mode).

@ProviderFor(userIntakeLogStream)
final userIntakeLogStreamProvider = UserIntakeLogStreamFamily._();

/// Stream of all intake logs for [userId] (null = guest mode).

final class UserIntakeLogStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IntakeLog>>,
          List<IntakeLog>,
          Stream<List<IntakeLog>>
        >
    with $FutureModifier<List<IntakeLog>>, $StreamProvider<List<IntakeLog>> {
  /// Stream of all intake logs for [userId] (null = guest mode).
  UserIntakeLogStreamProvider._({
    required UserIntakeLogStreamFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'userIntakeLogStreamProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userIntakeLogStreamHash();

  @override
  String toString() {
    return r'userIntakeLogStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<IntakeLog>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<IntakeLog>> create(Ref ref) {
    final argument = this.argument as String?;
    return userIntakeLogStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserIntakeLogStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userIntakeLogStreamHash() =>
    r'6de7c373b04883b55567faf94b9c67ba2d560afb';

/// Stream of all intake logs for [userId] (null = guest mode).

final class UserIntakeLogStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<IntakeLog>>, String?> {
  UserIntakeLogStreamFamily._()
    : super(
        retry: null,
        name: r'userIntakeLogStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Stream of all intake logs for [userId] (null = guest mode).

  UserIntakeLogStreamProvider call(String? userId) =>
      UserIntakeLogStreamProvider._(argument: userId, from: this);

  @override
  String toString() => r'userIntakeLogStreamProvider';
}

/// Stream of all products (global + custom), soft-deleted excluded by repo.

@ProviderFor(allProductStream)
final allProductStreamProvider = AllProductStreamProvider._();

/// Stream of all products (global + custom), soft-deleted excluded by repo.

final class AllProductStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          Stream<List<Product>>
        >
    with $FutureModifier<List<Product>>, $StreamProvider<List<Product>> {
  /// Stream of all products (global + custom), soft-deleted excluded by repo.
  AllProductStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allProductStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allProductStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Product>> create(Ref ref) {
    return allProductStream(ref);
  }
}

String _$allProductStreamHash() => r'6020a8a1cf2711851559a95e0bb888db814c7bd5';

/// Stream of all wellbeing log entries, newest first.

@ProviderFor(allWellbeingLogStream)
final allWellbeingLogStreamProvider = AllWellbeingLogStreamProvider._();

/// Stream of all wellbeing log entries, newest first.

final class AllWellbeingLogStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WellbeingLog>>,
          List<WellbeingLog>,
          Stream<List<WellbeingLog>>
        >
    with
        $FutureModifier<List<WellbeingLog>>,
        $StreamProvider<List<WellbeingLog>> {
  /// Stream of all wellbeing log entries, newest first.
  AllWellbeingLogStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allWellbeingLogStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allWellbeingLogStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<WellbeingLog>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WellbeingLog>> create(Ref ref) {
    return allWellbeingLogStream(ref);
  }
}

String _$allWellbeingLogStreamHash() =>
    r'7709b868b19cba1e7246e4630790cd90a976376d';

/// Stream of the last successful sync timestamp from [SyncMeta].
/// Emits `null` before the first sync has ever run.

@ProviderFor(lastSyncAtStream)
final lastSyncAtStreamProvider = LastSyncAtStreamProvider._();

/// Stream of the last successful sync timestamp from [SyncMeta].
/// Emits `null` before the first sync has ever run.

final class LastSyncAtStreamProvider
    extends
        $FunctionalProvider<AsyncValue<DateTime?>, DateTime?, Stream<DateTime?>>
    with $FutureModifier<DateTime?>, $StreamProvider<DateTime?> {
  /// Stream of the last successful sync timestamp from [SyncMeta].
  /// Emits `null` before the first sync has ever run.
  LastSyncAtStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastSyncAtStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastSyncAtStreamHash();

  @$internal
  @override
  $StreamProviderElement<DateTime?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<DateTime?> create(Ref ref) {
    return lastSyncAtStream(ref);
  }
}

String _$lastSyncAtStreamHash() => r'34f5a6886d16a2ef64288e78eab7aefa8b5cc104';
