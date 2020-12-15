import 'package:flutter/material.dart';

import 'package:project_app2/widgets/my_Bottom_Navigation_Bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    //dane

    return Scaffold(

      //AppBar
      appBar: AppBar(
        title: Text('Profile Screen'),
        centerTitle: true,
        //Home Button
        leading: IconButton(
            icon: Icon(Icons.home),
          onPressed: () {
              setState(() {
                print('Appbar Home button pressed');
              });
          },
        ),
        //Search and Settings Button
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  print('Appbar Search button pressed');
                });
              }
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  print('Appbar Settings button pressed');
                });
              }
          ),
        ],
      ),

      body: Container(
        height: size.height,
        child: Column(
          children: [
            //wykres
          ],
        ),

      ),
    );
  }
}
