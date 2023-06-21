import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/api_php/users/authentification.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/Home_Screen.dart';
import 'package:wpmobile/screens/authentification/authScreem.dart';
import 'package:wpmobile/screens/compte/addCompte.dart';
import 'package:wpmobile/screens/post/AddPost_Screen.dart';
import 'package:wpmobile/screens/presence/presence_Screen.dart';
import 'package:wpmobile/screens/profil/profile_page.dart';
import 'package:wpmobile/screens/tache/addtache_screen.dart';

import '../test.dart';


AppBar appBar(context,String lieu) { 
  
  return AppBar(
      backgroundColor: Style.backgroundColor,
      elevation: 10,
      leading: LeadingAction(lieu: lieu),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(lieu,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Style.appWhite,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5)),

          const SizedBox(width: 5),

          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 3,
          )

        ],
      ),

      actions: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
          },
          child: CircleAvatar(
            backgroundColor: Style.backgroundColor2,
            child: SvgPicture.asset(
              "assets/user.svg",
              color: Style.appWhite,
            ),
          ),
        ),

        const SizedBox(width: 15)
      ],
    );
}





class LeadingAction extends StatefulWidget {
  final String lieu;
  const LeadingAction({super.key, required this.lieu});

  @override
  State<LeadingAction> createState() => _LeadingActionState();
}

class _LeadingActionState extends State<LeadingAction> {
  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.only(left:14),
        child: (widget.lieu =="presence" || widget.lieu == "Presence Home" || widget.lieu == "Taches" || widget.lieu == "Your Post" || widget.lieu == "Scanner") ?
        IconButton(icon: const Icon( Icons.arrow_back,color: Colors.white), 
        onPressed: (){
          Navigator.pop(context);
        })
        
        : IconButton(onPressed: (){
            msgBox(1);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost_Screen()));
        }, icon: const Icon(Icons.menu_open_sharp,size: 32))
      );
  }



  _showDialog(BuildContext context,String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:  Colors.blue.withOpacity(0.5),
        content: Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Icon(msg==""? Icons.close : Icons.verified,color: msg==""? Colors.red : Colors.blue),
        const SizedBox(width: 25),
        Text(msg=="" ? "s'il vous plait.., votre creation du compte n'a pas aboutit..." : msg),
      ],
    ))));
  }




  //-------------message box  --------

  Future<void> msgBox(int  msgboxtype){
    return showDialog(
      context: context,
      barrierDismissible: true,
      
      builder: (BuildContext context){
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Container(
            margin: EdgeInsets.only(top: msgboxtype == 1 ? height*0.4 : 0),
            child: SimpleDialog(
              insetPadding: const EdgeInsets.only(left: 0,right: 0),
              backgroundColor:const  Color.fromARGB(255, 7, 51, 87),
              
              title: Container(
                margin: EdgeInsets.only(left: width*0.2,right: width*0.2),
                padding: const EdgeInsets.only(bottom: 7),
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.5, color: Colors.blue)) ),
                child: Center(child: Text(msgboxtype == 1 ? "Menu" : "New compte",style: TextStyle(color: Colors.white)))),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
          
                  
            children:  [
          
          //----------------------la liste de menu------------
             SizedBox(
              width: width*0.8,
              child: msgboxtype == 1 ?  Column(
                children: [
                  //bt_menu("présence du jour",width),
                  bt_menu("Générer le QR code",width),
                  bt_menu("Créer un post",width),
                  bt_menu("Créer un nouveau Compte",width),
                  bt_menu("Créer une tache",width),
                  bt_menu("Déconnexion",width),
                ],
              ): Container(
                height: height*0.54,
                child: AddCompte(),
              ),
             ),
          
          
              Center(
                child: Container(color: Colors.blue,width: 100,height: 2)
                
                //btShowDialogue("Valider",msgboxtype)
                )
            ]
            ),
          );
        }
      );
    }





    //-------------bt msg box
    Widget btShowDialogue(String title, int msgboxtype){
    return Consumer<Compte_provider>(
      builder: (context, settings, child) {
      return InkWell(
                child: Container(
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:const Color.fromARGB(255, 37, 37, 211),
                    ),
                          
                  margin: const EdgeInsets.only(top: 20),
                  width: 120,
                  height: 45,
                  child:  Center(
                      child: Text(title, style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                          )),
                        ),
                      ),

                      onTap: (){
                          switch (msgboxtype) {
                            case 0:{
                                 Navigator.pop(context);
                                 _showDialog(context,"Congratulation, le compte a été crée avec succes");
                              break;
                            }


                            case 1:{
                                 Navigator.pop(context);
                                 _showDialog(context,"Congratulation, le poste a été publié avec succes");
                              break;
                            }
                          }},
                    );
                }
              );
          }  


Widget bt_menu(String titre ,double width){
  return InkWell(
    onTap: ()async{
      print(titre);
      switch (titre) {
        case "Créer une tache":{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addtache_Screen()));
          break;
        }
        case "Créer un post":{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost_Screen()));
          break;
        }

        case "Créer un nouveau Compte":{
          msgBox(2);
          break;
        }
        case "présence du jour":{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Presence_Screen()));
          break;
        }
        case "Déconnexion": {
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Test()));
          context.read<Authentifier>().finSession();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Auth_Screem()));
          /* //-------------selectionner un seul fichier-----
          FilePickerResult? a = await FilePicker.platform.pickFiles();
          PlatformFile b = a!.files.first;
          print(b.name);
          File _file = File(a.files.single.path!);
          print(_file.path.toString()); */



         /*  //-------------selectionner un seul fichier-----
          FilePickerResult? a = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.video,
            //allowedExtensions: ["MP3","PDF"]
            );

          List<File> files = a!.paths.map((path) => File(path!)).toList();
          
          print(files.toString());
          //audioToBase64(files[0]);

          print(shareget("foto"));
          base64ToAudio(shareget("foto"),"bbbbb"); */

          


          break;
        }
          
        default:
      }
    },
    child: Container(
      height: 40,
      width: width*0.7,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(titre, style: const TextStyle(color: Colors.white),)),
    ),
  );
}






Future<String> audioToBase64(File audioFile) async {
  List<int> bytes = await audioFile.readAsBytes();
  String base64String = base64Encode(bytes);
  print(base64String);
  shareset("foto", base64String );
  return base64String;
}




Future<File> base64ToAudio(String base64String, String fileName) async {
  List<int> bytes = base64Decode(base64String);
  File file = File(fileName);
  await file.writeAsBytes(bytes);
  print("voici ${file.path}");
  return file;
}

}