import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImageDownloadMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ImageDownloadMain();
}

class _ImageDownloadMain extends State<ImageDownloadMain>{
  // 내려받을 이미지의 주소를 입력받을 controller
  TextEditingController? _editingController;
  bool downloading = false;     // 파일이 다운로드 중인지 확인
  var progressString = "";      // 다운로드가 어느정도 진행되었는지 저장
  String file = "";           // 파일의 내부저장소 위치

  @override
  void initState(){
    super.initState();
    _editingController = new TextEditingController(
      text: 'https://images.pexels.com/photos/3334482/'
          'pexels-photo-3334482.jpeg?auto=compress'
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'url을 입력하세요'),
        ),
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
        ) : // downloading이 false일 경우
         FutureBuilder(
           builder: (context, snapshot) {
             switch(snapshot.connectionState){
               // FutureBuilder.future가 null 일 때
               case ConnectionState.none:
                 print('none');
                 return Text('데이터 없음');

               // 연결되기 전(FutureBuilder.future에서 데이터를 반환받지 않았을 때)
               case ConnectionState.waiting:
                 print('waiting');
                 return CircularProgressIndicator();

               // 하나 이상의 데이터를 반환받을 때
               case ConnectionState.active:
                 print('active');
                 return CircularProgressIndicator();

               // 모든 데이터를 받아서 연결이 끝날 때
               case ConnectionState.done:
                 print('done');
                 if(snapshot.hasData){
                   return snapshot.data as Widget;
                 }
             }
             print('end process');
             return Text('데이터 없음');
           }, future: downloadWidget(file),
         ),
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
      await dio.download(_editingController!.value.text, '${dir.path}/myimage.jpg',
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

  Future<Widget> downloadWidget(String filePath) async{
    File file = File(filePath);
    bool exist = await file.exists();

    if(exist) {
      return Center(
        child: Column(
          children: <Widget> [ Image.file(File(filePath)) ],
        ),
      );
    }
    else {
      return Text('No Data');
    }
  }
}
