import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

//comment 1 : create Drawer body here
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //comment 2 : split Drawer menues to a single Widget with arguments like title and icon tapHandler for change between pages Categories and filters_screen
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
          //comment 3 : use pushReplacementNamed because its better for catching of app
          //if use pushNamed its so bad and stack pages top of each page and its make performance of app so slow
          //after pass '/' as route of Meals item
          buildTileList('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
//comment 4 : pass FiltersScreen route to 
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
