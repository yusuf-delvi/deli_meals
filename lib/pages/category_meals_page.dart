import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title']!;
    final String categoryId = routeArgs['id']!;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          Meal category = categoryMeals[idx];
          return MealItem(
            title: category.title,
            imageUrl: category.imageUrl,
            duration: category.duration,
            complexity: category.complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
