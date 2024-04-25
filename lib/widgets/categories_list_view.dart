import 'package:flutter/material.dart';
import 'package:task3/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(
      imageAssetUrl: 'assets/Breakfast.jpg',
      categoryName: 'Breakfast',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Indian.jpg',
      categoryName: 'Indian',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Italian.jpg',
      categoryName: 'Italian',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Middle Eastern.jpg',
      categoryName: 'Middle East',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Oriental.jpg',
      categoryName: 'Oriental',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Vegan_Vegetarian.jpg',
      categoryName: 'Vegan/Vegetarian',
    ),
    CategoryModel(
      imageAssetUrl: 'assets/Thai.jpg',
      categoryName: 'Thai',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
