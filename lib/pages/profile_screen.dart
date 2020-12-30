import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app2/object_Classes/category.dart';
import 'package:project_app2/object_classes/invoice.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

//Category list (from Database)
List<Category> categoryList = [
  new Category(0, 'No Category'),
  new Category(1, 'Food'),
  new Category(2, 'Car'),
  new Category(3, 'Materials'),
];
//Invoice List
List<Invoice> invoiceList = [
  new Invoice(100, 23, '10-10-2020', 0),
  new Invoice(500, 7, '10-10-2020', 1),
  new Invoice(1000, 0, '10-10-2020', 3),
  new Invoice(34, 23, '10-10-2020', 0),
  new Invoice(2375, 7, '10-10-2020', 2),
  new Invoice(75.43, 23, '10-10-2020', 2),
  new Invoice(300, 23, '10-10-2020', 1),
  new Invoice(200, 8, '10-10-2020', 0),
  new Invoice(100, 23, '10-10-2020', 0),
  new Invoice(500, 7, '10-10-2020', 1),
  new Invoice(1000, 0, '10-10-2020', 3),
  new Invoice(34, 23, '10-10-2020', 0),
  new Invoice(2375, 7, '10-10-2020', 2),
  new Invoice(75.43, 23, '10-10-2020', 2),
  new Invoice(300, 23, '10-10-2020', 1),
  new Invoice(200, 8, '10-10-2020', 0),
  new Invoice(534.76, 23, '21-09-2015', 1),
];


class _ProfileScreenState extends State<ProfileScreen> {

  List<PieChartSectionData> sections = List<PieChartSectionData>();


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
            Container(
              child: PieChart(
                PieChartData(

                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
