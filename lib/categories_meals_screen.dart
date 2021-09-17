import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryTitle;
  // final String categoryId;
  // CategoriesMealsScreen(this.categoryTitle, this.categoryId);
  @override
  Widget build(BuildContext context) {
    // as Map<String, String>>
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
//comment 1 : split part of DUMMY_MEALS by categories id and use contains to flitter Meals by id
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(categoryMeals[index].title);
        },
      ),
    );
  }
}
