import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePageState());
}

class MyHomePageState extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyHomePageState();
  }
}

// with 키워드 : 상속을 받지 않아도 프로퍼티와 메소드를 받아와서 쓸 수 있게하는 키워드
// SingleTickerProviderStateMixin 클래스 : TabBar에서 페이지 이동 시, 애니메이션이 가능하게 도와주는 클래스 (해당 클래스가 없으면 탭바의 페이지 이동이 불가능)
class _MyHomePageState extends State<MyHomePageState>
  with SingleTickerProviderStateMixin{
  TabController? controller;
  
  @override
  void initState(){
    super.initState();
    // TabController(length: 탭바 이동 페이지 수, vsync: 어디에서 페이지 호출을 할 것인가)
    // this 키워드 : 해당 클래스 내에서 이루어진다는 의미라고 생각하면 됨
    controller = TabController(length: 2, vsync: this);
  }
  
  @override
  Widget build(BuildContext context){
    return null;
  }
}
