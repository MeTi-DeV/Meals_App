import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildTileList(String title, IconData icon, Function() tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
            ),
          ),
         
          buildTileList('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          
          buildTileList(
            'Filter',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
