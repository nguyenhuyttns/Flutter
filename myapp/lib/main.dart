import 'package:flutter/material.dart';
import 'package:myapp/MyApp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Transaction app",
    theme: ThemeData(
      primaryColor: Colors.pink[200],
    ),
    home: const MyApp(),
  ));
}
