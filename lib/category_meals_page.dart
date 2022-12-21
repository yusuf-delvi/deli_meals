import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title']!;
    final String categoryId = routeArgs['id']!;

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: const Center(
        child: Text('The Recipes For the Category!'),
      ),
    );
  }
}
