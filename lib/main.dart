import 'package:flutter/material.dart';

import 'package:flutter_budget_ui/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Budget UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /**
         * in material 3, primaryColor
         * doesn't directly control the AppBar color
         * 
         */
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.green, foregroundColor: Colors.white),
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
