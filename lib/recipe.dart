// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipes_project/dummy-data.dart';
import 'package:recipes_project/models/food.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    // Mengambil data yang telah dikirim
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Untuk mengambil data dari model
    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          argsRecipe['title'],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: filteredFood.length,
          itemBuilder: (context, index) {
            // baru nama variable baru filteredFood -> food
            final food = filteredFood[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/details-food', arguments: {
                  'title': food.title,
                  'ingredients': food.ingredients,
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    // String interpoletion
                                    ' ${food.duration} mins ',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav; // true

                                    food.isFavorite = !isFav; // false
                                  });
                                },
                                icon: Icon(
                                  food.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
