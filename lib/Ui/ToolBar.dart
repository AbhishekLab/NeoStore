import 'package:flutter/material.dart';

Widget toolbar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 25, color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: Colors.red,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          print("Seaarch button pressed");
        },
      )
    ],
  );
}
