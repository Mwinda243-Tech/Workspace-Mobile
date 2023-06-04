import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:video_player/video_player.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/widgets/custom_video_player.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  String base64String = "";
  //File? files;
  VideoPlayerController? controller;
   
  @override
  Widget build(BuildContext context) {
    
    print(shareget("foto"));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("hello"),),
      body: Container(
        child: Column(
          children: [

            Center(
              child: Container(
                height: 40,
                width: 150,
                color: Colors.blue,
                child: ListTile(
                  title: Text("photo"),
                  onTap: () async {
                    FilePickerResult? a = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      //type: FileType.custom,
                      //allowedExtensions: ["MP3","PDF"]
                    );

                    List<File> files = a!.paths.map((path) => File(path!)).toList();

                    List<int> bytes = await files[0].readAsBytes();
                    setState(() {
                      base64String = base64.encode(bytes);
                      //shareset("foto", base64String);
                    });

                    controller = VideoPlayerController.file(files[0])..initialize().then((_){setState(() {
                      
                    });});
                    //dispose();

                    //print(base64String);
                    //shareset("foto", base64String );
                  
                  },
                ),
              ),
            ),





             Container(
              margin: const EdgeInsets.only(top: 30),
              height: 300,
              width: 300,
              child : controller == null ? null: VideoPlayer(controller!),
             /*  decoration: BoxDecoration(
                color: Colors.black,
                //image: DecorationImage(image: MemoryImage(base64Decode(shareget("foto"))))
              ), */
            ) 

          ],
        ),
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    controller!.dispose();
  }
}