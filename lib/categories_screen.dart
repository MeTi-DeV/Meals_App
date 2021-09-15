import 'package:flutter/material.dart';
import './dummy_data.dart';
import './categories_item.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MealsApp'),),
       body: Container(
         padding: EdgeInsets.all(15),
         child: GridView(
      children: [
          ...DUMMY_CATEGORIES
              .map((catData) => CategoriesItem(catData.title, catData.color))
              .toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
    ),
       ));
  }
}
