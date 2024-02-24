import 'package:flutter/material.dart';


import '../../model/category.dart';
import '../../model/meal.dart';
import '../widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Meal> mealsInCategory =
        Meal.getMealsFilteredInCategory(categoryId: category.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: mealsInCategory.length,
        itemBuilder: (context, index) => MealItem(meal: mealsInCategory[index]),
      ),
    );
  }
}
