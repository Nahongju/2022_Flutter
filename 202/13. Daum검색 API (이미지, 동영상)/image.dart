import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import './mainpage.dart';

class ImageWeb extends StatefulWidget{
  List? imageResult;
  ImageWeb({Key? key, @required this.imageResult}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageWeb();
}

class _ImageWeb extends State<ImageWeb>{
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => MainPage()));
          },
        ),
        middle: Text('상일미디어고 이미지 검색 결과'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.rocket),
          onPressed: () {
            showCupertinoDialog(context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('URL 이동'),
                content: Text('상일미디어고등학교 홈페이지로 이동하시겠습니까?'),
                actions: [
                  CupertinoButton(
                    child: Text('확인'),
                    onPressed: () {
                      Uri _url = Uri.parse('https://sangilmedia.sen.hs.kr/');
                      launchUrl(_url);
                    },
                  ),

                  CupertinoButton(
                    child: Text('취소'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
          },
        ),
      ),
      child: ListView.builder(itemBuilder: (context, index){
        return Card(
          child: Column(
            children: <Widget> [
              Row(
                children: <Widget> [
                  Container(
                    child: Image.network(widget.imageResult![index]['image_url'],
                      width: 130, height: 130, fit: BoxFit.contain,),
                  ),

                  Column(
                    children: <Widget> [
                      Text('카테고리 : ${widget.imageResult![index]['collection']}'),
                      Text('출처 : ${widget.imageResult![index]['display_sitename']}'),
                      Text('작성시간 : ${widget.imageResult![index]['datetime']}'),
                    ], crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              )
            ],
          ),
        );
      }, itemCount: widget.imageResult!.length,)
    );
  }
}
