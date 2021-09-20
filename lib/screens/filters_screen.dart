import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
//comment first change this widget to StatefulWidget
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  //comment 1 : define a Function saveFilter to save each filter and save to MealsItem
  final Function saveFilter;
  //comment 2 : define a currentFilter to save filters for each changing screens
  final Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveFilter);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  @override
  //comment 3 : use initState to save and safe filter that we choosen from previouse choises 
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSwitchListTile(
      String title,
      String subtitle,
      bool currentValue,
      Function(bool) _updateValue,
    ) {
      return SwitchListTile(
          value: currentValue,
          onChanged: _updateValue,
          title: Text(title),
          subtitle: Text(subtitle));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilter(selectFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include the Vegetarian Meal',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include the Gluten-free Meal',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only include the Lactose Free Meal',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include the Vegan Meal', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
