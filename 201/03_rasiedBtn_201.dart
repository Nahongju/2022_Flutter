import 'package:flutter/material.dart';

/* 일반적인 버튼(raisedButton) 구현
   - RaisedButton()은 버튼이 눌렸을 때 어떻게 할 것인지에 대한 구동 onPressed를 반드시 구현해야 한다.
   - 버튼이 눌릴 때마다, 버튼 내의 글씨와 버튼의 색상이 바뀌는 앱 구현
*/

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{
  String test = 'hello';
  Color changeColor = Colors.green;
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'RaisedBtn',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('$test'),
            onPressed: () {
              // setState() : 앱 화면을 변경시켜주는 메소드
              setState(() {
                // 버튼에 쓰여진 글씨가 hello일 경우
                if(test == 'hello'){
                  test = 'flutter';
                  changeColor = Colors.blue;
                }
                // 버튼에 쓰여진 글씨가 hello가 아닐 경우
                else{
                  test = 'hello';
                  changeColor = Colors.green;
                }
              });
            }
          )     // RaisedButton
        )      // Center
      )      // Scaffold
    );     // MaterialApp
  }
}
