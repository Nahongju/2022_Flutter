import 'package:flutter/material.dart';

/* 앱에 이미지 추가하기
  1. 앱에 추가할 이미지를 .png 파일 또는 .jpg로 준비
  2. 프로젝트 내에 image 폴더 생성
  3. 생성된 image 폴더에 준비한 이미지 넣기
  4. main.dart 코드와 pubspec.yaml 코드 수정
*/

void main(){
  runApp(ImageWidgetApp());
}

class ImageWidgetApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp>{
  @override
  Widget build(BuildContext){
    
