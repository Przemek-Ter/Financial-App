import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app2/object_classes/invoice.dart';
import 'package:project_app2/object_classes/categories_list.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

//====================================================
//Categories list object
CategoriesList categoriesList = new CategoriesList();
bool wasAdded = false;
//simulation method
void simulation() {
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

  if (wasAdded != true) {
    for (int i = 0; i < invoiceList.length; i++) {
      categoriesList.categoriesList[invoiceList[i].categoryNumber].addInvoice(invoiceList[i]);
    }
  }
  wasAdded = true;
  print('${categoriesList.categoriesList[2].invoiceList}');
}
//====================================================


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    simulation();

    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text('Profile Screen1'),
        centerTitle: true,
        //Settings Button
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
              color: Colors.white,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 3,
                  centerSpaceRadius: 40,
                  sections: showSections(categoriesList),
                )
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Category 0
                  Row(
                    children: [
                      SizedBox(width: 125,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 30, height: 30, color: Colors.red,),
                      ),
                      Text('Category 0 - ${categoriesList.categoriesList[0].amountSum()}'),
                      Spacer(),
                    ],
                  ),
                  //Category 1
                  Row(
                    children: [
                      SizedBox(width: 125,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 30, height: 30, color: Colors.green,),
                      ),
                      Text('Category 1 - ${categoriesList.categoriesList[1].amountSum()}'),
                      Spacer(),
                    ],
                  ),
                  //Category 2
                  Row(
                    children: [
                      SizedBox(width: 125,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 30, height: 30, color: Colors.amber,),
                      ),
                      Text('Category 2 - ${categoriesList.categoriesList[2].amountSum()}'),
                      Spacer(),
                    ],
                  ),
                  //Category 3
                  Row(
                    children: [
                      SizedBox(width: 125,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 30, height: 30, color: Colors.blue,),
                      ),
                      Text('Category 3 - ${categoriesList.categoriesList[3].amountSum()}'),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showSections(CategoriesList categoriesList) {
    return List.generate(4, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            value: categoriesList.percentOfAll(0),
            title: '${categoriesList.categoriesList[0].amountSum()}',
            color: Colors.red,
            radius: 60,
          );
        case 1:
          return PieChartSectionData(
            value: categoriesList.percentOfAll(1),
            title: '${categoriesList.categoriesList[1].amountSum()}',
            color: Colors.green,
            radius: 60,
          );
        case 2:
          return PieChartSectionData(
            value: categoriesList.percentOfAll(2),
            title: '${categoriesList.categoriesList[2].amountSum()}',
            color: Colors.amber,
            radius: 60,
          );
        case 3:
          return PieChartSectionData(
            value: categoriesList.percentOfAll(3),
            title: '${categoriesList.categoriesList[3].amountSum()}',
            color: Colors.blue,
            radius: 60,
          );
        default:
          return null;
      }
    });

  }
}
