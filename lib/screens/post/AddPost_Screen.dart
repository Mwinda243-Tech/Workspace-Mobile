import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/post/appbar.dart';



class AddPost_Screen extends StatefulWidget {
  const AddPost_Screen({super.key});

  @override
  State<AddPost_Screen> createState() => _AddPost_ScreenState();
}

class _AddPost_ScreenState extends State<AddPost_Screen> {
  String f_join = "oui";
  String textReaction = "";
   List<File> files = [];


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      appBar: appBar(context, "Your Post"),

      body: Container(
        child: Column(
          children: [

            //-----------------------------description tache et nom membre-------------
            Container(
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.end,
               
                children: [
                  //--------------------description de la tache
                  Container(
                    //color: Colors.red,
                    margin:const  EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    height: 300,
                    width: double.infinity,

                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //--------------------titre-----------------
                        Container(
                          margin: const EdgeInsets.only(top: 5,bottom: 10),
                          child: const Text("Description",style: TextStyle(color: Colors.blue)),
                        ),


                        //------------------textField------------
                        Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(20)
                                ),


                                child: TextField(
                                  style: const TextStyle(color: Colors.grey),
                                  textAlign: TextAlign.justify,
                                  maxLines: 500,
                                  textAlignVertical: TextAlignVertical.bottom,
                                        onChanged: (value) {
                                          setState(() {
                                            textReaction = value.toString();
                                          });     
                                        },
                                  decoration: const InputDecoration(
                                  hintStyle :TextStyle(color: Colors.grey),
                                  hintText: "Votre réaction",
                                  //hintMaxLines: 1,
                                  border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30),
                                                    ),
                                        borderSide: BorderSide(color:Colors.transparent),
                                                ))),
                              ),
                      ],
                    ),
                    
                  ),

                  //---------------barre de separation----------
                  Container(width: 100,height: 2,color: Colors.blue),
            
                  Container(
                    width: 380,
                    margin: const EdgeInsets.only(top: 20,left: 20),
                    //color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        bt_joindre(Icons.add_a_photo, "Joindre une photo"),
                        //bt_joindre(Icons.file_present_sharp, "Joindre un document"),
                        //bt_joindre(Icons.audio_file_rounded, "Joindre un audio"),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: _height*0.067,
        child: Center(
          child: InkWell(
                onTap: ()async{


                  List<String> info_user = shareget("users").toString().split("-");
                  print(info_user[0]);
                  //await Api_php.post(textReaction,info_user[0], f_join);
                 // print(info_user);
                  if(f_join=="oui"){
                    /* for (var i = 0; i < count; i++) {
                      //Api_php
                    } */
                  }
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  height: 40,
                  width: 300,
                  child: const Center(child: Text("PUBLIER",style: TextStyle(color: Colors.white,fontSize: 17))),
                ),
              ),
        ),
      ),
    );
  }


  Widget bt_joindre(IconData icon, String title){
    String base64String="";
    return InkWell(
      onTap: ()async{
        
        FilePickerResult? a = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.image,
            //allowedExtensions: ["MP3","PDF"]
            );

         setState(() {
           files = a!.paths.map((path) => File(path!)).toList();
         });
        List<int> bytes = await files[0].readAsBytes();
            
            setState(() {
              f_join="oui";
              base64String = base64.encode(bytes);
              //shareset("foto", base64String);
            });

            print(base64String);
                    //shareset("foto", base64String );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10,bottom: 7),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon,size: 30, color: Colors.blue), 
            const SizedBox(width: 20),
            Text(title,style: const TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}