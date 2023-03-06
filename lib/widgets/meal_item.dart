import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageurl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
      if (value != null) {
        // removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.0015,
            horizontal: MediaQuery.of(context).size.width * 0.01),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageurl,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                // Positioned(
                //   bottom: 10,
                //   right: 55,
                //   child: Container(
                //     width: 280,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       border: Border.all(color: Colors.black54),
                //       color: const Color.fromARGB(143, 255, 193, 7),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 5,
                //       horizontal: 20,
                //     ),
                // child: Text(
                //   title,
                //   style: const TextStyle(
                //     fontSize: 26,
                //     color: Color.fromARGB(255, 0, 0, 0),
                //   ),
                //   softWrap: true,
                //   overflow: TextOverflow.fade,
                // ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w500),
                      )),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: const Icon(Icons.schedule),
                            ),
                            Text('$duration min',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: const Icon(Icons.work),
                            ),
                            Text(complexityText,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.003),
                              child: const Icon(Icons.attach_money_rounded),
                            ),
                            Text(affordabilityText,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
