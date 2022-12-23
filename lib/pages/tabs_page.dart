import 'package:flutter/material.dart';

import '../models/meal.dart';

import './categories_page.dart';
import './favorites_page.dart';
import '../widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  const TabsPage(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, dynamic>> _pages = [];
  int _selectedPageIdx = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesPage(), 'title': 'Categories'},
      {'page': FavoritesPage(widget.favoriteMeals), 'title': 'Your Favorite'},
    ];
    super.initState();
  }

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIdx]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIdx]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
