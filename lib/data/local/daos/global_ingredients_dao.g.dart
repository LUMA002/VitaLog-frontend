// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_ingredients_dao.dart';

// ignore_for_file: type=lint
mixin _$GlobalIngredientsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GlobalIngredientsTable get globalIngredients =>
      attachedDatabase.globalIngredients;
  GlobalIngredientsDaoManager get managers => GlobalIngredientsDaoManager(this);
}

class GlobalIngredientsDaoManager {
  final _$GlobalIngredientsDaoMixin _db;
  GlobalIngredientsDaoManager(this._db);
  $$GlobalIngredientsTableTableManager get globalIngredients =>
      $$GlobalIngredientsTableTableManager(
        _db.attachedDatabase,
        _db.globalIngredients,
      );
}
