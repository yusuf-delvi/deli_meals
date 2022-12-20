import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Recipes')),
      body: const Center(
        child: Text('The Recipes For the Category!'),
      ),
    );
  }
}
