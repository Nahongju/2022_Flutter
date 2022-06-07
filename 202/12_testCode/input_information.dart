import 'package:flutter/material.dart';
import '../student.dart';

class Input_information extends StatefulWidget{
  List<Student>? inputStu = new List.empty(growable: true);
  Input_information({Key? key, @required this.inputStu}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _InputInformation();
  }
}

class _InputInformation extends State<Input_information>{
  TextEditingController school = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController Gclass = TextEditingController();
  TextEditingController number = TextEditingController();

  String? get_school = '';
  String? get_name = '';
  String? get_grade = '';
  String? get_class = '';
  String? get_number = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: <Widget> [
                    // 제목
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text('햏 인적사항 입력 헿',
                        style: TextStyle(fontSize: 45, fontFamily: 'tvNBold'),),
                    ),

                    // 학교 입력
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        child: Row(
                          children: <Widget> [
                            Text('학교 : ', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold'),),
                            new Flexible(child: TextField(keyboardType: TextInputType.text, maxLines: 1, controller: school,))
                          ],
                        ),
                      ),
                    ),

                    // 이름 입력
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        child: Row(
                          children: <Widget> [
                            Text('이름 : ', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold')),
                            new Flexible(child: TextField(keyboardType: TextInputType.text, maxLines: 1, controller: name,))
                          ],
                        ),
                      ),
                    ),

                    // 학년
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: TextField(keyboardType: TextInputType.number, maxLines: 1, controller: grade,),),

                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text('학년', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold')),
                            ),

                            new Expanded(child: TextField(keyboardType: TextInputType.number, maxLines: 1, controller: Gclass,),),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text('반', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold')),
                            ),

                            new Expanded(child: TextField(keyboardType: TextInputType.number, maxLines: 1, controller: number,),),
                            Text('번', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold'))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // 입력 확인 버튼
              Padding(
                padding: EdgeInsets.only(top: 35, bottom: 15),
                child: Container(
                  width: 350,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                        get_school = school.value.text;
                        get_name = name.value.text;
                        get_grade = grade.value.text;
                        get_class = Gclass.value.text;
                        get_number = number.value.text;

                        var studentIn = Student(school: get_school, name: get_name, grade: get_grade, Gclass: get_class, number: get_number);
                        widget.inputStu!.add(studentIn);
                    },
                    child: Text('저장', style: TextStyle(fontSize: 30, fontFamily: 'tvNBold'),),

                  ),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ),
    );
  }
}
