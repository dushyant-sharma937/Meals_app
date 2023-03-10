import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  const FavoritesScreen(this.favouriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'Nothing is added to Favorites :(',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontSize: 24,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageurl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
