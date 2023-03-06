import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {super.key});

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          // color: const Color.fromARGB(255, 68, 68, 68),
          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.95,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).colorScheme.primary,
                    shadowColor: Colors.black,
                    elevation: 5,
                    surfaceTintColor: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                context),
            buildSectionTitle('Steps', context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Text(
                            '# ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index],
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 84, 0, 0),
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
                context)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        backgroundColor: Colors.black,
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.amber,
        ),
      ),
    );
  }
}
