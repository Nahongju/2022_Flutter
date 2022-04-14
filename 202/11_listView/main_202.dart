import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import './animalItem.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePageState(),
  ));
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
  List<Animal> animalList = new List.empty(growable: true);

  @override
  void initState(){
    super.initState();
    // TabController(length: 탭바 이동 페이지 수, vsync: 어디에서 페이지 호출을 할 것인가)
    // this 키워드 : 해당 클래스 내에서 이루어진다는 의미라고 생각하면 됨
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: "벌", kind: "곤충",
          imagePath: "repo/iamge/bee.png"));
    animalList.add(Animal(animalName: "고양이", kind: "포유류",
        imagePath: "repo/iamge/cat.png"));
    animalList.add(Animal(animalName: "소", kind: "포유류",
        imagePath: "repo/iamge/cow.png"));
    animalList.add(Animal(animalName: "개", kind: "포유류",
        imagePath: "repo/iamge/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류",
        imagePath: "repo/iamge/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "영장류",
        imagePath: "repo/iamge/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류",
        imagePath: "repo/iamge/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류",
        imagePath: "repo/iamge/wolf.png"));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('tab Bar'),),
      body: TabBarView(
        children: <Widget> [FirstApp(list: animalList,), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab> [
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue,),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.tealAccent,),)
      ], controller: controller,),
    );
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
}
