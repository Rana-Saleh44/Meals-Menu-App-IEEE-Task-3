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
// import 'package:flutter/material.dart';
// import 'package:task3/screens/home_view.dart';

// import 'screens/categories_screen.dart';

// void main() {
//   runApp(MealsMenuApp());
// }

// class MealsMenuApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Meals Menu App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         hintColor: Colors.amber,
//         canvasColor: Color.fromRGBO(255, 254, 229, 1),
//         fontFamily: 'Raleway',
//         textTheme: ThemeData.light().textTheme.copyWith(
//               bodyText1: TextStyle(
//                 color: Color.fromRGBO(20, 51, 51, 1),
//               ),
//               bodyText2: TextStyle(
//                 color: Color.fromRGBO(20, 51, 51, 1),
//               ),
//               headline6: TextStyle(
//                 fontSize: 20,
//                 fontFamily: 'RobotoCondensed',
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//       ),

//   }
// }
