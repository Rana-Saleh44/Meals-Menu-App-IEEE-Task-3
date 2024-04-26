import 'package:flutter/material.dart';
import 'package:task3/models/food_model.dart';

class FeaturedRecipesListView extends StatelessWidget {
  final List<FoodModel> featuredRecipes; // List of featured recipes

  const FeaturedRecipesListView({Key? key, required this.featuredRecipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (featuredRecipes.isEmpty) {
      return const Center(
        child: Text(
          "No Featured Recipes Yet",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true, // Prevent excessive scrolling
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: featuredRecipes.length,
      itemBuilder: (context, index) {
        final food = featuredRecipes[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          title: Text(
            food.food_title!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '\$${food.food_price!}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            "${food.rating!}",
            style: const TextStyle(
              color: Color.fromARGB(255, 131, 101, 18),
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
          leading: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              food.food_poster_url!,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
