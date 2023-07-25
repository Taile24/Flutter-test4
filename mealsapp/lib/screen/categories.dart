import 'package:mealsapp/model/category.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/screen/meals.dart';
import 'package:mealsapp/widget/category_gird_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeal,
  });
  final void Function(Meal meal) onToggleFavorite;

  final List<Meal> availableMeal;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeal
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGrildItem(
            category: category,
            onSeclectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
