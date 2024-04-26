// ignore_for_file: non_constant_identifier_names

class FoodModel {
  final String food_catigory;
  final String food_type;
  final String food_title;
  final int food_price;
  final double rating;
  final String food_poster_url;
  final List<String> ingredients;
  final List<String> steps;

  FoodModel(
      this.food_catigory,
      this.food_type,
      this.food_title,
      this.food_price,
      this.rating,
      this.food_poster_url,
      this.ingredients,
      this.steps);
}

