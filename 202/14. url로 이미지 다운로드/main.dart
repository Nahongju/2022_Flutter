import 'package:flutter/material.dart';
import 'package:image_download_201/imagedownload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'image download',
      home: ImageDownloadMain(),
    );
  }
}
