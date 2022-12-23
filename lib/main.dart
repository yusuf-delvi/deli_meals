import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';

import './pages/categories_page.dart';
import './pages/category_meals_page.dart';
import './pages/meal_detail_page.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
        //....
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    int existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      Meal foundMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
      setState(() {
        _favoriteMeals.add(foundMeal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsPage(_favoriteMeals),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals, _toggleFav),
        MealDetailPage.routeName: (ctx) => const MealDetailPage(),
        FiltersPage.routeName: (ctx) =>
            FiltersPage(_filters, _setFilters, _favoriteMeals),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesPage();
  }
}
