import 'package:flutter/material.dart';
import '../animalItem.dart';

class FirstApp extends StatelessWidget{
  final List<Animal>? list;
  FirstApp({Key? key, this.list}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView.builder(itemBuilder: (context, position){
                  return Card();
                })
            )     // Center
        )     // Container
    );      // Scaffold
  }
}
