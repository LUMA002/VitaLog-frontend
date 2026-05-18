// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($ProductsTable.$converterupdatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> deletedAt =
      GeneratedColumn<int>(
        'deleted_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($ProductsTable.$converterdeletedAtn);
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<int> pendingSync = GeneratedColumn<int>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creatorUserIdMeta = const VerificationMeta(
    'creatorUserId',
  );
  @override
  late final GeneratedColumn<String> creatorUserId = GeneratedColumn<String>(
    'creator_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLocalDraftMeta = const VerificationMeta(
    'isLocalDraft',
  );
  @override
  late final GeneratedColumn<int> isLocalDraft = GeneratedColumn<int>(
    'is_local_draft',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    name,
    description,
    creatorUserId,
    isLocalDraft,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('creator_user_id')) {
      context.handle(
        _creatorUserIdMeta,
        creatorUserId.isAcceptableOrUnknown(
          data['creator_user_id']!,
          _creatorUserIdMeta,
        ),
      );
    }
    if (data.containsKey('is_local_draft')) {
      context.handle(
        _isLocalDraftMeta,
        isLocalDraft.isAcceptableOrUnknown(
          data['is_local_draft']!,
          _isLocalDraftMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: $ProductsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      deletedAt: $ProductsTable.$converterdeletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}deleted_at'],
        ),
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_sync'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      creatorUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creator_user_id'],
      ),
      isLocalDraft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_local_draft'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterdeletedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterdeletedAtn =
      JsonTypeConverter2.asNullable($converterdeletedAt);
}

class ProductsData extends DataClass implements Insertable<ProductsData> {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  final String id;

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  final DateTime updatedAt;

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  final DateTime? deletedAt;

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  final int pendingSync;
  final String name;
  final String? description;

  /// NULL  = global product (server-seeded, no owner).
  /// Guest = NULL until claimed via [DataClaimUseCase].
  final String? creatorUserId;

  /// 1 = created locally (offline/guest). 0 = fetched from server.
  /// This distinguishes guest-created products from cached global products
  /// that also have a NULL [creatorUserId].
  final int isLocalDraft;
  const ProductsData({
    required this.id,
    required this.updatedAt,
    this.deletedAt,
    required this.pendingSync,
    required this.name,
    this.description,
    this.creatorUserId,
    required this.isLocalDraft,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['updated_at'] = Variable<int>(
        $ProductsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(
        $ProductsTable.$converterdeletedAtn.toSql(deletedAt),
      );
    }
    map['pending_sync'] = Variable<int>(pendingSync);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || creatorUserId != null) {
      map['creator_user_id'] = Variable<String>(creatorUserId);
    }
    map['is_local_draft'] = Variable<int>(isLocalDraft);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      pendingSync: Value(pendingSync),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      creatorUserId: creatorUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorUserId),
      isLocalDraft: Value(isLocalDraft),
    );
  }

  factory ProductsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: $ProductsTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      deletedAt: $ProductsTable.$converterdeletedAtn.fromJson(
        serializer.fromJson<String?>(json['deletedAt']),
      ),
      pendingSync: serializer.fromJson<int>(json['pendingSync']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      creatorUserId: serializer.fromJson<String?>(json['creatorUserId']),
      isLocalDraft: serializer.fromJson<int>(json['isLocalDraft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<String>(
        $ProductsTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'deletedAt': serializer.toJson<String?>(
        $ProductsTable.$converterdeletedAtn.toJson(deletedAt),
      ),
      'pendingSync': serializer.toJson<int>(pendingSync),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'creatorUserId': serializer.toJson<String?>(creatorUserId),
      'isLocalDraft': serializer.toJson<int>(isLocalDraft),
    };
  }

  ProductsData copyWith({
    String? id,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? pendingSync,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> creatorUserId = const Value.absent(),
    int? isLocalDraft,
  }) => ProductsData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    creatorUserId: creatorUserId.present
        ? creatorUserId.value
        : this.creatorUserId,
    isLocalDraft: isLocalDraft ?? this.isLocalDraft,
  );
  ProductsData copyWithCompanion(ProductsCompanion data) {
    return ProductsData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      creatorUserId: data.creatorUserId.present
          ? data.creatorUserId.value
          : this.creatorUserId,
      isLocalDraft: data.isLocalDraft.present
          ? data.isLocalDraft.value
          : this.isLocalDraft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('creatorUserId: $creatorUserId, ')
          ..write('isLocalDraft: $isLocalDraft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    name,
    description,
    creatorUserId,
    isLocalDraft,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.pendingSync == this.pendingSync &&
          other.name == this.name &&
          other.description == this.description &&
          other.creatorUserId == this.creatorUserId &&
          other.isLocalDraft == this.isLocalDraft);
}

