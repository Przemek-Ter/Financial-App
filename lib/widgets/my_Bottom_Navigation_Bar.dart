import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Dependencies
import 'package:date_time_picker/date_time_picker.dart';
import 'package:project_app2/widgets/addButton.dart';

//Functionalities
import 'package:project_app2/widgets/categories.dart';


//Pages
import 'package:project_app2/pages/profile_Screen.dart';
import 'package:project_app2/pages/DataScreen.dart';


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

  //Values for adding data
  double amount = 0;
  int taxValue = 23;

  //Values for choosing category
  CategoriesScroller categoryScroller = CategoriesScroller();
  int categoryNumber;

  //Value for choosing date and time
  String selectedTime = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Pages
      body: pagesList[currentPage],

      //Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        //Setting page
        onTap: (index) {
          setState(() {
            currentPage = index;

          });
        },
        currentIndex: currentPage,
        //List of buttons in bar
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

      //Main Button
      floatingActionButton: AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //Functions


}
