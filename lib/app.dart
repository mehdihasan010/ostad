import 'package:flutter/material.dart';
import 'package:module_13_assignment/presentation/screens/home_screen.dart';

class MyBagApp extends StatelessWidget {
  const MyBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
