import 'package:flutter/material.dart';

/* 앱 화면 중앙에 hell Flutter 문구를 출력하는 코드 */

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwqtch: Colors.blue,
       ),     // ThemeData
      home: Container(
        child: Center(
          child: Text('hello\nFlutter',
                     style: TextStyle(color: Colors.blue, fontSize: 20),
          )   //Text
        )   // Center
      ),    // Container
    );    // MaterialApp
  }
}
