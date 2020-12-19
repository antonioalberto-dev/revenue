import 'package:flutter/material.dart';
import 'package:revenue/components/main_drawer.dart';
import 'package:revenue/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Setting setting;
  final Function(Setting) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.setting);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  Setting settings;

  void initState() {
    super.initState();
    settings = widget.setting;
  }
  
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filtros',
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem glutén',
                  'Exibir refeições sem glutén',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = true),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Exibir refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = true),
                ),
                _createSwitch(
                  'Vegana',
                  'Exibir refeições veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = true),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Exibir refeições vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
