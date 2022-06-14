import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImageDownloadMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ImageDownloadMain();
}

class _ImageDownloadMain extends State<ImageDownloadMain>{
  // 내려받을 이미지의 web 주소
  final url = 'https://images.pexels.com/photos/240040/'
      'pexels-photo-240040.jpeg?auto=compress';
  bool downloading = false;     // 파일이 다운로드 중인지 확인
  var progressString = "";      // 다운로드가 어느정도 진행되었는지 저장
  String file = "";           // 파일의 내부저장소 위치

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('image download'),
      ),
      body: Center(
        child: downloading?
        // downloading이 true일 경우
        Container(
          height: 120.0, width: 200.0,
          child: Card(
            color: Colors.black,
            child: Column(
              children: <Widget> [
                CircularProgressIndicator(),
                Text('Downloading File : $progressString',
                  style: TextStyle(color: Colors.white),)
              ], mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ) 
        : // downloading이 false일 경우
        Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { downloadFile(); },
        child: Icon(Icons.file_download),
      ),
    );
  }
  
  Future<void> downloadFile() async {
    Dio dio = Dio();
    
    try{
      // 내부 저장소 불러오기
      var dir = await getApplicationDocumentsDirectory();
      
      // 파일 다운로드 받기
      await dio.download(url, '${dir.path}/myimage.jpg',
      onReceiveProgress: (rec, total){
        print('Rec : $rec, Total : $total');
        file = '${dir.path}/myimage.jpg';

        // 진행 상황을 %로 표시
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + '%';
        });
      });
    } catch(e) {
      print(e);
    }

    // 다운로드가 완료되었을 경우
    setState(() {
      downloading = false;
      progressString = 'Completed';
    });
    print('Download Completed');
  }
}
