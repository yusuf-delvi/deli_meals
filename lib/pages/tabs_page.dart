import 'package:flutter/material.dart';

import './categories_page.dart';
import './favorites_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> _pages = const [
    {'page': CategoriesPage(), 'title': 'Categories'},
    {'page': FavoritesPage(), 'title': 'Your Favorite'},
  ];

  int _selectedPageIdx = 0;

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
