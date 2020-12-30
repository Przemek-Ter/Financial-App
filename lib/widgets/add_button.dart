import 'dart:io';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:project_app2/object_classes/category.dart';
import 'package:project_app2/object_classes/invoice.dart';
import 'package:image_picker/image_picker.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

//Category List (from Database)
List<Category> categoryList = [
  new Category(0, 'No Category'),
  new Category(1, 'Food'),
  new Category(2, 'Car'),
  new Category(3, 'Materials'),
];

//Invoice
Category tmpCategory = new Category(1, 'Category 1');
Invoice invoice = new Invoice(0, 0, 'No Date', 0);


class _AddButtonState extends State<AddButton> {


  //Image Picker
  final picker = ImagePicker();
  File tmpImage;
  void openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        tmpImage =File(pickedFile.path);
      }else {
        print('No Image Selected!');
      }
    });
  }
  void openCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        tmpImage =File(pickedFile.path);
      }else {
        print('No Image Selected!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        addDataMenu(context);
      },
    );
  }


  void addDataMenu(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      final Size size = MediaQuery.of(context).size;
      return Container(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            //Amount field
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Amount'
                ),
                onSubmitted: (value) {
                  setState(() {
                    invoice.amountValue = double.parse(value);
                    print('amount is ${invoice.amountValue}');
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            //Tax and Category fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Tax Field
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[300],
                  child: DropdownButton(
                      value: invoice.taxValue,
                      items: [
                        DropdownMenuItem(
                          child: Text("23 %"),
                          value: 23,
                        ),
                        DropdownMenuItem(
                          child: Text("8 %"),
                          value: 8,
                        ),
                        DropdownMenuItem(
                            child: Text("0 %"),
                            value: 0
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          invoice.taxValue = value;
                          print('tax value is ${invoice.taxValue}');
                        });
                      }),
                ),

                SizedBox(width: 10),

                //Category field
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[300],
                  child: DropdownButton(
                    value: invoice.categoryNumber,
                    items: [
                      DropdownMenuItem(
                        child: Text('Category'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('Category 1'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Category 2'),
                        value: 2,
                      ),
                    ],
                    onChanged: (tmpNumber) {
                      invoice.categoryNumber = tmpNumber;
                      print(
                          'Category #$tmpNumber and named ${categoryList[tmpNumber].name} was pressed');
                    }
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            //Date Time field
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2040),
                dateLabelText: 'Date',
                timeLabelText: 'Time',
                onChanged: (val) {
                  setState(() {
                    invoice.date = val;
                    print('date is ${invoice.date}');
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            //Add Photo
            Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Text('Add photo from:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          child: Text('Gallery'),
                          color: Colors.grey[400],
                          onPressed: () {
                            openGallery();
                          },
                        ),
                        SizedBox(width: 30,),
                        FlatButton(
                          child: Text('Camera'),
                          color: Colors.grey[400],
                          onPressed: () {
                            openCamera();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
            ),

            SizedBox(height: 10),

            //Submit button
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: FlatButton(
                child: Text('SUBMIT'),
                color: Colors.blue,
                onPressed: () {
                  //Print in Terminal
                  print(invoice.toString());
                  //Exit popup menu
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      );
    });
  }

}
