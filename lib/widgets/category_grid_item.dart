import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget{
  const CategoriesGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
   return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
   );
  }
}