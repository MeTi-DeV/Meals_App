import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //comment 2 : make data title and adresss as List<Map<... to be able pass data better
  List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Favorites'},
  ];
//comment 1 : define  _selectedPageIndex to change between pages
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //comment 3 : pass current title of page to appBar title
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      //comment 4 : define _pages and atributes as home page to change between CategoriesScreen and FavoriteScreen
      body: _pages[_selectedPageIndex]['page'],
      //comment 5 : bottomNavigationBar is atributes for make our bottom navigation
      bottomNavigationBar: BottomNavigationBar(
      
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //comment 9 : type give us how to make a navigation with a bit animation
        type:BottomNavigationBarType.shifting ,
        //comment 6 : onTap is second important part to handle between CategoriesScreen and FavoriteScreen
        onTap: _selectPage,
        //comment 7 : an other important part is item its palce for us to create our Navigation items
        items: [
          //comment 8 : for each Navigation Item we should use BottomNavigationBarItem and pass data to its properties
          BottomNavigationBarItem(
           
              icon: Icon(Icons.category),
              label: _pages[_selectedPageIndex]['title'],
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline_outlined),
            label: _pages[_selectedPageIndex]['title'],
          ),
        ],
      ),
    );
  }
}
