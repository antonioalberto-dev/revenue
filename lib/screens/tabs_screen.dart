import 'package:flutter/material.dart';
import 'package:revenue/components/main_drawer.dart';
import 'package:revenue/models/meal.dart';
import 'package:revenue/screens/favorite_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _farotiteMeals;

  const TabsScreen(this._farotiteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreens(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget._farotiteMeals)
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'],
            style: Theme.of(context).textTheme.headline6),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(
                'Categorias',
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
