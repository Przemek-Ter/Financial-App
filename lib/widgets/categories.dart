import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {

  //Variables
  int categoryNumber = 0;

  CategoriesScroller({this.categoryNumber});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      //Options
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
                  categoryNumber = 1;
                  print('Food category pressed $categoryNumber');
                },
            ),
            IconButton(
              icon: Icon(Icons.directions_car),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 2;
                print('Car category pressed $categoryNumber');
              },
            ),
            IconButton(
              icon: Icon(Icons.sports_basketball_sharp),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 3;
                print('Sport category pressed $categoryNumber');
              },
            ),
            IconButton(
              icon: Icon(Icons.airplanemode_active_rounded),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 4;
                print('Travel category pressed $categoryNumber');
              },
            ),
            IconButton(
              icon: Icon(Icons.home_work),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 5;
                print('House category pressed $categoryNumber');
              },
            ),
            IconButton(
              icon: Icon(Icons.tv),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 6;
                print('TV category pressed $categoryNumber');
              },
            ),
            IconButton(
              icon: Icon(Icons.local_hospital),
              iconSize: 50,
              onPressed: () {
                categoryNumber = 7;
                print('Health category pressed $categoryNumber');
              },
            ),
          ],
        ),
      ),

    );
  }

  int getCategoryNumber() {
    return categoryNumber;
  }
}