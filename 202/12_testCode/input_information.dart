import 'package:flutter/material.dart';
import '../student.dart';

class Input_information extends StatefulWidget{
  List<Student>? inputStu = new List.empty(growable: true);
  Input_information({Key? key, @required this.inputStu}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _InputInformation();
}

class _InputInformation extends State<Input_information> {
  
