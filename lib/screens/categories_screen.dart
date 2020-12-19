import 'package:flutter/material.dart';
import 'package:revenue/components/category_item.dart';
import 'package:revenue/data/dummy_data.dart';

class CategoriesScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //cada elemento vai ter extensao max de 200px
          childAspectRatio:
              4/1, //a proporcao do tamanho de cada elemento. ex.: 1x1, 1x2
          crossAxisSpacing: 20, // espaçamento no eixo cruzado
          mainAxisSpacing: 20, // espaçamento no eixo principal
        ),
        children: 
        DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
