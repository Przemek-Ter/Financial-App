import 'package:flutter/material.dart';
import 'package:project_app2/object_Classes/category.dart';

class CategoriesSlider extends StatelessWidget {

  //Category
  Category category = new Category(1, 'No Category');

  CategoriesSlider({this.category});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.fastfood_rounded),
                iconSize: 50,
                onPressed: () {
                  Category tmpCategory = new Category(1, 'Food');
                  category = tmpCategory;
                  print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
                },
            ),
            IconButton(
              icon: Icon(Icons.directions_car),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 2;
                category.name = 'Car';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.sports_basketball_sharp),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 3;
                category.name = 'Sport';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.airplanemode_active_rounded),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 4;
                category.name = 'Travel';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.home_work),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 5;
                category.name = 'Household';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.tv),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 6;
                category.name = 'Electronics';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.local_hospital),
              iconSize: 50,
              onPressed: () {
                category.indexNumber = 7;
                category.name = 'Health';
                print('Category named ${category.name}, and number ${category.indexNumber} was pressed');
              },
            ),
          ],
        ),
      ),
    );
  }

  Category getCategory() {
    return this.category;
  }

}