import 'package:flutter/material.dart';

import './categories_page.dart';
import './favorites_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
