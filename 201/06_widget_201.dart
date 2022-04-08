import 'package:flutter/material.dart';

/* Scaffold 내의 body 안에 다양한 위젯 추가하기
  여러개의 위젯 사용 방법 : column과 row를 사용해 위젯 정렬 방식 설정
  - column : 위젯을 세로로 정렬
  - row : 위젯을 가로로 정렬
*/

void main(){
  runApp(MyApp());
}

class MyApp extends statelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialWidget();
  }
}

class MaterialWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MaterialWidget();
  }
}

class _MaterialWidget extends State<MaterialWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Material Design')),
      floatintActionButton: FloatingActionButton(child: Icon(Icons.add)),
      body: Container(
        child: Center(
          
          // Column() : 여러가지 위젯을 세로로 정렬해 배치할 수 있도록 해줌.
          child: Column(
            children: <Widget> [
              Icon(Icons.android),
              Text('android'),
              
              // mainAxisAlignment : Column에서의 메인 축(세로축)을 정렬해주는 코드
            ], mainAxisAlignment: MainAxisAlignment.center,
          )     // Column
        )     // Center
      )     // Container
    );      // Scaffold
  }
}
