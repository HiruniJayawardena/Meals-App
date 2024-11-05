import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + 
      meal.complexity.name.substring(1);
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + 
      meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge, // otherwise the Stack doesn't allow to get the shape
      elevation: 2, // add shadow to give 3D effect
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // if the image is too big it will be cropped and resized to fit the container
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54, // Colors.black.withOpacity(0.5), <- slightly transparent
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true, // text is wrapped in a good looking way 
                      overflow: TextOverflow.ellipsis,  // if we had a very long text it would add ... (3 dots) at the end
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(children: [
                      MealItemTrait(
                        icon: Icons.schedule, 
                        label: '${meal.duration} mins'
                      ),
                      const SizedBox(width: 12,),
                      MealItemTrait(
                        icon: Icons.work, 
                        label: complexityText
                      ),
                      const SizedBox(width: 12,),
                      MealItemTrait(
                        icon: Icons.attach_money, 
                        label: affordabilityText
                      ),
                      const SizedBox(width: 12,),
                    ],),
                  ],),  
              ),
            ),
          ],
        ),
      ),);
  }
}