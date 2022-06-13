import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoApp(
        title: 'Web Search',
        home: MainPage(),
      )
    );
  }
}
