import 'package:flutter/material.dart';

/* Switch 버튼 구현 */
void main(){
  runApp(MyApp());
}

// StatefulWidget : 동적인 화면 구현 -> return 값으로 private(사적인) 클래스를 가진다.
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}

// _MyApp 클래스 : MyApp 클래스의 기능적인 부분이 기술되어 있는 private 클래스, State(상태)로 MyApp 클래스를 상속받는다.
class _MyApp extends State<MyApp>{
  bool switchValue = false;
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // title: 앱의 이름
      title: 'Flutter Switch',
      
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),   // ThemeData
      
      // home: 앱 실행시 화면에 그려질 도화지
      // Scaffold() : 뼈대, appBar, body, floatActionButton 등을 구현할 수 있다.
      home: Scaffold(
        body: Center(
          // Switch() : Switch 버튼 생성, 필수로 onChanged에 대해서 기술을 해주어야 한다.
          child: Switch(
            value: switchValue,
            // inputValue : 사용자가 버튼을 누름으로써 앱에 전달되는 매개변수, 이에 따라 switch의 false, true값(switchValue)가 변경된다.
            onChanged: (inputValue) {
              switchValue = inputValue;
            }
          )   // Switch
        )    // Center
      )    // Scaffold
    );     // MaterialApp
  }
}
