import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage(this.currentFilters, this.saveFilters, this.favoriteMeals,
      {super.key});

  final saveFilters;
  final Map<String, bool> currentFilters;
  final List<Meal> favoriteMeals;

  static String routeName = '/filters';

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;

    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentVal,
    updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(description),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchTile(
                'Gluten-free',
                'Only include gluten-free meal',
                _glutenFree,
                (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Lactose-free',
                'Only include lactose-free meal',
                _lactoseFree,
                (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegetarian',
                'Only include Vegetarian meal',
                _vegetarian,
                (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegan',
                'Only include vegan meal',
                _vegan,
                (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
