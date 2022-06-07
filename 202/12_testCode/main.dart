import 'package:flutter/material.dart';
import './sub/input_information.dart';
import './sub/show_picture.dart';
import './student.dart';

void main() {
  runApp(Introduce());
}

class Introduce extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '수행평가_학번',
      home: mainPage(),
    );
  }
}

class mainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _mainPage();
  }
}

class _mainPage extends State<mainPage> with SingleTickerProviderStateMixin{
  String BarTitle = 'mainPage';
  TabController? tabController;
  List<Student> listStudent = new List.empty(growable: true);

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    listStudent.add(Student(school: 'school', name: 'name', grade: 'grade', Gclass: 'Gclass', number: 'number'));
  }

  @override
  Widget build(BuildContext){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('$BarTitle'),),
      body: TabBarView(
        children: <Widget> [Input_information(inputStu: listStudent,), ShowPicture(listShow: listStudent,)],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab> [
        Tab(icon: Icon(Icons.account_box, color: Colors.blue,),),
        Tab(icon: Icon(Icons.add_circle_outlined, color: Colors.blue),)
      ],
      controller: tabController,),
    );
  }

  void dispose(){
    tabController!.dispose();
    super.dispose();
  }
}
