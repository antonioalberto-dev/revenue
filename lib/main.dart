import 'dart:ui';
import 'package:flutter/material.dart';

import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:revenue/screens/categories_meals_screen.dart';
import 'package:revenue/utils/app_routers.dart';
import 'screens/meal_details_screen.dart';

import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting settings = Setting();
  List<Meal> _avalableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Setting setting) {
    setState(() {
      this.settings = settings;
      _avalableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = setting.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = setting.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = setting.isVegan && !meal.isVegan;
        final filterVegetarian = setting.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quarentários',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal,
        // canvasColor: Color.fromRGBO(255, 254, 230, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      ),
      routes: {
        AppRouters.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRouters.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_avalableMeals),
        AppRouters.MEAL_DETAILS: (ctx) => MealDetailsScreen(_toggleFavorite, _isFavorite),
        AppRouters.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
