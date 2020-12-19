import 'package:flutter/material.dart';

import '../utils/app_routers.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),   
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child:          
            Text(
              'Quarentenados',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          _createItem(
            Icons.category,
            'Categorias',
            () => Navigator.of(context).pushReplacementNamed(AppRouters.HOME),
          ),
          _createItem(
            Icons.settings,
            'Filtros',
            () => Navigator.of(context).pushReplacementNamed(AppRouters.SETTINGS),
          ),
        ],
      ),
      
    );
  }
}
