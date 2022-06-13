import 'package:cupertino_api/image.dart';
import 'package:cupertino_api/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
  TextEditingController? search;
  List? vclipData;
  List? imageData;

  @override
  void initState() {
    super.initState();
    search = new TextEditingController();
    vclipData = new List.empty(growable: true);
    imageData = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Search Keyword'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Row(
                children: <Widget> [
                  Expanded(child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CupertinoTextField(
                        placeholder: "검색어를 입력하세요",
                        controller: search,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  )),

                  Container(
                    width: MediaQuery.of(context).size.width - 300,
                    padding: EdgeInsets.only(right: 5),
                    child: CupertinoButton(
                      child: Text('검색'),
                      //color: Colors.blue,
                      onPressed: () { getWebData(); },
                    ),
                  )
                ], mainAxisAlignment: MainAxisAlignment.center,
              ),

              CupertinoButton(
                child: Text('상일미디어고 이미지 검색 결과'),
                onPressed: () { getImageData(); },
              )
            ],
          )
        ),
      ),
    );
  }

  Future<String> getWebData() async {
    var url = "https://dapi.kakao.com/v2/search/vclip?size=30&&query=${search!.value.text}";
    var response = await http.get(Uri.parse(url),
    headers: {"Authorization" : "KakaoAK REST API Key"});

    setState(() {
      var dataConvert = json.decode(response.body);
      List result = dataConvert['documents'];
      vclipData!.addAll(result);
      Navigator.of(context).push(CupertinoPageRoute(builder: (context)
      => Web(vclipResult: vclipData, vclipKeyword: search!.value.text,)));
    });

    return response.body;
  }

  Future<String> getImageData() async {
    var url = "https://dapi.kakao.com/v2/search/image?query=상일미디어";
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization" : "KakaoAK REST API Key"});

    setState(() {
      var dataconvert = json.decode(response.body);
      List result = dataconvert['documents'];
      imageData!.addAll(result);
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => ImageWeb(imageResult: imageData)));
    });

    return response.body;
  }
}
