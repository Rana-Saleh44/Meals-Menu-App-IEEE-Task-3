import 'package:flutter/material.dart';
import 'package:task3/models/food_model.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen({super.key, required this.meal});

  FoodModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 58, 1),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            meal.food_title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            meal.food_poster_url,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          const Text('Ingredients',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 156, 58, 1),
              )),
          const SizedBox(height: 14),
          for (final ingredient in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                ingredient,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          const SizedBox(height: 24),
          const Text('Cooking Steps',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 156, 58, 1),
              )),
          const SizedBox(height: 14),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          const SizedBox(height: 14),
        ]),
      ),
    );
  }
}
