import 'package:flutter/material.dart';

/* 어플리케이션에 폰트 추가하기
  1. font 파일 준비하기 (파일명은 반드시 영어여야 함)
  2. 프로젝트에 font 파일 생성
  3. 미리 준비한 폰트를 프로젝트 내의 font 파일 안으로 드래그해서 가져오기
  4. pubspec.yaml에 프로젝트 내부로 가지고 들어온 폰트 파일 추가
  5. main.dart에 추가된 폰트 사용
*/

void main(){
  runApp(fontApp());
}

class fontApp extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return FontWidgetApp();
  }
}

class FontWidgetApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _FontWidgetApp();
  }
}

class _FontWidgetApp extends State<FontWidgetApp>{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text('FontWidget')),
      body: Container(
        child: Center(
          // TextStyle() : 화면에 표시될 text와 관련한 스타일 (글꼴, 글씨 크기, 글씨 색상 등)
          // fontFamily : 폰트 글씨체 설정
          child: Text('Hello Flutter', 
                     style: TextStyle(fontFamily: 'nanum',
                     fontSize: 30, color: Colors.blue)      // Text
        )     // Center
      )     // Container
    );      // Scaffold
  }
}
