import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  CategoryMealsPage(this.availableMeals, this.toggleFav, {super.key});

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  Function toggleFav;

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

      displayedMeals = widget.availableMeals
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
            toggleFav: widget.toggleFav,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
