import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    return Scaffold(

      //AppBar
      appBar: AppBar(
        title: Text('Profile Screen1'),
        centerTitle: true,
        //Home Button
        leading: IconButton(
            icon: Icon(Icons.settings),
          onPressed: () {
              setState(() {
                print('Appbar Settings button pressed');
              });
          },
        ),
      ),

      body: Container(
        height: size.height,
        child: Column(
          children: [
            //Widgets witch charts
          ],
        ),
      ),
    );
  }
}
