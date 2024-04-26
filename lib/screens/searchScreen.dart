import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3/models/food_model.dart';
import 'package:task3/widgets/main_drawer.dart';
import 'package:task3/screens/meal_detail.dart';
import 'package:task3/data/dummy_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SearchPage(
      selectedCategory: category,
    );
  }
}

class SearchPage extends StatefulWidget {
  final String selectedCategory; // Add a field to receive the selected category

  const SearchPage({super.key, required this.selectedCategory});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

void _selectMeal(BuildContext context, FoodModel meal) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
  );
}

class _SearchPageState extends State<SearchPage> {
  // Dummy food list
/*   static List<FoodModel> mainFoodList = [
    FoodModel("Italian", "Vegan", "aVegan-Stir-Fry", 21, 2.5,
        "assets/Vegan-Stir-Fry-006.webp"),
    FoodModel(
        "Middle East",
        "Gluten Free",
        "aCheesy-Skillet-Chicken-Parm-Meatballs",
        10,
        4,
        "assets/Cheesy-Skillet-Chicken-Parm-Meatballs_012-tight-cropped.webp"),
    FoodModel("Break fast", "Lactose Free", "Steak", 33, 5,
        "assets/easy-dinner-recipes-f768402675e04452b1531360736da8b5.jpg"),
    FoodModel("Middle East", "Gluten Free", "Chicken and Rice", 16, 1.5,
        "assets/sub-buzz-1009-1646440684-8.jpg"),
    FoodModel("Indian", "Vegetarian", "Creamy-Cajun-Chicken", 35, 2,
        "assets/Creamy-Cajun-Chicken-6.webp"),
    FoodModel(
        "Oriental", "Vegan", "Beef Burger", 17, 1, "assets/wp7029319.webp"),
    FoodModel(
        "Italian", "Lactose Free", "Pizza", 34, 3.7, "assets/1050377.jpg"),
    FoodModel("Oriental", "Vegan", "Koshary", 1, 5,
        "assets/Egyptian-Koshari-square-768x768.jpg"),
  ];
 */

  static List<FoodModel> mainFoodList = availableMeals;

  // List to display and filter
  List<FoodModel> display_list = List.from(mainFoodList);

  void updateList(String value) {
    // Filter data based on search term (unchanged)
    setState(() {
      display_list = mainFoodList
          .where((element) =>
              element.food_title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  List<String> selectedFoodTypes = [];

  // Function to update selected food types and filter the list
  void updateSelectedFoodTypes(String foodType) {
    setState(() {
      if (selectedFoodTypes.contains(foodType)) {
        // If food type is already selected, remove it
        selectedFoodTypes.remove(foodType);
      } else {
        // Otherwise, add it to the selected food types list
        selectedFoodTypes.add(foodType);
      }
      // Filter the list based on selected food types and category
      filterList();
    });
  }

  // Function to filter the list based on selected food types and category
  void filterList() {
    setState(() {
      if (selectedFoodTypes.isEmpty && widget.selectedCategory.isEmpty) {
        // Display all items if no filters are applied
        display_list = List.from(mainFoodList);
      } else if (selectedFoodTypes.isEmpty) {
        // Filter by category only
        display_list = mainFoodList
            .where((food) => food.food_type == widget.selectedCategory)
            .toList();
      } else if (widget.selectedCategory.isEmpty) {
        // Filter by selected food types only
        display_list = mainFoodList
            .where((food) => selectedFoodTypes.contains(food.food_type))
            .toList();
      } else {
        // Filter by both category and selected food types
        display_list = mainFoodList
            .where((food) =>
                food.food_type == widget.selectedCategory &&
                selectedFoodTypes.contains(food.food_type))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Meals'),
        backgroundColor: const Color.fromARGB(255, 156, 58, 1),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Find Food",
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 156, 58, 1),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 156, 58, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Koshry",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Wrap(
              spacing: 8.0,
              children: [
                buildFilterButton(
                  "Gluten Free",
                ),
                buildFilterButton("Lactose Free"),
                buildFilterButton("Vegetarian"),
                buildFilterButton("Vegan"),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: display_list.length == 0
                  ? const Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: mainFoodList.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          _selectMeal(context, display_list[index]);
                        },
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the left
                          children: [
                            Text(
                              display_list[index].food_title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 4.0), // Add a small vertical space
                            Text(
                              "${display_list[index].food_type} - ${display_list[index].food_catigory}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          '${display_list[index].food_price}\$',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "${display_list[index].rating}",
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
                            display_list[index].food_poster_url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build filter button
  Widget buildFilterButton(String foodType) {
    bool isSelected = selectedFoodTypes.contains(foodType);
    return ElevatedButton(
      onPressed: () => updateSelectedFoodTypes(foodType),
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 156, 58, 1),
              ) // Change to your selected color
            : null,
      ),
      child: Text(
        foodType,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