class ProductsCompanion extends UpdateCompanion<ProductsData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> pendingSync;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> creatorUserId;
  final Value<int> isLocalDraft;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.creatorUserId = const Value.absent(),
    this.isLocalDraft = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.creatorUserId = const Value.absent(),
    this.isLocalDraft = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       updatedAt = Value(updatedAt),
       name = Value(name);
  static Insertable<ProductsData> custom({
    Expression<String>? id,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? pendingSync,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? creatorUserId,
    Expression<int>? isLocalDraft,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (creatorUserId != null) 'creator_user_id': creatorUserId,
      if (isLocalDraft != null) 'is_local_draft': isLocalDraft,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? pendingSync,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? creatorUserId,
    Value<int>? isLocalDraft,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      name: name ?? this.name,
      description: description ?? this.description,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      isLocalDraft: isLocalDraft ?? this.isLocalDraft,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $ProductsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(
        $ProductsTable.$converterdeletedAtn.toSql(deletedAt.value),
      );
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<int>(pendingSync.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (creatorUserId.present) {
      map['creator_user_id'] = Variable<String>(creatorUserId.value);
    }
    if (isLocalDraft.present) {
      map['is_local_draft'] = Variable<int>(isLocalDraft.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('creatorUserId: $creatorUserId, ')
          ..write('isLocalDraft: $isLocalDraft, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductIngredientsTable extends ProductIngredients
    with TableInfo<$ProductIngredientsTable, ProductIngredientsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($ProductIngredientsTable.$converterupdatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> deletedAt =
      GeneratedColumn<int>(
        'deleted_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($ProductIngredientsTable.$converterdeletedAtn);
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<int> pendingSync = GeneratedColumn<int>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<String> ingredientId = GeneratedColumn<String>(
    'ingredient_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customIngredientNameMeta =
      const VerificationMeta('customIngredientName');
  @override
  late final GeneratedColumn<String>
  customIngredientName = GeneratedColumn<String>(
    'custom_ingredient_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'NULL CHECK ((ingredient_id IS NULL) != (custom_ingredient_name IS NULL))',
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (amount > 0)',
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    productId,
    ingredientId,
    customIngredientName,
    amount,
    unit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductIngredientsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    }
    if (data.containsKey('custom_ingredient_name')) {
      context.handle(
        _customIngredientNameMeta,
        customIngredientName.isAcceptableOrUnknown(
          data['custom_ingredient_name']!,
          _customIngredientNameMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductIngredientsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductIngredientsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: $ProductIngredientsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      deletedAt: $ProductIngredientsTable.$converterdeletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}deleted_at'],
        ),
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_sync'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_id'],
      ),
      customIngredientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_ingredient_name'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $ProductIngredientsTable createAlias(String alias) {
    return $ProductIngredientsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterdeletedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterdeletedAtn =
      JsonTypeConverter2.asNullable($converterdeletedAt);
}

class ProductIngredientsData extends DataClass
    implements Insertable<ProductIngredientsData> {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  final String id;

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  final DateTime updatedAt;

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  final DateTime? deletedAt;

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  final int pendingSync;
  final String productId;

  /// FK to `GlobalIngredients.id`. NULL when using a custom ingredient name.
  final String? ingredientId;

  /// Free-text ingredient name. NULL when referencing a [GlobalIngredients] row.
  /// The CHECK here enforces the XOR rule with [ingredientId].
  final String? customIngredientName;

  /// Per-serving amount. Must be > 0.
  final double amount;
  final String unit;
  const ProductIngredientsData({
    required this.id,
    required this.updatedAt,
    this.deletedAt,
    required this.pendingSync,
    required this.productId,
    this.ingredientId,
    this.customIngredientName,
    required this.amount,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['updated_at'] = Variable<int>(
        $ProductIngredientsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(
        $ProductIngredientsTable.$converterdeletedAtn.toSql(deletedAt),
      );
    }
    map['pending_sync'] = Variable<int>(pendingSync);
    map['product_id'] = Variable<String>(productId);
    if (!nullToAbsent || ingredientId != null) {
      map['ingredient_id'] = Variable<String>(ingredientId);
    }
    if (!nullToAbsent || customIngredientName != null) {
      map['custom_ingredient_name'] = Variable<String>(customIngredientName);
    }
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  ProductIngredientsCompanion toCompanion(bool nullToAbsent) {
    return ProductIngredientsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      pendingSync: Value(pendingSync),
      productId: Value(productId),
      ingredientId: ingredientId == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientId),
      customIngredientName: customIngredientName == null && nullToAbsent
          ? const Value.absent()
          : Value(customIngredientName),
      amount: Value(amount),
      unit: Value(unit),
    );
  }

  factory ProductIngredientsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductIngredientsData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: $ProductIngredientsTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      deletedAt: $ProductIngredientsTable.$converterdeletedAtn.fromJson(
        serializer.fromJson<String?>(json['deletedAt']),
      ),
      pendingSync: serializer.fromJson<int>(json['pendingSync']),
      productId: serializer.fromJson<String>(json['productId']),
      ingredientId: serializer.fromJson<String?>(json['ingredientId']),
      customIngredientName: serializer.fromJson<String?>(
        json['customIngredientName'],
      ),
      amount: serializer.fromJson<double>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<String>(
        $ProductIngredientsTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'deletedAt': serializer.toJson<String?>(
        $ProductIngredientsTable.$converterdeletedAtn.toJson(deletedAt),
      ),
      'pendingSync': serializer.toJson<int>(pendingSync),
      'productId': serializer.toJson<String>(productId),
      'ingredientId': serializer.toJson<String?>(ingredientId),
      'customIngredientName': serializer.toJson<String?>(customIngredientName),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(unit),
    };
  }

  ProductIngredientsData copyWith({
    String? id,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? pendingSync,
    String? productId,
    Value<String?> ingredientId = const Value.absent(),
    Value<String?> customIngredientName = const Value.absent(),
    double? amount,
    String? unit,
  }) => ProductIngredientsData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    productId: productId ?? this.productId,
    ingredientId: ingredientId.present ? ingredientId.value : this.ingredientId,
    customIngredientName: customIngredientName.present
        ? customIngredientName.value
        : this.customIngredientName,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
  );
  ProductIngredientsData copyWithCompanion(ProductIngredientsCompanion data) {
    return ProductIngredientsData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      productId: data.productId.present ? data.productId.value : this.productId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      customIngredientName: data.customIngredientName.present
          ? data.customIngredientName.value
          : this.customIngredientName,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductIngredientsData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('productId: $productId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('customIngredientName: $customIngredientName, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    productId,
    ingredientId,
    customIngredientName,
    amount,
    unit,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductIngredientsData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.pendingSync == this.pendingSync &&
          other.productId == this.productId &&
          other.ingredientId == this.ingredientId &&
          other.customIngredientName == this.customIngredientName &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class ProductIngredientsCompanion
    extends UpdateCompanion<ProductIngredientsData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> pendingSync;
  final Value<String> productId;
  final Value<String?> ingredientId;
  final Value<String?> customIngredientName;
  final Value<double> amount;
  final Value<String> unit;
  final Value<int> rowid;
  const ProductIngredientsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.productId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.customIngredientName = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductIngredientsCompanion.insert({
    required String id,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    required String productId,
    this.ingredientId = const Value.absent(),
    this.customIngredientName = const Value.absent(),
    required double amount,
    required String unit,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       updatedAt = Value(updatedAt),
       productId = Value(productId),
       amount = Value(amount),
       unit = Value(unit);
  static Insertable<ProductIngredientsData> custom({
    Expression<String>? id,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? pendingSync,
    Expression<String>? productId,
    Expression<String>? ingredientId,
    Expression<String>? customIngredientName,
    Expression<double>? amount,
    Expression<String>? unit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (productId != null) 'product_id': productId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (customIngredientName != null)
        'custom_ingredient_name': customIngredientName,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductIngredientsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? pendingSync,
    Value<String>? productId,
    Value<String?>? ingredientId,
    Value<String?>? customIngredientName,
    Value<double>? amount,
    Value<String>? unit,
    Value<int>? rowid,
  }) {
    return ProductIngredientsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      productId: productId ?? this.productId,
      ingredientId: ingredientId ?? this.ingredientId,
      customIngredientName: customIngredientName ?? this.customIngredientName,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $ProductIngredientsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(
        $ProductIngredientsTable.$converterdeletedAtn.toSql(deletedAt.value),
      );
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<int>(pendingSync.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<String>(ingredientId.value);
    }
    if (customIngredientName.present) {
      map['custom_ingredient_name'] = Variable<String>(
        customIngredientName.value,
      );
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('productId: $productId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('customIngredientName: $customIngredientName, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CoursesTable extends Courses with TableInfo<$CoursesTable, CoursesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($CoursesTable.$converterupdatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> deletedAt =
      GeneratedColumn<int>(
        'deleted_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($CoursesTable.$converterdeletedAtn);
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<int> pendingSync = GeneratedColumn<int>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _servingSizeMeta = const VerificationMeta(
    'servingSize',
  );
  @override
  late final GeneratedColumn<double> servingSize = GeneratedColumn<double>(
    'serving_size',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (serving_size > 0)',
  );
  static const VerificationMeta _timeOfDayMeta = const VerificationMeta(
    'timeOfDay',
  );
  @override
  late final GeneratedColumn<int> timeOfDay = GeneratedColumn<int>(
    'time_of_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (time_of_day BETWEEN 0 AND 86399)',
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints:
        'NULL CHECK (end_date IS NULL OR end_date >= start_date)',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    userId,
    productId,
    servingSize,
    timeOfDay,
    startDate,
    endDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoursesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('serving_size')) {
      context.handle(
        _servingSizeMeta,
        servingSize.isAcceptableOrUnknown(
          data['serving_size']!,
          _servingSizeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servingSizeMeta);
    }
    if (data.containsKey('time_of_day')) {
      context.handle(
        _timeOfDayMeta,
        timeOfDay.isAcceptableOrUnknown(data['time_of_day']!, _timeOfDayMeta),
      );
    } else if (isInserting) {
      context.missing(_timeOfDayMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoursesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoursesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: $CoursesTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      deletedAt: $CoursesTable.$converterdeletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}deleted_at'],
        ),
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_sync'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      servingSize: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}serving_size'],
      )!,
      timeOfDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time_of_day'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      ),
    );
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterdeletedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterdeletedAtn =
      JsonTypeConverter2.asNullable($converterdeletedAt);
}

class CoursesData extends DataClass implements Insertable<CoursesData> {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  final String id;

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  final DateTime updatedAt;

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  final DateTime? deletedAt;

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  final int pendingSync;

  /// NULL in guest mode; stamped on login via DataClaimUseCase.
  final String? userId;
  final String productId;

  /// Number of servings per intake. Must be > 0.
  final double servingSize;

  /// Seconds since midnight UTC (0 – 86 399). Mirrors backend `TimeOnly`.
  final int timeOfDay;

  /// Epoch-days UTC (millisecondsSinceEpoch ~/ 86_400_000).
  final int startDate;

  /// NULL = open-ended course. Must be >= [startDate] when set.
  final int? endDate;
  const CoursesData({
    required this.id,
    required this.updatedAt,
    this.deletedAt,
    required this.pendingSync,
    this.userId,
    required this.productId,
    required this.servingSize,
    required this.timeOfDay,
    required this.startDate,
    this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['updated_at'] = Variable<int>(
        $CoursesTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(
        $CoursesTable.$converterdeletedAtn.toSql(deletedAt),
      );
    }
    map['pending_sync'] = Variable<int>(pendingSync);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['product_id'] = Variable<String>(productId);
    map['serving_size'] = Variable<double>(servingSize);
    map['time_of_day'] = Variable<int>(timeOfDay);
    map['start_date'] = Variable<int>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<int>(endDate);
    }
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      pendingSync: Value(pendingSync),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      productId: Value(productId),
      servingSize: Value(servingSize),
      timeOfDay: Value(timeOfDay),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory CoursesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoursesData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: $CoursesTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      deletedAt: $CoursesTable.$converterdeletedAtn.fromJson(
        serializer.fromJson<String?>(json['deletedAt']),
      ),
      pendingSync: serializer.fromJson<int>(json['pendingSync']),
      userId: serializer.fromJson<String?>(json['userId']),
      productId: serializer.fromJson<String>(json['productId']),
      servingSize: serializer.fromJson<double>(json['servingSize']),
      timeOfDay: serializer.fromJson<int>(json['timeOfDay']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<String>(
        $CoursesTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'deletedAt': serializer.toJson<String?>(
        $CoursesTable.$converterdeletedAtn.toJson(deletedAt),
      ),
      'pendingSync': serializer.toJson<int>(pendingSync),
      'userId': serializer.toJson<String?>(userId),
      'productId': serializer.toJson<String>(productId),
      'servingSize': serializer.toJson<double>(servingSize),
      'timeOfDay': serializer.toJson<int>(timeOfDay),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int?>(endDate),
    };
  }

  CoursesData copyWith({
    String? id,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? pendingSync,
    Value<String?> userId = const Value.absent(),
    String? productId,
    double? servingSize,
    int? timeOfDay,
    int? startDate,
    Value<int?> endDate = const Value.absent(),
  }) => CoursesData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    userId: userId.present ? userId.value : this.userId,
    productId: productId ?? this.productId,
    servingSize: servingSize ?? this.servingSize,
    timeOfDay: timeOfDay ?? this.timeOfDay,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
  );
  CoursesData copyWithCompanion(CoursesCompanion data) {
    return CoursesData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      userId: data.userId.present ? data.userId.value : this.userId,
      productId: data.productId.present ? data.productId.value : this.productId,
      servingSize: data.servingSize.present
          ? data.servingSize.value
          : this.servingSize,
      timeOfDay: data.timeOfDay.present ? data.timeOfDay.value : this.timeOfDay,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoursesData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId, ')
          ..write('servingSize: $servingSize, ')
          ..write('timeOfDay: $timeOfDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    userId,
    productId,
    servingSize,
    timeOfDay,
    startDate,
    endDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoursesData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.pendingSync == this.pendingSync &&
          other.userId == this.userId &&
          other.productId == this.productId &&
          other.servingSize == this.servingSize &&
          other.timeOfDay == this.timeOfDay &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class CoursesCompanion extends UpdateCompanion<CoursesData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> pendingSync;
  final Value<String?> userId;
  final Value<String> productId;
  final Value<double> servingSize;
  final Value<int> timeOfDay;
  final Value<int> startDate;
  final Value<int?> endDate;
  final Value<int> rowid;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.userId = const Value.absent(),
    this.productId = const Value.absent(),
    this.servingSize = const Value.absent(),
    this.timeOfDay = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoursesCompanion.insert({
    required String id,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.userId = const Value.absent(),
    required String productId,
    required double servingSize,
    required int timeOfDay,
    required int startDate,
    this.endDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       updatedAt = Value(updatedAt),
       productId = Value(productId),
       servingSize = Value(servingSize),
       timeOfDay = Value(timeOfDay),
       startDate = Value(startDate);
  static Insertable<CoursesData> custom({
    Expression<String>? id,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? pendingSync,
    Expression<String>? userId,
    Expression<String>? productId,
    Expression<double>? servingSize,
    Expression<int>? timeOfDay,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (userId != null) 'user_id': userId,
      if (productId != null) 'product_id': productId,
      if (servingSize != null) 'serving_size': servingSize,
      if (timeOfDay != null) 'time_of_day': timeOfDay,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoursesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? pendingSync,
    Value<String?>? userId,
    Value<String>? productId,
    Value<double>? servingSize,
    Value<int>? timeOfDay,
    Value<int>? startDate,
    Value<int?>? endDate,
    Value<int>? rowid,
  }) {
    return CoursesCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      servingSize: servingSize ?? this.servingSize,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $CoursesTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(
        $CoursesTable.$converterdeletedAtn.toSql(deletedAt.value),
      );
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<int>(pendingSync.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (servingSize.present) {
      map['serving_size'] = Variable<double>(servingSize.value);
    }
    if (timeOfDay.present) {
      map['time_of_day'] = Variable<int>(timeOfDay.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId, ')
          ..write('servingSize: $servingSize, ')
          ..write('timeOfDay: $timeOfDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IntakeLogsTable extends IntakeLogs
    with TableInfo<$IntakeLogsTable, IntakeLogsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntakeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($IntakeLogsTable.$converterupdatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> deletedAt =
      GeneratedColumn<int>(
        'deleted_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($IntakeLogsTable.$converterdeletedAtn);
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<int> pendingSync = GeneratedColumn<int>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES courses (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actualServingSizeMeta = const VerificationMeta(
    'actualServingSize',
  );
  @override
  late final GeneratedColumn<double> actualServingSize =
      GeneratedColumn<double>(
        'actual_serving_size',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL CHECK (actual_serving_size > 0)',
      );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> takenAt =
      GeneratedColumn<int>(
        'taken_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($IntakeLogsTable.$convertertakenAt);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    courseId,
    userId,
    actualServingSize,
    takenAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intake_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<IntakeLogsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('actual_serving_size')) {
      context.handle(
        _actualServingSizeMeta,
        actualServingSize.isAcceptableOrUnknown(
          data['actual_serving_size']!,
          _actualServingSizeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actualServingSizeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntakeLogsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntakeLogsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: $IntakeLogsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      deletedAt: $IntakeLogsTable.$converterdeletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}deleted_at'],
        ),
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_sync'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      actualServingSize: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}actual_serving_size'],
      )!,
      takenAt: $IntakeLogsTable.$convertertakenAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}taken_at'],
        )!,
      ),
    );
  }

  @override
  $IntakeLogsTable createAlias(String alias) {
    return $IntakeLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterdeletedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterdeletedAtn =
      JsonTypeConverter2.asNullable($converterdeletedAt);
  static JsonTypeConverter2<DateTime, int, String> $convertertakenAt =
      const MicrosecondDateTimeConverter();
}

class IntakeLogsData extends DataClass implements Insertable<IntakeLogsData> {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  final String id;

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  final DateTime updatedAt;

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  final DateTime? deletedAt;

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  final int pendingSync;
  final String courseId;

  /// Denormalized from parent course. NULL while in guest mode.
  final String? userId;

  /// Snapshot of the serving size at the time of intake. Must be > 0.
  final double actualServingSize;

  /// Exact UTC moment the supplement was taken.
  /// Column<int> = SQL INTEGER; data class exposes `DateTime` via converter.
  final DateTime takenAt;
  const IntakeLogsData({
    required this.id,
    required this.updatedAt,
    this.deletedAt,
    required this.pendingSync,
    required this.courseId,
    this.userId,
    required this.actualServingSize,
    required this.takenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['updated_at'] = Variable<int>(
        $IntakeLogsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(
        $IntakeLogsTable.$converterdeletedAtn.toSql(deletedAt),
      );
    }
    map['pending_sync'] = Variable<int>(pendingSync);
    map['course_id'] = Variable<String>(courseId);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['actual_serving_size'] = Variable<double>(actualServingSize);
    {
      map['taken_at'] = Variable<int>(
        $IntakeLogsTable.$convertertakenAt.toSql(takenAt),
      );
    }
    return map;
  }

  IntakeLogsCompanion toCompanion(bool nullToAbsent) {
    return IntakeLogsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      pendingSync: Value(pendingSync),
      courseId: Value(courseId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      actualServingSize: Value(actualServingSize),
      takenAt: Value(takenAt),
    );
  }

  factory IntakeLogsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntakeLogsData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: $IntakeLogsTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      deletedAt: $IntakeLogsTable.$converterdeletedAtn.fromJson(
        serializer.fromJson<String?>(json['deletedAt']),
      ),
      pendingSync: serializer.fromJson<int>(json['pendingSync']),
      courseId: serializer.fromJson<String>(json['courseId']),
      userId: serializer.fromJson<String?>(json['userId']),
      actualServingSize: serializer.fromJson<double>(json['actualServingSize']),
      takenAt: $IntakeLogsTable.$convertertakenAt.fromJson(
        serializer.fromJson<String>(json['takenAt']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<String>(
        $IntakeLogsTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'deletedAt': serializer.toJson<String?>(
        $IntakeLogsTable.$converterdeletedAtn.toJson(deletedAt),
      ),
      'pendingSync': serializer.toJson<int>(pendingSync),
      'courseId': serializer.toJson<String>(courseId),
      'userId': serializer.toJson<String?>(userId),
      'actualServingSize': serializer.toJson<double>(actualServingSize),
      'takenAt': serializer.toJson<String>(
        $IntakeLogsTable.$convertertakenAt.toJson(takenAt),
      ),
    };
  }

  IntakeLogsData copyWith({
    String? id,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? pendingSync,
    String? courseId,
    Value<String?> userId = const Value.absent(),
    double? actualServingSize,
    DateTime? takenAt,
  }) => IntakeLogsData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    courseId: courseId ?? this.courseId,
    userId: userId.present ? userId.value : this.userId,
    actualServingSize: actualServingSize ?? this.actualServingSize,
    takenAt: takenAt ?? this.takenAt,
  );
  IntakeLogsData copyWithCompanion(IntakeLogsCompanion data) {
    return IntakeLogsData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      userId: data.userId.present ? data.userId.value : this.userId,
      actualServingSize: data.actualServingSize.present
          ? data.actualServingSize.value
          : this.actualServingSize,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntakeLogsData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('courseId: $courseId, ')
          ..write('userId: $userId, ')
          ..write('actualServingSize: $actualServingSize, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    courseId,
    userId,
    actualServingSize,
    takenAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntakeLogsData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.pendingSync == this.pendingSync &&
          other.courseId == this.courseId &&
          other.userId == this.userId &&
          other.actualServingSize == this.actualServingSize &&
          other.takenAt == this.takenAt);
}

class IntakeLogsCompanion extends UpdateCompanion<IntakeLogsData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> pendingSync;
  final Value<String> courseId;
  final Value<String?> userId;
  final Value<double> actualServingSize;
  final Value<DateTime> takenAt;
  final Value<int> rowid;
  const IntakeLogsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.courseId = const Value.absent(),
    this.userId = const Value.absent(),
    this.actualServingSize = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IntakeLogsCompanion.insert({
    required String id,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    required String courseId,
    this.userId = const Value.absent(),
    required double actualServingSize,
    required DateTime takenAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       updatedAt = Value(updatedAt),
       courseId = Value(courseId),
       actualServingSize = Value(actualServingSize),
       takenAt = Value(takenAt);
  static Insertable<IntakeLogsData> custom({
    Expression<String>? id,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? pendingSync,
    Expression<String>? courseId,
    Expression<String>? userId,
    Expression<double>? actualServingSize,
    Expression<int>? takenAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (courseId != null) 'course_id': courseId,
      if (userId != null) 'user_id': userId,
      if (actualServingSize != null) 'actual_serving_size': actualServingSize,
      if (takenAt != null) 'taken_at': takenAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IntakeLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? pendingSync,
    Value<String>? courseId,
    Value<String?>? userId,
    Value<double>? actualServingSize,
    Value<DateTime>? takenAt,
    Value<int>? rowid,
  }) {
    return IntakeLogsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      actualServingSize: actualServingSize ?? this.actualServingSize,
      takenAt: takenAt ?? this.takenAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $IntakeLogsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(
        $IntakeLogsTable.$converterdeletedAtn.toSql(deletedAt.value),
      );
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<int>(pendingSync.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (actualServingSize.present) {
      map['actual_serving_size'] = Variable<double>(actualServingSize.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<int>(
        $IntakeLogsTable.$convertertakenAt.toSql(takenAt.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntakeLogsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('courseId: $courseId, ')
          ..write('userId: $userId, ')
          ..write('actualServingSize: $actualServingSize, ')
          ..write('takenAt: $takenAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GlobalIngredientsTable extends GlobalIngredients
    with TableInfo<$GlobalIngredientsTable, GlobalIngredientsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GlobalIngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($GlobalIngredientsTable.$converterupdatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> deletedAt =
      GeneratedColumn<int>(
        'deleted_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($GlobalIngredientsTable.$converterdeletedAtn);
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<int> pendingSync = GeneratedColumn<int>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultUnitMeta = const VerificationMeta(
    'defaultUnit',
  );
  @override
  late final GeneratedColumn<String> defaultUnit = GeneratedColumn<String>(
    'default_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    name,
    defaultUnit,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'global_ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<GlobalIngredientsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('default_unit')) {
      context.handle(
        _defaultUnitMeta,
        defaultUnit.isAcceptableOrUnknown(
          data['default_unit']!,
          _defaultUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultUnitMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GlobalIngredientsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GlobalIngredientsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: $GlobalIngredientsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      deletedAt: $GlobalIngredientsTable.$converterdeletedAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}deleted_at'],
        ),
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_sync'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      defaultUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_unit'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  $GlobalIngredientsTable createAlias(String alias) {
    return $GlobalIngredientsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterdeletedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterdeletedAtn =
      JsonTypeConverter2.asNullable($converterdeletedAt);
}

class GlobalIngredientsData extends DataClass
    implements Insertable<GlobalIngredientsData> {
  /// UUID v4. Each concrete table must declare `{id}` in its [primaryKey].
  final String id;

  /// Stored as INTEGER microsecondsSinceEpoch (UTC). See [MicrosecondDateTimeConverter].
  /// Return type is `Column<int>` (the SQL storage type); the [MicrosecondDateTimeConverter]
  /// makes data-class properties typed as `DateTime`.
  final DateTime updatedAt;

  /// NULL = alive row. Non-null = soft-deleted (matches backend semantics).
  final DateTime? deletedAt;

  /// Dirty flag: 1 = needs to be pushed to server, 0 = in sync with server.
  final int pendingSync;
  final String name;
  final String defaultUnit;

  /// [IngredientCategory] enum index. See domain model for mapping.
  final int category;
  const GlobalIngredientsData({
    required this.id,
    required this.updatedAt,
    this.deletedAt,
    required this.pendingSync,
    required this.name,
    required this.defaultUnit,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['updated_at'] = Variable<int>(
        $GlobalIngredientsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<int>(
        $GlobalIngredientsTable.$converterdeletedAtn.toSql(deletedAt),
      );
    }
    map['pending_sync'] = Variable<int>(pendingSync);
    map['name'] = Variable<String>(name);
    map['default_unit'] = Variable<String>(defaultUnit);
    map['category'] = Variable<int>(category);
    return map;
  }

  GlobalIngredientsCompanion toCompanion(bool nullToAbsent) {
    return GlobalIngredientsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      pendingSync: Value(pendingSync),
      name: Value(name),
      defaultUnit: Value(defaultUnit),
      category: Value(category),
    );
  }

  factory GlobalIngredientsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GlobalIngredientsData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: $GlobalIngredientsTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      deletedAt: $GlobalIngredientsTable.$converterdeletedAtn.fromJson(
        serializer.fromJson<String?>(json['deletedAt']),
      ),
      pendingSync: serializer.fromJson<int>(json['pendingSync']),
      name: serializer.fromJson<String>(json['name']),
      defaultUnit: serializer.fromJson<String>(json['defaultUnit']),
      category: serializer.fromJson<int>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<String>(
        $GlobalIngredientsTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'deletedAt': serializer.toJson<String?>(
        $GlobalIngredientsTable.$converterdeletedAtn.toJson(deletedAt),
      ),
      'pendingSync': serializer.toJson<int>(pendingSync),
      'name': serializer.toJson<String>(name),
      'defaultUnit': serializer.toJson<String>(defaultUnit),
      'category': serializer.toJson<int>(category),
    };
  }

  GlobalIngredientsData copyWith({
    String? id,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? pendingSync,
    String? name,
    String? defaultUnit,
    int? category,
  }) => GlobalIngredientsData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    name: name ?? this.name,
    defaultUnit: defaultUnit ?? this.defaultUnit,
    category: category ?? this.category,
  );
  GlobalIngredientsData copyWithCompanion(GlobalIngredientsCompanion data) {
    return GlobalIngredientsData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      name: data.name.present ? data.name.value : this.name,
      defaultUnit: data.defaultUnit.present
          ? data.defaultUnit.value
          : this.defaultUnit,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GlobalIngredientsData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('name: $name, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    deletedAt,
    pendingSync,
    name,
    defaultUnit,
    category,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GlobalIngredientsData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.pendingSync == this.pendingSync &&
          other.name == this.name &&
          other.defaultUnit == this.defaultUnit &&
          other.category == this.category);
}

class GlobalIngredientsCompanion
    extends UpdateCompanion<GlobalIngredientsData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> pendingSync;
  final Value<String> name;
  final Value<String> defaultUnit;
  final Value<int> category;
  final Value<int> rowid;
  const GlobalIngredientsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GlobalIngredientsCompanion.insert({
    required String id,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    required String name,
    required String defaultUnit,
    required int category,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       updatedAt = Value(updatedAt),
       name = Value(name),
       defaultUnit = Value(defaultUnit),
       category = Value(category);
  static Insertable<GlobalIngredientsData> custom({
    Expression<String>? id,
    Expression<int>? updatedAt,
    Expression<int>? deletedAt,
    Expression<int>? pendingSync,
    Expression<String>? name,
    Expression<String>? defaultUnit,
    Expression<int>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (name != null) 'name': name,
      if (defaultUnit != null) 'default_unit': defaultUnit,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GlobalIngredientsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? pendingSync,
    Value<String>? name,
    Value<String>? defaultUnit,
    Value<int>? category,
    Value<int>? rowid,
  }) {
    return GlobalIngredientsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      name: name ?? this.name,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $GlobalIngredientsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<int>(
        $GlobalIngredientsTable.$converterdeletedAtn.toSql(deletedAt.value),
      );
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<int>(pendingSync.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (defaultUnit.present) {
      map['default_unit'] = Variable<String>(defaultUnit.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlobalIngredientsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('name: $name, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WellbeingLogsTable extends WellbeingLogs
    with TableInfo<$WellbeingLogsTable, WellbeingLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WellbeingLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> recordedAt =
      GeneratedColumn<int>(
        'recorded_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($WellbeingLogsTable.$converterrecordedAt);
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
    'mood',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (mood BETWEEN 1 AND 5)',
  );
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
    'energy',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK (energy BETWEEN 1 AND 5)',
  );
  static const VerificationMeta _sleepHoursMeta = const VerificationMeta(
    'sleepHours',
  );
  @override
  late final GeneratedColumn<double> sleepHours = GeneratedColumn<double>(
    'sleep_hours',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints:
        'NULL CHECK (sleep_hours IS NULL OR sleep_hours BETWEEN 0 AND 24)',
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 2000),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> createdAt =
      GeneratedColumn<int>(
        'created_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($WellbeingLogsTable.$convertercreatedAt);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>(
        'updated_at',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($WellbeingLogsTable.$converterupdatedAt);
  static const VerificationMeta _syncFlagsMeta = const VerificationMeta(
    'syncFlags',
  );
  @override
  late final GeneratedColumn<int> syncFlags = GeneratedColumn<int>(
    'sync_flags',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recordedAt,
    mood,
    energy,
    sleepHours,
    notes,
    createdAt,
    updatedAt,
    syncFlags,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wellbeing_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WellbeingLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('energy')) {
      context.handle(
        _energyMeta,
        energy.isAcceptableOrUnknown(data['energy']!, _energyMeta),
      );
    } else if (isInserting) {
      context.missing(_energyMeta);
    }
    if (data.containsKey('sleep_hours')) {
      context.handle(
        _sleepHoursMeta,
        sleepHours.isAcceptableOrUnknown(data['sleep_hours']!, _sleepHoursMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('sync_flags')) {
      context.handle(
        _syncFlagsMeta,
        syncFlags.isAcceptableOrUnknown(data['sync_flags']!, _syncFlagsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WellbeingLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WellbeingLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recordedAt: $WellbeingLogsTable.$converterrecordedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}recorded_at'],
        )!,
      ),
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood'],
      )!,
      energy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy'],
      )!,
      sleepHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sleep_hours'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: $WellbeingLogsTable.$convertercreatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_at'],
        )!,
      ),
      updatedAt: $WellbeingLogsTable.$converterupdatedAt.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}updated_at'],
        )!,
      ),
      syncFlags: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_flags'],
      )!,
    );
  }

  @override
  $WellbeingLogsTable createAlias(String alias) {
    return $WellbeingLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterrecordedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $convertercreatedAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime, int, String> $converterupdatedAt =
      const MicrosecondDateTimeConverter();
}

class WellbeingLogData extends DataClass
    implements Insertable<WellbeingLogData> {
  final String id;

  /// The date this entry describes (not the time it was created).
  /// Column<int> = SQL INTEGER; data class exposes `DateTime` via converter.
  final DateTime recordedAt;

  /// Subjective mood score: 1 (terrible) – 5 (great).
  final int mood;

  /// Subjective energy score: 1 (exhausted) – 5 (energized).
  final int energy;

  /// Hours of sleep. NULL = not recorded. Clamped to 0–24.
  final double? sleepHours;

  /// Free-form notes. Max 2 000 characters (enforced at repository layer).
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Reserved for future sync promotion. Always 0 in V2.
  final int syncFlags;
  const WellbeingLogData({
    required this.id,
    required this.recordedAt,
    required this.mood,
    required this.energy,
    this.sleepHours,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.syncFlags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['recorded_at'] = Variable<int>(
        $WellbeingLogsTable.$converterrecordedAt.toSql(recordedAt),
      );
    }
    map['mood'] = Variable<int>(mood);
    map['energy'] = Variable<int>(energy);
    if (!nullToAbsent || sleepHours != null) {
      map['sleep_hours'] = Variable<double>(sleepHours);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    {
      map['created_at'] = Variable<int>(
        $WellbeingLogsTable.$convertercreatedAt.toSql(createdAt),
      );
    }
    {
      map['updated_at'] = Variable<int>(
        $WellbeingLogsTable.$converterupdatedAt.toSql(updatedAt),
      );
    }
    map['sync_flags'] = Variable<int>(syncFlags);
    return map;
  }

  WellbeingLogsCompanion toCompanion(bool nullToAbsent) {
    return WellbeingLogsCompanion(
      id: Value(id),
      recordedAt: Value(recordedAt),
      mood: Value(mood),
      energy: Value(energy),
      sleepHours: sleepHours == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepHours),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncFlags: Value(syncFlags),
    );
  }

  factory WellbeingLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WellbeingLogData(
      id: serializer.fromJson<String>(json['id']),
      recordedAt: $WellbeingLogsTable.$converterrecordedAt.fromJson(
        serializer.fromJson<String>(json['recordedAt']),
      ),
      mood: serializer.fromJson<int>(json['mood']),
      energy: serializer.fromJson<int>(json['energy']),
      sleepHours: serializer.fromJson<double?>(json['sleepHours']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: $WellbeingLogsTable.$convertercreatedAt.fromJson(
        serializer.fromJson<String>(json['createdAt']),
      ),
      updatedAt: $WellbeingLogsTable.$converterupdatedAt.fromJson(
        serializer.fromJson<String>(json['updatedAt']),
      ),
      syncFlags: serializer.fromJson<int>(json['syncFlags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recordedAt': serializer.toJson<String>(
        $WellbeingLogsTable.$converterrecordedAt.toJson(recordedAt),
      ),
      'mood': serializer.toJson<int>(mood),
      'energy': serializer.toJson<int>(energy),
      'sleepHours': serializer.toJson<double?>(sleepHours),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<String>(
        $WellbeingLogsTable.$convertercreatedAt.toJson(createdAt),
      ),
      'updatedAt': serializer.toJson<String>(
        $WellbeingLogsTable.$converterupdatedAt.toJson(updatedAt),
      ),
      'syncFlags': serializer.toJson<int>(syncFlags),
    };
  }

  WellbeingLogData copyWith({
    String? id,
    DateTime? recordedAt,
    int? mood,
    int? energy,
    Value<double?> sleepHours = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    int? syncFlags,
  }) => WellbeingLogData(
    id: id ?? this.id,
    recordedAt: recordedAt ?? this.recordedAt,
    mood: mood ?? this.mood,
    energy: energy ?? this.energy,
    sleepHours: sleepHours.present ? sleepHours.value : this.sleepHours,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncFlags: syncFlags ?? this.syncFlags,
  );
  WellbeingLogData copyWithCompanion(WellbeingLogsCompanion data) {
    return WellbeingLogData(
      id: data.id.present ? data.id.value : this.id,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      mood: data.mood.present ? data.mood.value : this.mood,
      energy: data.energy.present ? data.energy.value : this.energy,
      sleepHours: data.sleepHours.present
          ? data.sleepHours.value
          : this.sleepHours,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncFlags: data.syncFlags.present ? data.syncFlags.value : this.syncFlags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WellbeingLogData(')
          ..write('id: $id, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncFlags: $syncFlags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recordedAt,
    mood,
    energy,
    sleepHours,
    notes,
    createdAt,
    updatedAt,
    syncFlags,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WellbeingLogData &&
          other.id == this.id &&
          other.recordedAt == this.recordedAt &&
          other.mood == this.mood &&
          other.energy == this.energy &&
          other.sleepHours == this.sleepHours &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncFlags == this.syncFlags);
}

class WellbeingLogsCompanion extends UpdateCompanion<WellbeingLogData> {
  final Value<String> id;
  final Value<DateTime> recordedAt;
  final Value<int> mood;
  final Value<int> energy;
  final Value<double?> sleepHours;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> syncFlags;
  final Value<int> rowid;
  const WellbeingLogsCompanion({
    this.id = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.sleepHours = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncFlags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WellbeingLogsCompanion.insert({
    required String id,
    required DateTime recordedAt,
    required int mood,
    required int energy,
    this.sleepHours = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncFlags = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recordedAt = Value(recordedAt),
       mood = Value(mood),
       energy = Value(energy),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<WellbeingLogData> custom({
    Expression<String>? id,
    Expression<int>? recordedAt,
    Expression<int>? mood,
    Expression<int>? energy,
    Expression<double>? sleepHours,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? syncFlags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (mood != null) 'mood': mood,
      if (energy != null) 'energy': energy,
      if (sleepHours != null) 'sleep_hours': sleepHours,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncFlags != null) 'sync_flags': syncFlags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WellbeingLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? recordedAt,
    Value<int>? mood,
    Value<int>? energy,
    Value<double?>? sleepHours,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? syncFlags,
    Value<int>? rowid,
  }) {
    return WellbeingLogsCompanion(
      id: id ?? this.id,
      recordedAt: recordedAt ?? this.recordedAt,
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
      sleepHours: sleepHours ?? this.sleepHours,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncFlags: syncFlags ?? this.syncFlags,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<int>(
        $WellbeingLogsTable.$converterrecordedAt.toSql(recordedAt.value),
      );
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (sleepHours.present) {
      map['sleep_hours'] = Variable<double>(sleepHours.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(
        $WellbeingLogsTable.$convertercreatedAt.toSql(createdAt.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
        $WellbeingLogsTable.$converterupdatedAt.toSql(updatedAt.value),
      );
    }
    if (syncFlags.present) {
      map['sync_flags'] = Variable<int>(syncFlags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WellbeingLogsCompanion(')
          ..write('id: $id, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncFlags: $syncFlags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTable extends SyncMeta
    with TableInfo<$SyncMetaTable, SyncMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL CHECK (id = 1)',
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, int> lastSyncAt =
      GeneratedColumn<int>(
        'last_sync_at',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($SyncMetaTable.$converterlastSyncAtn);
  static const VerificationMeta _lastSyncDurationMsMeta =
      const VerificationMeta('lastSyncDurationMs');
  @override
  late final GeneratedColumn<int> lastSyncDurationMs = GeneratedColumn<int>(
    'last_sync_duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncStatusMeta = const VerificationMeta(
    'lastSyncStatus',
  );
  @override
  late final GeneratedColumn<String> lastSyncStatus = GeneratedColumn<String>(
    'last_sync_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lastSyncAt,
    lastSyncDurationMs,
    lastSyncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('last_sync_duration_ms')) {
      context.handle(
        _lastSyncDurationMsMeta,
        lastSyncDurationMs.isAcceptableOrUnknown(
          data['last_sync_duration_ms']!,
          _lastSyncDurationMsMeta,
        ),
      );
    }
    if (data.containsKey('last_sync_status')) {
      context.handle(
        _lastSyncStatusMeta,
        lastSyncStatus.isAcceptableOrUnknown(
          data['last_sync_status']!,
          _lastSyncStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lastSyncAt: $SyncMetaTable.$converterlastSyncAtn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}last_sync_at'],
        ),
      ),
      lastSyncDurationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_sync_duration_ms'],
      ),
      lastSyncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_status'],
      ),
    );
  }

  @override
  $SyncMetaTable createAlias(String alias) {
    return $SyncMetaTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DateTime, int, String> $converterlastSyncAt =
      const MicrosecondDateTimeConverter();
  static JsonTypeConverter2<DateTime?, int?, String?> $converterlastSyncAtn =
      JsonTypeConverter2.asNullable($converterlastSyncAt);
}

class SyncMetaData extends DataClass implements Insertable<SyncMetaData> {
  /// Fixed to 1. The CHECK constraint prevents accidental multi-row inserts.
  final int id;

  /// UTC timestamp of the last successful sync. NULL before first sync.
  /// Column<int> = SQL INTEGER; data class exposes `DateTime?` via converter.
  final DateTime? lastSyncAt;

  /// Duration of the last sync operation in milliseconds.
  final int? lastSyncDurationMs;

  /// Human-readable outcome: `'success'` | `'error'`.
  final String? lastSyncStatus;
  const SyncMetaData({
    required this.id,
    this.lastSyncAt,
    this.lastSyncDurationMs,
    this.lastSyncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<int>(
        $SyncMetaTable.$converterlastSyncAtn.toSql(lastSyncAt),
      );
    }
    if (!nullToAbsent || lastSyncDurationMs != null) {
      map['last_sync_duration_ms'] = Variable<int>(lastSyncDurationMs);
    }
    if (!nullToAbsent || lastSyncStatus != null) {
      map['last_sync_status'] = Variable<String>(lastSyncStatus);
    }
    return map;
  }

  SyncMetaCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaCompanion(
      id: Value(id),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
      lastSyncDurationMs: lastSyncDurationMs == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncDurationMs),
      lastSyncStatus: lastSyncStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncStatus),
    );
  }

  factory SyncMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaData(
      id: serializer.fromJson<int>(json['id']),
      lastSyncAt: $SyncMetaTable.$converterlastSyncAtn.fromJson(
        serializer.fromJson<String?>(json['lastSyncAt']),
      ),
      lastSyncDurationMs: serializer.fromJson<int?>(json['lastSyncDurationMs']),
      lastSyncStatus: serializer.fromJson<String?>(json['lastSyncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lastSyncAt': serializer.toJson<String?>(
        $SyncMetaTable.$converterlastSyncAtn.toJson(lastSyncAt),
      ),
      'lastSyncDurationMs': serializer.toJson<int?>(lastSyncDurationMs),
      'lastSyncStatus': serializer.toJson<String?>(lastSyncStatus),
    };
  }

  SyncMetaData copyWith({
    int? id,
    Value<DateTime?> lastSyncAt = const Value.absent(),
    Value<int?> lastSyncDurationMs = const Value.absent(),
    Value<String?> lastSyncStatus = const Value.absent(),
  }) => SyncMetaData(
    id: id ?? this.id,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
    lastSyncDurationMs: lastSyncDurationMs.present
        ? lastSyncDurationMs.value
        : this.lastSyncDurationMs,
    lastSyncStatus: lastSyncStatus.present
        ? lastSyncStatus.value
        : this.lastSyncStatus,
  );
  SyncMetaData copyWithCompanion(SyncMetaCompanion data) {
    return SyncMetaData(
      id: data.id.present ? data.id.value : this.id,
      lastSyncAt: data.lastSyncAt.present
          ? data.lastSyncAt.value
          : this.lastSyncAt,
      lastSyncDurationMs: data.lastSyncDurationMs.present
          ? data.lastSyncDurationMs.value
          : this.lastSyncDurationMs,
      lastSyncStatus: data.lastSyncStatus.present
          ? data.lastSyncStatus.value
          : this.lastSyncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaData(')
          ..write('id: $id, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('lastSyncDurationMs: $lastSyncDurationMs, ')
          ..write('lastSyncStatus: $lastSyncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, lastSyncAt, lastSyncDurationMs, lastSyncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaData &&
          other.id == this.id &&
          other.lastSyncAt == this.lastSyncAt &&
          other.lastSyncDurationMs == this.lastSyncDurationMs &&
          other.lastSyncStatus == this.lastSyncStatus);
}

class SyncMetaCompanion extends UpdateCompanion<SyncMetaData> {
  final Value<int> id;
  final Value<DateTime?> lastSyncAt;
  final Value<int?> lastSyncDurationMs;
  final Value<String?> lastSyncStatus;
  const SyncMetaCompanion({
    this.id = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.lastSyncDurationMs = const Value.absent(),
    this.lastSyncStatus = const Value.absent(),
  });
  SyncMetaCompanion.insert({
    this.id = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.lastSyncDurationMs = const Value.absent(),
    this.lastSyncStatus = const Value.absent(),
  });
  static Insertable<SyncMetaData> custom({
    Expression<int>? id,
    Expression<int>? lastSyncAt,
    Expression<int>? lastSyncDurationMs,
    Expression<String>? lastSyncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (lastSyncDurationMs != null)
        'last_sync_duration_ms': lastSyncDurationMs,
      if (lastSyncStatus != null) 'last_sync_status': lastSyncStatus,
    });
  }

  SyncMetaCompanion copyWith({
    Value<int>? id,
    Value<DateTime?>? lastSyncAt,
    Value<int?>? lastSyncDurationMs,
    Value<String?>? lastSyncStatus,
  }) {
    return SyncMetaCompanion(
      id: id ?? this.id,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      lastSyncDurationMs: lastSyncDurationMs ?? this.lastSyncDurationMs,
      lastSyncStatus: lastSyncStatus ?? this.lastSyncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<int>(
        $SyncMetaTable.$converterlastSyncAtn.toSql(lastSyncAt.value),
      );
    }
    if (lastSyncDurationMs.present) {
      map['last_sync_duration_ms'] = Variable<int>(lastSyncDurationMs.value);
    }
    if (lastSyncStatus.present) {
      map['last_sync_status'] = Variable<String>(lastSyncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaCompanion(')
          ..write('id: $id, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('lastSyncDurationMs: $lastSyncDurationMs, ')
          ..write('lastSyncStatus: $lastSyncStatus')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductIngredientsTable productIngredients =
      $ProductIngredientsTable(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $IntakeLogsTable intakeLogs = $IntakeLogsTable(this);
  late final $GlobalIngredientsTable globalIngredients =
      $GlobalIngredientsTable(this);
  late final $WellbeingLogsTable wellbeingLogs = $WellbeingLogsTable(this);
  late final $SyncMetaTable syncMeta = $SyncMetaTable(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final CoursesDao coursesDao = CoursesDao(this as AppDatabase);
  late final GlobalIngredientsDao globalIngredientsDao = GlobalIngredientsDao(
    this as AppDatabase,
  );
  late final WellbeingLogsDao wellbeingLogsDao = WellbeingLogsDao(
    this as AppDatabase,
  );
  late final SyncMetaDao syncMetaDao = SyncMetaDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    productIngredients,
    courses,
    intakeLogs,
    globalIngredients,
    wellbeingLogs,
    syncMeta,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      required String name,
      Value<String?> description,
      Value<String?> creatorUserId,
      Value<int> isLocalDraft,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String> name,
      Value<String?> description,
      Value<String?> creatorUserId,
      Value<int> isLocalDraft,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductsData> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ProductIngredientsTable,
    List<ProductIngredientsData>
  >
  _productIngredientsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productIngredients,
        aliasName: $_aliasNameGenerator(
          db.products.id,
          db.productIngredients.productId,
        ),
      );

  $$ProductIngredientsTableProcessedTableManager get productIngredientsRefs {
    final manager = $$ProductIngredientsTableTableManager(
      $_db,
      $_db.productIngredients,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productIngredientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CoursesTable, List<CoursesData>>
  _coursesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.courses,
    aliasName: $_aliasNameGenerator(db.products.id, db.courses.productId),
  );

  $$CoursesTableProcessedTableManager get coursesRefs {
    final manager = $$CoursesTableTableManager(
      $_db,
      $_db.courses,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_coursesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get deletedAt =>
      $composableBuilder(
        column: $table.deletedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creatorUserId => $composableBuilder(
    column: $table.creatorUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isLocalDraft => $composableBuilder(
    column: $table.isLocalDraft,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productIngredientsRefs(
    Expression<bool> Function($$ProductIngredientsTableFilterComposer f) f,
  ) {
    final $$ProductIngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productIngredients,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductIngredientsTableFilterComposer(
            $db: $db,
            $table: $db.productIngredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> coursesRefs(
    Expression<bool> Function($$CoursesTableFilterComposer f) f,
  ) {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableFilterComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creatorUserId => $composableBuilder(
    column: $table.creatorUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isLocalDraft => $composableBuilder(
    column: $table.isLocalDraft,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get creatorUserId => $composableBuilder(
    column: $table.creatorUserId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isLocalDraft => $composableBuilder(
    column: $table.isLocalDraft,
    builder: (column) => column,
  );

  Expression<T> productIngredientsRefs<T extends Object>(
    Expression<T> Function($$ProductIngredientsTableAnnotationComposer a) f,
  ) {
    final $$ProductIngredientsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productIngredients,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductIngredientsTableAnnotationComposer(
                $db: $db,
                $table: $db.productIngredients,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> coursesRefs<T extends Object>(
    Expression<T> Function($$CoursesTableAnnotationComposer a) f,
  ) {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableAnnotationComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          ProductsData,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (ProductsData, $$ProductsTableReferences),
          ProductsData,
          PrefetchHooks Function({
            bool productIngredientsRefs,
            bool coursesRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> creatorUserId = const Value.absent(),
                Value<int> isLocalDraft = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                name: name,
                description: description,
                creatorUserId: creatorUserId,
                isLocalDraft: isLocalDraft,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> creatorUserId = const Value.absent(),
                Value<int> isLocalDraft = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                name: name,
                description: description,
                creatorUserId: creatorUserId,
                isLocalDraft: isLocalDraft,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productIngredientsRefs = false, coursesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productIngredientsRefs) db.productIngredients,
                    if (coursesRefs) db.courses,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productIngredientsRefs)
                        await $_getPrefetchedData<
                          ProductsData,
                          $ProductsTable,
                          ProductIngredientsData
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productIngredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productIngredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (coursesRefs)
                        await $_getPrefetchedData<
                          ProductsData,
                          $ProductsTable,
                          CoursesData
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._coursesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).coursesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      ProductsData,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductsData, $$ProductsTableReferences),
      ProductsData,
      PrefetchHooks Function({bool productIngredientsRefs, bool coursesRefs})
    >;
typedef $$ProductIngredientsTableCreateCompanionBuilder =
    ProductIngredientsCompanion Function({
      required String id,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      required String productId,
      Value<String?> ingredientId,
      Value<String?> customIngredientName,
      required double amount,
      required String unit,
      Value<int> rowid,
    });
typedef $$ProductIngredientsTableUpdateCompanionBuilder =
    ProductIngredientsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String> productId,
      Value<String?> ingredientId,
      Value<String?> customIngredientName,
      Value<double> amount,
      Value<String> unit,
      Value<int> rowid,
    });

final class $$ProductIngredientsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductIngredientsTable,
          ProductIngredientsData
        > {
  $$ProductIngredientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.productIngredients.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductIngredientsTable> {
  $$ProductIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get deletedAt =>
      $composableBuilder(
        column: $table.deletedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientId => $composableBuilder(
    column: $table.ingredientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customIngredientName => $composableBuilder(
    column: $table.customIngredientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductIngredientsTable> {
  $$ProductIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientId => $composableBuilder(
    column: $table.ingredientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customIngredientName => $composableBuilder(
    column: $table.customIngredientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductIngredientsTable> {
  $$ProductIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ingredientId => $composableBuilder(
    column: $table.ingredientId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customIngredientName => $composableBuilder(
    column: $table.customIngredientName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductIngredientsTable,
          ProductIngredientsData,
          $$ProductIngredientsTableFilterComposer,
          $$ProductIngredientsTableOrderingComposer,
          $$ProductIngredientsTableAnnotationComposer,
          $$ProductIngredientsTableCreateCompanionBuilder,
          $$ProductIngredientsTableUpdateCompanionBuilder,
          (ProductIngredientsData, $$ProductIngredientsTableReferences),
          ProductIngredientsData,
          PrefetchHooks Function({bool productId})
        > {
  $$ProductIngredientsTableTableManager(
    _$AppDatabase db,
    $ProductIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String?> ingredientId = const Value.absent(),
                Value<String?> customIngredientName = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductIngredientsCompanion(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                productId: productId,
                ingredientId: ingredientId,
                customIngredientName: customIngredientName,
                amount: amount,
                unit: unit,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                required String productId,
                Value<String?> ingredientId = const Value.absent(),
                Value<String?> customIngredientName = const Value.absent(),
                required double amount,
                required String unit,
                Value<int> rowid = const Value.absent(),
              }) => ProductIngredientsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                productId: productId,
                ingredientId: ingredientId,
                customIngredientName: customIngredientName,
                amount: amount,
                unit: unit,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductIngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductIngredientsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductIngredientsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductIngredientsTable,
      ProductIngredientsData,
      $$ProductIngredientsTableFilterComposer,
      $$ProductIngredientsTableOrderingComposer,
      $$ProductIngredientsTableAnnotationComposer,
      $$ProductIngredientsTableCreateCompanionBuilder,
      $$ProductIngredientsTableUpdateCompanionBuilder,
      (ProductIngredientsData, $$ProductIngredientsTableReferences),
      ProductIngredientsData,
      PrefetchHooks Function({bool productId})
    >;
typedef $$CoursesTableCreateCompanionBuilder =
    CoursesCompanion Function({
      required String id,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String?> userId,
      required String productId,
      required double servingSize,
      required int timeOfDay,
      required int startDate,
      Value<int?> endDate,
      Value<int> rowid,
    });
typedef $$CoursesTableUpdateCompanionBuilder =
    CoursesCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String?> userId,
      Value<String> productId,
      Value<double> servingSize,
      Value<int> timeOfDay,
      Value<int> startDate,
      Value<int?> endDate,
      Value<int> rowid,
    });

final class $$CoursesTableReferences
    extends BaseReferences<_$AppDatabase, $CoursesTable, CoursesData> {
  $$CoursesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) => db.products
      .createAlias($_aliasNameGenerator(db.courses.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IntakeLogsTable, List<IntakeLogsData>>
  _intakeLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.intakeLogs,
    aliasName: $_aliasNameGenerator(db.courses.id, db.intakeLogs.courseId),
  );

  $$IntakeLogsTableProcessedTableManager get intakeLogsRefs {
    final manager = $$IntakeLogsTableTableManager(
      $_db,
      $_db.intakeLogs,
    ).filter((f) => f.courseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_intakeLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CoursesTableFilterComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get deletedAt =>
      $composableBuilder(
        column: $table.deletedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get servingSize => $composableBuilder(
    column: $table.servingSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeOfDay => $composableBuilder(
    column: $table.timeOfDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> intakeLogsRefs(
    Expression<bool> Function($$IntakeLogsTableFilterComposer f) f,
  ) {
    final $$IntakeLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogs,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsTableFilterComposer(
            $db: $db,
            $table: $db.intakeLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoursesTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get servingSize => $composableBuilder(
    column: $table.servingSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeOfDay => $composableBuilder(
    column: $table.timeOfDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CoursesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get servingSize => $composableBuilder(
    column: $table.servingSize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timeOfDay =>
      $composableBuilder(column: $table.timeOfDay, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> intakeLogsRefs<T extends Object>(
    Expression<T> Function($$IntakeLogsTableAnnotationComposer a) f,
  ) {
    final $$IntakeLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogs,
      getReferencedColumn: (t) => t.courseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.intakeLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoursesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoursesTable,
          CoursesData,
          $$CoursesTableFilterComposer,
          $$CoursesTableOrderingComposer,
          $$CoursesTableAnnotationComposer,
          $$CoursesTableCreateCompanionBuilder,
          $$CoursesTableUpdateCompanionBuilder,
          (CoursesData, $$CoursesTableReferences),
          CoursesData,
          PrefetchHooks Function({bool productId, bool intakeLogsRefs})
        > {
  $$CoursesTableTableManager(_$AppDatabase db, $CoursesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoursesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<double> servingSize = const Value.absent(),
                Value<int> timeOfDay = const Value.absent(),
                Value<int> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoursesCompanion(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                userId: userId,
                productId: productId,
                servingSize: servingSize,
                timeOfDay: timeOfDay,
                startDate: startDate,
                endDate: endDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required String productId,
                required double servingSize,
                required int timeOfDay,
                required int startDate,
                Value<int?> endDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoursesCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                userId: userId,
                productId: productId,
                servingSize: servingSize,
                timeOfDay: timeOfDay,
                startDate: startDate,
                endDate: endDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CoursesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, intakeLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (intakeLogsRefs) db.intakeLogs],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$CoursesTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$CoursesTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (intakeLogsRefs)
                    await $_getPrefetchedData<
                      CoursesData,
                      $CoursesTable,
                      IntakeLogsData
                    >(
                      currentTable: table,
                      referencedTable: $$CoursesTableReferences
                          ._intakeLogsRefsTable(db),
                      managerFromTypedResult: (p0) => $$CoursesTableReferences(
                        db,
                        table,
                        p0,
                      ).intakeLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.courseId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CoursesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoursesTable,
      CoursesData,
      $$CoursesTableFilterComposer,
      $$CoursesTableOrderingComposer,
      $$CoursesTableAnnotationComposer,
      $$CoursesTableCreateCompanionBuilder,
      $$CoursesTableUpdateCompanionBuilder,
      (CoursesData, $$CoursesTableReferences),
      CoursesData,
      PrefetchHooks Function({bool productId, bool intakeLogsRefs})
    >;
typedef $$IntakeLogsTableCreateCompanionBuilder =
    IntakeLogsCompanion Function({
      required String id,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      required String courseId,
      Value<String?> userId,
      required double actualServingSize,
      required DateTime takenAt,
      Value<int> rowid,
    });
typedef $$IntakeLogsTableUpdateCompanionBuilder =
    IntakeLogsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String> courseId,
      Value<String?> userId,
      Value<double> actualServingSize,
      Value<DateTime> takenAt,
      Value<int> rowid,
    });

final class $$IntakeLogsTableReferences
    extends BaseReferences<_$AppDatabase, $IntakeLogsTable, IntakeLogsData> {
  $$IntakeLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CoursesTable _courseIdTable(_$AppDatabase db) => db.courses
      .createAlias($_aliasNameGenerator(db.intakeLogs.courseId, db.courses.id));

  $$CoursesTableProcessedTableManager get courseId {
    final $_column = $_itemColumn<String>('course_id')!;

    final manager = $$CoursesTableTableManager(
      $_db,
      $_db.courses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IntakeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $IntakeLogsTable> {
  $$IntakeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get deletedAt =>
      $composableBuilder(
        column: $table.deletedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actualServingSize => $composableBuilder(
    column: $table.actualServingSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get takenAt =>
      $composableBuilder(
        column: $table.takenAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$CoursesTableFilterComposer get courseId {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableFilterComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntakeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $IntakeLogsTable> {
  $$IntakeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actualServingSize => $composableBuilder(
    column: $table.actualServingSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CoursesTableOrderingComposer get courseId {
    final $$CoursesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableOrderingComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntakeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntakeLogsTable> {
  $$IntakeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<double> get actualServingSize => $composableBuilder(
    column: $table.actualServingSize,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, int> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  $$CoursesTableAnnotationComposer get courseId {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseId,
      referencedTable: $db.courses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoursesTableAnnotationComposer(
            $db: $db,
            $table: $db.courses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntakeLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IntakeLogsTable,
          IntakeLogsData,
          $$IntakeLogsTableFilterComposer,
          $$IntakeLogsTableOrderingComposer,
          $$IntakeLogsTableAnnotationComposer,
          $$IntakeLogsTableCreateCompanionBuilder,
          $$IntakeLogsTableUpdateCompanionBuilder,
          (IntakeLogsData, $$IntakeLogsTableReferences),
          IntakeLogsData,
          PrefetchHooks Function({bool courseId})
        > {
  $$IntakeLogsTableTableManager(_$AppDatabase db, $IntakeLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntakeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntakeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntakeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<double> actualServingSize = const Value.absent(),
                Value<DateTime> takenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IntakeLogsCompanion(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                courseId: courseId,
                userId: userId,
                actualServingSize: actualServingSize,
                takenAt: takenAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                required String courseId,
                Value<String?> userId = const Value.absent(),
                required double actualServingSize,
                required DateTime takenAt,
                Value<int> rowid = const Value.absent(),
              }) => IntakeLogsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                courseId: courseId,
                userId: userId,
                actualServingSize: actualServingSize,
                takenAt: takenAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IntakeLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({courseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (courseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.courseId,
                                referencedTable: $$IntakeLogsTableReferences
                                    ._courseIdTable(db),
                                referencedColumn: $$IntakeLogsTableReferences
                                    ._courseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IntakeLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IntakeLogsTable,
      IntakeLogsData,
      $$IntakeLogsTableFilterComposer,
      $$IntakeLogsTableOrderingComposer,
      $$IntakeLogsTableAnnotationComposer,
      $$IntakeLogsTableCreateCompanionBuilder,
      $$IntakeLogsTableUpdateCompanionBuilder,
      (IntakeLogsData, $$IntakeLogsTableReferences),
      IntakeLogsData,
      PrefetchHooks Function({bool courseId})
    >;
typedef $$GlobalIngredientsTableCreateCompanionBuilder =
    GlobalIngredientsCompanion Function({
      required String id,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      required String name,
      required String defaultUnit,
      required int category,
      Value<int> rowid,
    });
typedef $$GlobalIngredientsTableUpdateCompanionBuilder =
    GlobalIngredientsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<int> pendingSync,
      Value<String> name,
      Value<String> defaultUnit,
      Value<int> category,
      Value<int> rowid,
    });

class $$GlobalIngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $GlobalIngredientsTable> {
  $$GlobalIngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get deletedAt =>
      $composableBuilder(
        column: $table.deletedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GlobalIngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $GlobalIngredientsTable> {
  $$GlobalIngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GlobalIngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GlobalIngredientsTable> {
  $$GlobalIngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$GlobalIngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GlobalIngredientsTable,
          GlobalIngredientsData,
          $$GlobalIngredientsTableFilterComposer,
          $$GlobalIngredientsTableOrderingComposer,
          $$GlobalIngredientsTableAnnotationComposer,
          $$GlobalIngredientsTableCreateCompanionBuilder,
          $$GlobalIngredientsTableUpdateCompanionBuilder,
          (
            GlobalIngredientsData,
            BaseReferences<
              _$AppDatabase,
              $GlobalIngredientsTable,
              GlobalIngredientsData
            >,
          ),
          GlobalIngredientsData,
          PrefetchHooks Function()
        > {
  $$GlobalIngredientsTableTableManager(
    _$AppDatabase db,
    $GlobalIngredientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GlobalIngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GlobalIngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GlobalIngredientsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> defaultUnit = const Value.absent(),
                Value<int> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GlobalIngredientsCompanion(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                name: name,
                defaultUnit: defaultUnit,
                category: category,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> pendingSync = const Value.absent(),
                required String name,
                required String defaultUnit,
                required int category,
                Value<int> rowid = const Value.absent(),
              }) => GlobalIngredientsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                pendingSync: pendingSync,
                name: name,
                defaultUnit: defaultUnit,
                category: category,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GlobalIngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GlobalIngredientsTable,
      GlobalIngredientsData,
      $$GlobalIngredientsTableFilterComposer,
      $$GlobalIngredientsTableOrderingComposer,
      $$GlobalIngredientsTableAnnotationComposer,
      $$GlobalIngredientsTableCreateCompanionBuilder,
      $$GlobalIngredientsTableUpdateCompanionBuilder,
      (
        GlobalIngredientsData,
        BaseReferences<
          _$AppDatabase,
          $GlobalIngredientsTable,
          GlobalIngredientsData
        >,
      ),
      GlobalIngredientsData,
      PrefetchHooks Function()
    >;
typedef $$WellbeingLogsTableCreateCompanionBuilder =
    WellbeingLogsCompanion Function({
      required String id,
      required DateTime recordedAt,
      required int mood,
      required int energy,
      Value<double?> sleepHours,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> syncFlags,
      Value<int> rowid,
    });
typedef $$WellbeingLogsTableUpdateCompanionBuilder =
    WellbeingLogsCompanion Function({
      Value<String> id,
      Value<DateTime> recordedAt,
      Value<int> mood,
      Value<int> energy,
      Value<double?> sleepHours,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> syncFlags,
      Value<int> rowid,
    });

class $$WellbeingLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WellbeingLogsTable> {
  $$WellbeingLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get recordedAt =>
      $composableBuilder(
        column: $table.recordedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get createdAt =>
      $composableBuilder(
        column: $table.createdAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get updatedAt =>
      $composableBuilder(
        column: $table.updatedAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get syncFlags => $composableBuilder(
    column: $table.syncFlags,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WellbeingLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WellbeingLogsTable> {
  $$WellbeingLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncFlags => $composableBuilder(
    column: $table.syncFlags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WellbeingLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WellbeingLogsTable> {
  $$WellbeingLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get recordedAt =>
      $composableBuilder(
        column: $table.recordedAt,
        builder: (column) => column,
      );

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncFlags =>
      $composableBuilder(column: $table.syncFlags, builder: (column) => column);
}

class $$WellbeingLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WellbeingLogsTable,
          WellbeingLogData,
          $$WellbeingLogsTableFilterComposer,
          $$WellbeingLogsTableOrderingComposer,
          $$WellbeingLogsTableAnnotationComposer,
          $$WellbeingLogsTableCreateCompanionBuilder,
          $$WellbeingLogsTableUpdateCompanionBuilder,
          (
            WellbeingLogData,
            BaseReferences<
              _$AppDatabase,
              $WellbeingLogsTable,
              WellbeingLogData
            >,
          ),
          WellbeingLogData,
          PrefetchHooks Function()
        > {
  $$WellbeingLogsTableTableManager(_$AppDatabase db, $WellbeingLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WellbeingLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WellbeingLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WellbeingLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<int> mood = const Value.absent(),
                Value<int> energy = const Value.absent(),
                Value<double?> sleepHours = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> syncFlags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WellbeingLogsCompanion(
                id: id,
                recordedAt: recordedAt,
                mood: mood,
                energy: energy,
                sleepHours: sleepHours,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncFlags: syncFlags,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime recordedAt,
                required int mood,
                required int energy,
                Value<double?> sleepHours = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> syncFlags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WellbeingLogsCompanion.insert(
                id: id,
                recordedAt: recordedAt,
                mood: mood,
                energy: energy,
                sleepHours: sleepHours,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncFlags: syncFlags,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WellbeingLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WellbeingLogsTable,
      WellbeingLogData,
      $$WellbeingLogsTableFilterComposer,
      $$WellbeingLogsTableOrderingComposer,
      $$WellbeingLogsTableAnnotationComposer,
      $$WellbeingLogsTableCreateCompanionBuilder,
      $$WellbeingLogsTableUpdateCompanionBuilder,
      (
        WellbeingLogData,
        BaseReferences<_$AppDatabase, $WellbeingLogsTable, WellbeingLogData>,
      ),
      WellbeingLogData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetaTableCreateCompanionBuilder =
    SyncMetaCompanion Function({
      Value<int> id,
      Value<DateTime?> lastSyncAt,
      Value<int?> lastSyncDurationMs,
      Value<String?> lastSyncStatus,
    });
typedef $$SyncMetaTableUpdateCompanionBuilder =
    SyncMetaCompanion Function({
      Value<int> id,
      Value<DateTime?> lastSyncAt,
      Value<int?> lastSyncDurationMs,
      Value<String?> lastSyncStatus,
    });

class $$SyncMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, int> get lastSyncAt =>
      $composableBuilder(
        column: $table.lastSyncAt,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get lastSyncDurationMs => $composableBuilder(
    column: $table.lastSyncDurationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncStatus => $composableBuilder(
    column: $table.lastSyncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSyncDurationMs => $composableBuilder(
    column: $table.lastSyncDurationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncStatus => $composableBuilder(
    column: $table.lastSyncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, int> get lastSyncAt =>
      $composableBuilder(
        column: $table.lastSyncAt,
        builder: (column) => column,
      );

  GeneratedColumn<int> get lastSyncDurationMs => $composableBuilder(
    column: $table.lastSyncDurationMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncStatus => $composableBuilder(
    column: $table.lastSyncStatus,
    builder: (column) => column,
  );
}

class $$SyncMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetaTable,
          SyncMetaData,
          $$SyncMetaTableFilterComposer,
          $$SyncMetaTableOrderingComposer,
          $$SyncMetaTableAnnotationComposer,
          $$SyncMetaTableCreateCompanionBuilder,
          $$SyncMetaTableUpdateCompanionBuilder,
          (
            SyncMetaData,
            BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
          ),
          SyncMetaData,
          PrefetchHooks Function()
        > {
  $$SyncMetaTableTableManager(_$AppDatabase db, $SyncMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int?> lastSyncDurationMs = const Value.absent(),
                Value<String?> lastSyncStatus = const Value.absent(),
              }) => SyncMetaCompanion(
                id: id,
                lastSyncAt: lastSyncAt,
                lastSyncDurationMs: lastSyncDurationMs,
                lastSyncStatus: lastSyncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<int?> lastSyncDurationMs = const Value.absent(),
                Value<String?> lastSyncStatus = const Value.absent(),
              }) => SyncMetaCompanion.insert(
                id: id,
                lastSyncAt: lastSyncAt,
                lastSyncDurationMs: lastSyncDurationMs,
                lastSyncStatus: lastSyncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetaTable,
      SyncMetaData,
      $$SyncMetaTableFilterComposer,
      $$SyncMetaTableOrderingComposer,
      $$SyncMetaTableAnnotationComposer,
      $$SyncMetaTableCreateCompanionBuilder,
      $$SyncMetaTableUpdateCompanionBuilder,
      (
        SyncMetaData,
        BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
      ),
      SyncMetaData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductIngredientsTableTableManager get productIngredients =>
      $$ProductIngredientsTableTableManager(_db, _db.productIngredients);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db, _db.courses);
  $$IntakeLogsTableTableManager get intakeLogs =>
      $$IntakeLogsTableTableManager(_db, _db.intakeLogs);
  $$GlobalIngredientsTableTableManager get globalIngredients =>
      $$GlobalIngredientsTableTableManager(_db, _db.globalIngredients);
  $$WellbeingLogsTableTableManager get wellbeingLogs =>
      $$WellbeingLogsTableTableManager(_db, _db.wellbeingLogs);
  $$SyncMetaTableTableManager get syncMeta =>
      $$SyncMetaTableTableManager(_db, _db.syncMeta);
}
