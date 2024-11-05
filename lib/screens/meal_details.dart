import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget{
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // we use scaffold when we want to open a new screen 
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [ 
          Image.network( // we use network becase the image urls are stored in network
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 14,),
          Text(
            'Ingredients', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          for(final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
        ],
      ),
    );
  }
}