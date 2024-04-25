import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Categories'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}
