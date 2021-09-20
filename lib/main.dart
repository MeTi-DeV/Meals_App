import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meals_details_screen.dart';
import './dummy_data.dart';
import '../models/meals.dart';

void main() {
  runApp(MyApp());
}
//comment 1 : change main to statefulWidget because here is only place that we can pass data to FiltersScreen
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //comment 2 : first define filters here
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  //comment 5 : then we define a variable for put all DUMMY_MEALS data to itself
  List<Meal> _availableMeals = DUMMY_MEALS;
  //comment 3 :second define filter seter Function this function have to has Map as arguments 
  // to compare the user filter choosed and current available filters
  void _setFilter(Map<String, bool> filterData) {
      //comment 4 : here we generate setState function
       // and then compare _filters (default filters) and filterData (filters that user choosed)
    setState(() {
      _filters = filterData;
      //comment 6 : after limited _availableMeals with all DUMMY_MEALS data with flters that user choosed and then pass this to CategoriesMealsScreen
      _availableMeals = DUMMY_MEALS.where((meal) {
        //comment 7 : each if say : if _filters['...'] was true and meal.is... was true return false
        //meaning dont show this categories
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Raleway', fontSize: 22, color: Colors.white)),
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

      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        //comment 8 :pass limited Meals to CategoriesMealsScreen
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(_availableMeals),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(),
        //comment 9 : _filters send for initState in FiltersScreen and _setFilter for filters handler
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilter),
      },

      // onGenerateRoute: (setting) {
      //   print(setting.arguments);
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
