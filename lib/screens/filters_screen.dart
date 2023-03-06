import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currenFilters;
  const FiltersScreen(this.saveFilters, this.currenFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currenFilters['gluten']!;
    _vegetarian = widget.currenFilters['vegetarian']!;
    _vegan = widget.currenFilters['vegan']!;
    _lactoseFree = widget.currenFilters['lactose']!;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      inactiveThumbColor: const Color.fromARGB(255, 52, 39, 0),
      inactiveTrackColor: const Color.fromARGB(255, 75, 74, 73),
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.019,
                left: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(15)),
            child: Text('Adjust your meal selection.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile('Gluten-free',
                  'Only include glutten-free meals.', _glutenFree, (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              Divider(
                  color: Theme.of(context).colorScheme.primary, thickness: 1),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              Divider(
                  color: Theme.of(context).colorScheme.primary, thickness: 1),
              _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
                  (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }),
              Divider(
                  color: Theme.of(context).colorScheme.primary, thickness: 1),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals.', _lactoseFree, (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }),
              Divider(
                  color: Theme.of(context).colorScheme.primary, thickness: 1),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18,
                    left: MediaQuery.of(context).size.width * 0.7),
                child: FloatingActionButton(
                  onPressed: () {
                    final selectedFilters = {
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegan': _vegan,
                      'vegetarian': _vegetarian,
                    };
                    widget.saveFilters(selectedFilters);
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(Icons.save_sharp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
