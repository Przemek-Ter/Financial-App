import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app2/widgets/add_button.dart';
import 'package:project_app2/pages/profile_screen.dart';
import 'package:project_app2/pages/data_screen.dart';


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  //List of Pages
  int currentPage = 0;
  List<Widget> pagesList = [
    ProfileScreen(),
    DataScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Page field
      body: pagesList[currentPage],

      //Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              label: 'Data'
          ),
        ],
      ),

      //Add button
      floatingActionButton: AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}