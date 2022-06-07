import 'package:flutter/material.dart';
import '../student.dart';

class ShowPicture extends StatefulWidget{
  List<Student>? listShow = new List.empty(growable: true);
  ShowPicture({Key? key, @required this.listShow}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _ShowPicture();
  }
}

class _ShowPicture extends State<ShowPicture>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text('입력된 인적 사항 목록', style: TextStyle(fontSize: 45, fontFamily: 'tvNBold'),),
            ),

            new Flexible(child: ListView.builder(itemBuilder: (context, position){
              return Card(
                child: Row(
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset('image/sangilmedia.png', width: 100, fit: BoxFit.fitWidth,),
                    ),

                    Column(
                      children: <Widget> [
                        Text(widget.listShow![position].school!, style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                        Text(widget.listShow![position].name!, style: TextStyle(fontSize: 15, fontFamily: 'nanum')),

                        Row(
                          children: <Widget> [
                            Text(widget.listShow![position].grade!, style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                            Text('학년 ', style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                            Text(widget.listShow![position].Gclass!, style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                            Text('반 ', style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                            Text(widget.listShow![position].number!, style: TextStyle(fontSize: 15, fontFamily: 'nanum')),
                            Text('번', style: TextStyle(fontSize: 15, fontFamily: 'nanum'))
                          ],
                        )
                      ], crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ],
                ),
              );
            }, itemCount: widget.listShow!.length,))
          ],
        )
      ),
    );
  }
}
