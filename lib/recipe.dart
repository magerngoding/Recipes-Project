import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final String idCategory;
  final String title;

  const Recipe({
    super.key,
    required this.idCategory,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Recipe'),
      ),
    );
  }
}
