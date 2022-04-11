import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title = 'Cal Widget';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  @override
  _WidgetExample createState() => _WidgetExample();
}

class _WidgetExample extends State<WidgetApp>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Cal Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              Padding(
                child: Text('사칙연산'),
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: TextField(),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
              Padding(
                child: TextField(),
                padding: EdgeInsets.only(left:20, right:20),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
