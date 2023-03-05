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
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleMedium),
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
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
                  (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals.', _lactoseFree, (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }),
              Container(
                margin: const EdgeInsets.only(top: 250, left: 270),
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
                  child: const Icon(Icons.save_sharp),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
