import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    //comment 1 : add Navigation bar this navigation go to top of screen
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Categories',
                icon: Icon(Icons.category),
              ),
              Tab(
                text: 'Favorites',
                icon: Icon(Icons.star_rate_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoriteScreen()
        ]),
      ),
    );
  }
}
