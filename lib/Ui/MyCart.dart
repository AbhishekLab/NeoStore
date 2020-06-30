import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'ToolBar.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCart createState() => _MyCart();
}

class _MyCart extends State<MyCart> {

  List<DropdownMenuItem> quantity = List();
  String valueSelect = "1";
  
  /*@override
  void initState() {
    super.initState();
    for( var i = 1 ; i <= 50; i++ ) {
      quantity.add(DropdownMenuItem(value: i.toString(),child: Text(quantity[i].toString()),));
    }
    
  }*/
 
  
  @override
  Widget build(BuildContext context) {

   
    
    return Scaffold(
      appBar: toolbar("My Cart"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: 23,
                itemBuilder: (BuildContext context, int index) {
                  return _myCartList(index);
                }),
          ),
        ],
      ),
    );
  }

  Widget _myCartList(int index) {
    return SafeArea(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _listOfOrders(index),
            ],
          ),
        ),
        secondaryActions: <Widget>[
          InkWell(
            onTap: () {
              print("Delete");
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget _listOfOrders(int index) {
    
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[400],
              margin: EdgeInsets.all(5),
              child: Image(
                image: AssetImage("images/chillam.png"),
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 8),
                    child: Text("Table",
                        style: TextStyle(fontSize: 25),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4, left: 12),
                    child: Text("sub Table",
                        style: TextStyle(fontSize: 13),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ),

                 /* Container(
                    child: DropdownButton<String>(
                      items: quantity,
                      onChanged: (String newValueSelected){
                        valueSelect = newValueSelected;
                        setState(() {

                        });
                      },
                      value: valueSelect,
                    ),
                  )*/
                ],
              ),
            ),
          ],
        ),
        //Divider()
      ],
    );
  }

  Widget _listOfOrderss() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigoAccent,
        child: Text('3'),
        foregroundColor: Colors.white,
      ),
      title: Text('Tile n°43'),
      subtitle: Text('SlidableDrawerDelegate'),
    );
  }
}
