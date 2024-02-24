import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../model/meal.dart';
import '../screen/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<Meal> mealsInCategory =
        Meal.getMealsFilteredInCategory(categoryId: category.id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>MealScreen(
             category: category,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: category.color,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color.withOpacity(.9),
            category.color.withOpacity(.4),
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
