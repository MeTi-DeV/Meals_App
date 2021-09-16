import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'category_item.dart';


class CategoriesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('MealsApp'),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: GridView(
              children: [
                ...DUMMY_CATEGORIES
                    .map((catData) =>
                        CategoryItem(catData.title, catData.color , catData.id))
                    .toList()
              ],
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
            ),
          ),
       );
  }
}
