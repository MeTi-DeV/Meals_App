import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = '/meals-screen-detais';
  final Function toggleFaivories;
  final Function isFavorite;
  MealsDetailsScreen(this.toggleFaivories, this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final MealSelected = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Widget BuildSectionTitle(String text) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.subtitle1),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        height: 150,
        width: 350,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${MealSelected.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                MealSelected.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: MealSelected.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(MealSelected.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            BuildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemCount: MealSelected.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${(index + 1)}'),
                        ),
                        title: Text(
                          '${MealSelected.steps[index]}',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFaivories(mealId),
        child: Icon(isFavorite(mealId)?Icons.star :Icons.star_border),
      ),
    );
  }
}
