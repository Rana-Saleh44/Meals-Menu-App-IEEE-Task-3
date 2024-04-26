import 'package:flutter/material.dart';
import 'package:task3/models/food_model.dart';
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
                color: const Color.fromARGB(255, 156, 58, 1),
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          // Use SingleChildScrollView for non-scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              // Text "Categories" before listing
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16), // Add spacing

              // Existing CategoriesListView
              CategoriesListView(),

              // Text "Featured Recipes" after listing
              SizedBox(height: 16), // Add spacing
              Text(
                'Featured Recipes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Featured Recipes with sample data
              FeaturedRecipesListView(
                featuredRecipes: [
                  FoodModel(
                    "Italian",
                    "Vegan",
                    "A Vegan Stir-Fry",
                    21,
                    2.5,
                    "assets/Vegan-Stir-Fry-006.webp",
                  ),
                  FoodModel(
                    "Middel East",
                    "Gluten Free",
                    "Cheesy Skillet Chicken Parm Meatballs",
                    10,
                    4,
                    "assets/Cheesy-Skillet-Chicken-Parm-Meatballs_012-tight-cropped.webp",
                  ),
                  FoodModel(
                    "Indian",
                    "Vegetarian",
                    "Creamy-Cajun-Chicken",
                    35,
                    2,
                    "assets/Creamy-Cajun-Chicken-6.webp",
                  ),
                  FoodModel(
                    "Oriental",
                    "Vegan",
                    "Beef Burger",
                    17,
                    1,
                    "assets/wp7029319.webp", // Replace with a relevant image
                  ),
                  FoodModel(
                    "Italian",
                    "Lactose Free",
                    "Pizza",
                    34,
                    3.7,
                    "assets/1050377.jpg",
                  ),
                  FoodModel(
                    "Oriental",
                    "Vegan",
                    "Koshary",
                    1,
                    5,
                    "assets/Egyptian-Koshari-square-768x768.jpg",
                  ),

                  // Add more sample recipes here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
