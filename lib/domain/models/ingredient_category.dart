enum IngredientCategory {
  vitamin(1),
  mineral(2),
  supplement(3);

  final int value;
  const IngredientCategory(this.value);

  static IngredientCategory fromValue(int value) => values.firstWhere(
    (e) => e.value == value,
    orElse: () => IngredientCategory.supplement,
  );
}
