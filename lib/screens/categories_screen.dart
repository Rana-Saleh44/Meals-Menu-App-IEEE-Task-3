import 'package:flutter/material.dart';
import 'package:task3/widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals Categories'),
      ),
      drawer: MainDrawer(),
      body: const CustomScrollView(
          // slvers: [
          //   CategoriesListViewBuilder(
          //     category: category,
          //   ),
          // ],i
          ),
    );
  }
}
