import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Home Screen'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          // Add more options for the drawer as needed
        ],
      ),
    );
  }
}
