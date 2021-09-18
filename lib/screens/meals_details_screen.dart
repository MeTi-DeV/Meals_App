import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = '/meals-screen-detais';
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
    );
  }
}
