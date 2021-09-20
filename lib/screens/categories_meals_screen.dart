import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';
import '../models/meals.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoriesMealsScreen(this.availableMeals);
  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  @override
  Widget build(BuildContext context) {
    // as Map<String, String>>
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget.availableMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
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
