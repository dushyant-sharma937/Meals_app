import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, Function() tapHandler, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(ctx).colorScheme.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Container(
              margin: MediaQuery.of(context)
                  .padding, // const EdgeInsets.only(top: 20, left: 50),
              child: Text(
                'Cooking Up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }, context),
        ],
      ),
    );
  }
}
