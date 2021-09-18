import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meals_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'Raleway')),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen()
      },
      //comment 1 : other properties that are for routes ar onGenerateRoute and onUnknownRoute
      //comment 2 : onGenerateRoute: is for route that we want to use several different routes for do multiple behaviors with if statements
      onGenerateRoute: (setting) {
        print(setting.arguments);
      },
      //comment 3 : onUnknownRoute: when we want to show a specific page When we dont define any route to InkWell like not found page error 404
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
