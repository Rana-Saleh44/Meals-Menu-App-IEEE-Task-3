import 'package:flutter/material.dart';
import 'package:task3/screens/home_view.dart';

void main() {
  runApp(const MealsMenuApp());
}

class MealsMenuApp extends StatelessWidget {
  const MealsMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
