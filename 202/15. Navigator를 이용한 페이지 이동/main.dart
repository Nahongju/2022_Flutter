import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FirstPage(),
    );
  }
}

// 첫번째 페이지와 관련된 FirstPage()
class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page Main'),
      ),
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 두번째 페이지로 이동하는 코드(메모리 stack에 두번째 페이지 클래스 적재)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// 두 번째 페이지와 관련된 SecondPage()
class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            // 메모리 stack에서 두 번째 페이지를 빼는 코드
            onPressed: () { Navigator.of(context).pop(); },
            child: Text('돌아가기'),
          ),
        ),
      ),
    );
  }
}
