import 'package:cupertino_api/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Web extends StatefulWidget{
  List? vclipResult;
  String? vclipKeyword;
  Web({Key? key, @required this.vclipResult,
  @required this.vclipKeyword}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Web();
}

class _Web extends State<Web>{
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context)
              => MainPage())
            );
          },
        ),
        middle: Text('" ${widget.vclipKeyword} " 검색 결과'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.square_arrow_right),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      child: Container(
        child: Center(
          child: Column(
            children: <Widget> [
              Expanded(
                child: ListView.builder(itemBuilder: (context, index){
                  return Card(
                    child: Row(
                      children: <Widget> [
                        Image.network(widget.vclipResult![index]['thumbnail'],
                        width: 100, height: 100, fit: BoxFit.contain,),

                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            children: <Widget> [
                              Text(widget.vclipResult![index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('재생 시간 : ${widget.vclipResult![index]['play_time']} 초'),
                              Text('업로더 : ${widget.vclipResult![index]['author']}')
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
