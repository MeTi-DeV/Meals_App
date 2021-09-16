import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final String categoryTitle;
  // final String categoryId;
  // CategoriesMealsScreen(this.categoryTitle, this.categoryId);
  @override
  Widget build(BuildContext context) {
    //comment 1 : define a variable for the arguments we passed in category_item and storage them in this variable
    // as Map<String, String>> 
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: Text('The Recipes for the Categories!'),
    );
  }
}
