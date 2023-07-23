import 'package:flutter/material.dart';
import 'package:mealsapp/model/category.dart';

class CategoryGrildItem extends StatelessWidget {
  const CategoryGrildItem(
      {super.key, required this.category, required this.onSeclectCategory});
  final Category category;
  final void Function() onSeclectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeclectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
