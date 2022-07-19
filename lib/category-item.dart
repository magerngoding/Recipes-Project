// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String images;
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Kalo route pake pushNamed
        Navigator.pushNamed(
          context,
          '/recipes',
          arguments: {
            'id': id,
            'title': title,
          },
        );
      },
      child: Container(
        // color dimasukin ke box decoration jika erorr screen merah
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(70, 0, 0, 0),
              blurRadius: 8,
              //   spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage(images),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
