import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
class CategoriesScreen extends StatelessWidget{ //the categories should not be handled with state
    const CategoriesScreen({super.key, required this.onToggleFavourite, required this.availableMeals});

    final void Function(Meal meal) onToggleFavourite;
    final List<Meal> availableMeals;

    void _selectCategory(BuildContext context, Category category){ // to call this method we connect it via on tap method on category_grid_item
      // Navigator.push(context, route); // because context is not globally available for stateless widgets

      final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onToggleFavourite: onToggleFavourite,
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Pick your category'),
            ),
            body: GridView(
              padding: const EdgeInsets.all(24),
                // can set the number of columns we want to have
                // by default cross axis is top to bottom, but this is left to right and we get 2 colums
                // we can get 2 columns horizontally 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    childAspectRatio: 3/2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                ), 
                children: [
                  // availableCategories.map((category) => CategoriesGridItem(category: category)).toList()
                  for( final category in availableCategories)
                    CategoriesGridItem(category: category, onSelectCategory: (){
                      _selectCategory(context, category);
                    },),
                ],),
        );
    }
}