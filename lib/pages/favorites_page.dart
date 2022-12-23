import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, idx) {
              Meal category = favoriteMeals[idx];
              return MealItem(
                id: category.id,
                title: category.title,
                imageUrl: category.imageUrl,
                duration: category.duration,
                complexity: category.complexity,
                affordability: category.affordability,
                removeItem: () {},
                toggleFav: () {},
              );
            },
            itemCount: favoriteMeals.length,
          )
        : const Center(
            child: Text('You don\'t have favorites yet - start adding some'),
          );
  }
}
