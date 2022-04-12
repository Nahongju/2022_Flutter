import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePageState());
}

class MyHomePageState extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageState>
  with SingleTickerProviderStateMixin{
  TabController? controller;
  
  @override
  void initState(){
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context){
    return null;
  }
}
