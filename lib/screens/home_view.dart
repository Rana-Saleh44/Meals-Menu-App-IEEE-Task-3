import 'package:flutter/material.dart';
import 'package:task3/widgets/categories_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Meals',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Menu',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        // Use Container to fill the entire screen
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
