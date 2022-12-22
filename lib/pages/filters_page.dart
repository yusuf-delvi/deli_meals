import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  static String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: const Center(child: Text('filters')),
    );
  }
}