import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app2/object_classes/category.dart';
import 'package:project_app2/object_classes/invoice.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
//Database simulation:
//Category List
List<Category> categoryList = [
  new Category(0, 'No Category'),
  new Category(1, 'Food'),
  new Category(2, 'Car'),
  new Category(3, 'Materials'),
];
//Invoice List
List<Invoice> invoiceList = [
  new Invoice(1, 100, 23, '10-10-2020', 0),
  new Invoice(2, 500, 7, '10-10-2020', 1),
  new Invoice(3, 1000, 0, '10-10-2020', 3),
  new Invoice(4, 34, 23, '10-10-2020', 0),
  new Invoice(5, 2375, 7, '10-10-2020', 2),
  new Invoice(6, 75.43, 23, '10-10-2020', 2),
  new Invoice(7, 300, 23, '10-10-2020', 1),
  new Invoice(8, 200, 8, '10-10-2020', 0),
  new Invoice(9, 100, 23, '10-10-2020', 0),
  new Invoice(10, 500, 7, '10-10-2020', 1),
  new Invoice(11, 1000, 0, '10-10-2020', 3),
  new Invoice(12, 34, 23, '10-10-2020', 0),
  new Invoice(13, 2375, 7, '10-10-2020', 2),
  new Invoice(14, 75.43, 23, '10-10-2020', 2),
  new Invoice(15, 300, 23, '10-10-2020', 1),
  new Invoice(16, 200, 8, '10-10-2020', 0),
];

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            //PieChart
            Container(
              color: Colors.white,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 3,
                  centerSpaceRadius: 40,
                  sections: showSections(categoryList),
                )
              ),
            ),

            //PieChart legend
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
                      Text('Category 0 - ${amountSum(categoryList[0])}'),
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
                      Text('Category 1 - ${amountSum(categoryList[1])}'),
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
                      Text('Category 2 - ${amountSum(categoryList[2])}'),
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
                      Text('Category 3 - ${amountSum(categoryList[3])}'),
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

  //PieChart
  List<PieChartSectionData> showSections(List<Category> categoryList) {
    return List.generate(4, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            value: percentOfAll(0),
            title: '${amountSum(categoryList[0])}',
            color: Colors.red,
            radius: 60,
          );
        case 1:
          return PieChartSectionData(
            value: percentOfAll(1),
            title: '${amountSum(categoryList[1])}',
            color: Colors.green,
            radius: 60,
          );
        case 2:
          return PieChartSectionData(
            value: percentOfAll(2),
            title: '${amountSum(categoryList[2])}',
            color: Colors.amber,
            radius: 60,
          );
        case 3:
          return PieChartSectionData(
            value: percentOfAll(3),
            title: '${amountSum(categoryList[3])}',
            color: Colors.blue,
            radius: 60,
          );
        default:
          return null;
      }
    });
  }

  double amountSum(Category category) {
    double sum;
    if (category.invoiceNumber != null) {
      for (int i = 0; i < category.invoiceNumber.length; i++) {
        sum += invoiceList[category.invoiceNumber[i]].amountValue;
      }
      return double.parse(sum.toStringAsPrecision(2));
    }else {
      return 0;
    }
  }

  double percentOfAll(int categoryNumber) {
    double categorySum = amountSum(categoryList[categoryNumber]);
    double allSum;
    for (int i = 0; i < categoryList.length; i++) {
      allSum += amountSum(categoryList[i]);
    }
    return double.parse(((categorySum / allSum) * 100).toStringAsPrecision(2));
  }

}
