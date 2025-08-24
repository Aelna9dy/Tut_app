import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //Private Named Constructor
  int appState = 0;
  static final instance = MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance;


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}