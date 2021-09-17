import 'package:flutter/material.dart';
import '../models/meals.dart';

// comment 1 : define this widget for show summary of each item
class MealsItem extends StatelessWidget {
  final String title;
  final String ImgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealsItem(
      {required this.title,
      required this.ImgUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});
  @override
  Widget build(BuildContext context) {
    void selectMeal() {}
    return InkWell(
      onTap: selectMeal,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // comment 2 : use this widget to make  pleacement for image and meal title for later
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  //comment 3 : use network property to getting Url image from web
                  child: Image.network(
                    ImgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
