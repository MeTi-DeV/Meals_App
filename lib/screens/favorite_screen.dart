import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (favoriteMeals.isEmpty)
          ? Center(
              child: Text('you can add your favorite meals here'),
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (BuildContext context, int index) {
                return MealsItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    ImgUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    complexity: favoriteMeals[index].complexity,
                    affordability: favoriteMeals[index].affordability);
              },
            ),
    );
  }
}