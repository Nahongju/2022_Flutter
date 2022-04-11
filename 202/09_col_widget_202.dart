import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  WidgetApp({Key? key}) : super(key: key);

  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp>{
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMemu = new List.empty(growable: true);
  String? _buttonText;

  @override
  void initState() {
    super.initState();
    for(var item in _buttonList){
      _dropDownMemu.add(DropdownMenuItem(
        value: item, child: Text(item),));
    }
    
    /* 위의 반복문을 C언어로 유사하게 만들 경우
    for(var item = 0; item = _buttonList.length; item++){
      _dropDownMenu[item] = _buttonList[item];
    }
    */
    _buttonText = _buttonList[0];
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('결과 : $sum',
                style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
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
                  color: Colors.tealAccent,
                  onPressed: () {
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  },),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMemu,
                  onChanged: (value) {
                    setState(() {
                      _buttonText = value as String?;
                    });
                  },
                  value: _buttonText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
