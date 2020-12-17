import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:project_app2/object_Classes/invoice.dart';



class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {

  //Category field
    int categoryNumber = 0;

  //Invoice
  Invoice invoice = new Invoice(1, 23, 0, 'No Category', 'No Date');

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
              color: Colors.orange,
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
                  color: Colors.orange,
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
                  color: Colors.orange,
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
                    onChanged: (tmpNumber){
                      setState(() {
                        invoice.categoryNumber = tmpNumber;
                        switch (tmpNumber){
                          case 0:
                            invoice.categoryName = 'No Category';
                            break;
                          case 1:
                            invoice.categoryName = 'Category 1';
                            break;
                          case 2:
                            invoice.categoryName = 'Category 2';
                            break;
                        }
                        print('Category #${invoice.categoryNumber} named - ${invoice.categoryName} was pressed');
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            //Date Time field
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.orange,
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

            //Submit button
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.orange,
              child: FlatButton(
                child: Text('SUBMIT'),
                color: Colors.blue,
                onPressed: () {
                  print(invoice.toString());
                  Navigator.of(context).pop();
                  //Sending data to database
                },
              ),
            )
          ],
        ),
      );
    });
  }

}
