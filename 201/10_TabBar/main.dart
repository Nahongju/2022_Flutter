import 'package:flutter/material.dart';
import './sub/firstPage.dart';
import './sub/secondPage.dart';
import './animalItem.dart';

void main(){
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage>
with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dipose(){
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('TabBar Ex'),),
      body: TabBarView(
        children: <Widget> [FirstApp(), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab> [
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue,),)
    ], controller: controller),
    );
  }
}
