import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meals_item.dart';

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
          //comment 1 : pass DUMMY_MEALS data to MealsItem widget and use them
          return MealsItem(
            id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              ImgUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
      ),
    );
  }
}
