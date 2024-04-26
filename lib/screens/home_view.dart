import 'package:flutter/material.dart';
import 'package:task3/data/dummy_data.dart';
import 'package:task3/widgets/categories_list_view.dart';
import 'package:task3/widgets/featured_recipes_list_view.dart'; // Import for Featured Recipes;

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
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Menu',
              style: TextStyle(
                color: Color.fromARGB(255, 156, 58, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          // Use SingleChildScrollView for non-scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              // Text "Categories" before listing
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16), // Add spacing

              // Existing CategoriesListView
              const CategoriesListView(),

              // Text "Featured Recipes" after listing
              const SizedBox(height: 16), // Add spacing
              const Text(
                'Featured Recipes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Featured Recipes with sample data
              FeaturedRecipesListView(
                featuredRecipes: featuredMeals,

                  // Add more sample recipes here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
