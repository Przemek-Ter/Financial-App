import 'package:flutter/material.dart';


class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      //AppBar
      // appBar: AppBar(
      //   title: Text('Data Screen'),
      //   centerTitle: true,
      // ),
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            leading: Icon(Icons.menu_rounded),
            title: Text('Data Screen'),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Data Screen.'),
            ),
          ),

          //this can be used as month indicator in list
          SliverToBoxAdapter(
            child: Container(
              child: Text("Test Header"),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 170,
            delegate: SliverChildListDelegate([
              //can be replaced by list in another file
              Container(
                color: Colors.red,
                child: Text('Test Container'),
              ),
              Container(
                color: Colors.blue,
                child: Text('Test Container'),
              ),
              Container(
                color: Colors.green,
                child: Text('Test Container'),
              ),
              Container(
                color: Colors.yellow,
                child: Text('Test Container'),
              ),
              Container(
                color: Colors.orange,
                child: Text('Test Container'),
              ),
            ]),
          ),

        ],
      ),
    );
  }
}
