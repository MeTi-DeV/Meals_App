import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import '../models/meals.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String ImgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealsItem(
      {required this.id,
      required this.title,
      required this.ImgUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});
  String? get complexityTitle {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        'Unknown';
    }
  }

  String? get affordabilityTitle {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordability';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal(BuildContext context) {
      Navigator.of(context)
          .pushNamed(MealsDetailsScreen.routeName, arguments: id);
    }

    return Column(
      children: [
        InkWell(
          onTap: ()=>selectMeal(context),
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
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        ImgUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //comment 1 : only in Stack we can define Positioned() class for change possition of our next elements on Stack
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        width: 300,
                        color: Colors.black54,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            overflow: TextOverflow.fade,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text('$duration min'),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.schedule)
                        ],
                      ),
                      Row(
                        children: [
                          Text(complexityTitle!),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.done_all_sharp)
                        ],
                      ),
                      Row(
                        children: [
                          Text(affordabilityTitle!),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.attach_money,
                            
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
