import 'package:flutter/material.dart';

/* Scaffold : 비계, 뼈대, 공사장의 철근
   Scaffold 구성요소
   - appBar : 현재 위치를 알 수 있는 제목 줄
   - body : 도화지
   - FloatingActionButton : 하단에 떠 있는 듯한 버튼
   
   Scaffold 구성요소 중 appBar를 이용한 화면
*/

void main(){
  runApp(MyApp());
}

// StatelessWidget : 정적인 화면을 구현한 클래스
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // 화면 build를 위해 26줄에 구현되어진 MaterialFlutterApp 클래스를 반환함
    return MaterialFlutterApp();
  }
}

// StatefulWidget : 동적인 화면을 구현할 클래스
class MaterialFlutterApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // AppBar() : 현재 위치를 알 수 있는 제목 줄 ( title, 또는 버튼이나 아이콘 이미지도 넣을 수 있음)
      appBar: AppBar(title: Text('Material Design App')),
      
      // FloatingActionButton() : 좌측 하단부에 만들어지는 공중에 떠 있는 듯한 버튼
      // Icon() : 아이콘 넣기
      floatActionButton: FloatingActionButton(child: Icon(Icons.add),
                                              onPressed: () {})     // FloatingActionButton
    );    // Scaffold
  }
}
