import 'package:flutter/material.dart';

import '../models/category.dart';
import '../components/meal_item.dart';
import 'package:revenue/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title,
        style: Theme.of(context).textTheme.headline6),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
