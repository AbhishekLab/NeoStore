import 'package:flutter/material.dart';
import 'package:neostore/Ui/ItemDescriptionPage.dart';
import 'package:neostore/Ui/LoginPage.dart';
import 'package:neostore/Ui/FurniturePage.dart';
import 'Ui/Dashboard.dart';
import 'Ui/MyCart.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue
  ),
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => LoginPage(),
    '/Dashboard': (context) => Dashboard(),
    '/FurniturePage' : (context) => FurniturePage(),
    '/ItemDescriptionPage' : (context) => ItemDescriptionPage(),
    '/MyCart' : (context) => MyCart()
  },
));

