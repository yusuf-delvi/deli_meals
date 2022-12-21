import 'package:flutter/material.dart';

import 'pages/categories_page.dart';
import 'pages/category_meals_page.dart';
import 'pages/meal_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (ctx) => const MyHomePage(),
        CategoryMealsPage.routeName: (ctx) => const CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => const MealDetailPage(),
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
