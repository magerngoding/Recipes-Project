// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipes_project/category-item.dart';
import 'package:recipes_project/dummy-data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 10 / 12,
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories[index];

        return CategoryItem(
          id: category.id,
          title: category.title,
          images: category.images,
        );
      },
    );
  }
}
