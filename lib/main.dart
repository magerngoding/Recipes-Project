// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipes_project/category-screen.dart';
import 'package:recipes_project/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/recipes': (context) => Recipe(),
      },
      initialRoute: '/', // yang pertama di buka
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: CategoryScreen(),
    );
  }
}
