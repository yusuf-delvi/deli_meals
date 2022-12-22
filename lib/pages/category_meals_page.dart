import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  const CategoryMealsPage({super.key});

  static const routeName = '/category-meals';

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final String categoryId = routeArgs['id']!;
      categoryTitle = routeArgs['title']!;

      displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          Meal category = displayedMeals[idx];
          return MealItem(
            id: category.id,
            title: category.title,
            imageUrl: category.imageUrl,
            duration: category.duration,
            complexity: category.complexity,
            affordability: category.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
