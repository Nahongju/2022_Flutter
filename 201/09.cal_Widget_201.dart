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
  String? _buttonText;

  @override
  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropItems.add(DropdownMenuItem(value: item, child: Text(item),));
    }
    _buttonText = _dropItems[0].value;
  }

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
                      Text('$_buttonText')
                    ],
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      var result;
                      var value1Int = double.parse(value1.value.text);
                      var value2Int = double.parse(value2.value.text);

                      switch(_buttonText){
                        case '더하기':
                          result = value1Int + value2Int;
                          break;

                        case '빼기':
                          result = value1Int - value2Int;
                          break;

                        case '곱하기':
                          result = value1Int * value2Int;
                          break;

                        case '나누기':
                          result = value1Int / value2Int;
                          break;
                      }
                      sum = '$result';
                    });
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: DropdownButton(items: _dropItems,
                    onChanged: (value) {
                      setState(() {
                        _buttonText = value as String?;
                      });
                    },value: _buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
