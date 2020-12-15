import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Inserting amount
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),

              child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    amount = double.parse(value);
                    print('amount is $amount');
                  });
                },
                //Options
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Amount'
                ),
              ),
            ),

            SizedBox(height: 10,),

            //Pick tax value
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),

              child: DropdownButton(
                  value: taxValue,
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
                      taxValue = value;
                      print('tax value is $taxValue');
                    });
                  }),
            ),

            SizedBox(height: 10,),

            //Choosing category
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),

              child: categoryScroller,
            ),

            SizedBox(height: 10,),

            //Choosing Date and Time
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),

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
                    selectedTime = val;
                    print(selectedTime);
                  });
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                //dodawanie do bazy
              },
            )
          ],
        ),
      );
    });
  }

}
