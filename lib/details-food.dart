// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class DetailsFood extends StatelessWidget {
  const DetailsFood({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<String> ingredients = argsFood['ingredients'];
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // Menentukan lebar dari layar HP
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            Text(
              argsFood['title'],
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${ingredients.length} items'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // List view dilarang didalam column/row
            Expanded(
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  final ing = ingredients[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(ing),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
