import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app2/object_classes/category.dart';
import 'package:project_app2/object_classes/invoice.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

//====================================================
// //Categories list object
// CategoriesList categoriesList = new CategoriesList();
// bool wasAdded = false;
// //simulation method
// void simulation() {
//   //Invoice List
//   List<Invoice> invoiceList = [
//     new Invoice(100, 23, '10-10-2020', 0),
//     new Invoice(500, 7, '10-10-2020', 1),
//     new Invoice(1000, 0, '10-10-2020', 3),
//     new Invoice(34, 23, '10-10-2020', 0),
//     new Invoice(2375, 7, '10-10-2020', 2),
//     new Invoice(75.43, 23, '10-10-2020', 2),
//     new Invoice(300, 23, '10-10-2020', 1),
//     new Invoice(200, 8, '10-10-2020', 0),
//     new Invoice(100, 23, '10-10-2020', 0),
//     new Invoice(500, 7, '10-10-2020', 1),
//     new Invoice(1000, 0, '10-10-2020', 3),
//     new Invoice(34, 23, '10-10-2020', 0),
//     new Invoice(2375, 7, '10-10-2020', 2),
//     new Invoice(75.43, 23, '10-10-2020', 2),
//     new Invoice(300, 23, '10-10-2020', 1),
//     new Invoice(200, 8, '10-10-2020', 0),
//     new Invoice(534.76, 23, '21-09-2015', 1),
//   ];
//
//   if (wasAdded != true) {
//     for (int i = 0; i < invoiceList.length; i++) {
//       categoriesList.categoriesList[invoiceList[i].categoryNumber].addInvoice(invoiceList[i]);
//     }
//   }
//   wasAdded = true;
//   print('${categoriesList.categoriesList[2].invoiceList}');
// }
//====================================================


//Category List (fromDatabase)
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
];

class _DataScreenState extends State<DataScreen> {


  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //App Bar
          SliverAppBar(
            leading: Icon(Icons.menu_rounded),
            title: Text('Data Screen'),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Data Screen.'),
            ),
          ),

          //List of transactions
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Logo
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: invoiceList[index].photo == null? AssetImage('assets/no_image.png') : invoiceList[index].photo,
                        ),
                      ),

                      //Category and Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${categoryList[invoiceList[index].categoryNumber].name}',
                            style: TextStyle(fontSize: 18,),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            '${invoiceList[index].date}',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Spacer(),
                      //Amount and Tax
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${invoiceList[index].amountValue} zł',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            '${invoiceList[index].taxValue}%',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
              );
            },
            childCount: invoiceList.length,
            ),
          ),
        ],
      ),
    );
  }
}
