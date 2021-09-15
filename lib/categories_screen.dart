import 'package:flutter/material.dart';
import './dummy_data.dart';
import './categories_item.dart';
import './categories_meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  //comment 1 :make a function to handle between CategotiesMealsScreen
  void SelectCategory(BuildContext ctx) {
    //comment 2 :use Navigator and get push() method to change screens between CategotiesMealsScreen and main screen
    // have to  define BuildContext ctx to pass this page data to function to be able come back to main screen
    Navigator.of(ctx).push(
      //comment 3 : MaterialPageRoute() hase a builder atribute for build our custom widget
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('MealsApp'),
        ),
        //comment 4 : use InkWell to our change container clickable element
        body: InkWell(
          onTap: ()=>SelectCategory(context),
          child: Container(
            padding: EdgeInsets.all(15),
            child: GridView(
              children: [
                ...DUMMY_CATEGORIES
                    .map((catData) =>
                        CategoriesItem(catData.title, catData.color))
                    .toList()
              ],
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
            ),
          ),
        ));
  }
}
