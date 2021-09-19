import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
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
            AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'Raleway' , fontSize:22 ,color: Colors.white)),
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
        //comment 1 : add TabsScreen as default route 
       '/':(ctx)=>TabsScreen(),
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(),
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
