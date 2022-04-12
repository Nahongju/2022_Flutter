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
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropItems = new List.empty(growable: true);
  
  @override
  

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
                child: Text('결과 : $sum', style: TextStyle(fontSize: 20),),
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
              Padding(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
                padding: EdgeInsets.only(left:20, right:20),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  child: Row(
                    children: <Widget> [
                      Icon(Icons.add),
                      Text('더하기')
                    ],
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
