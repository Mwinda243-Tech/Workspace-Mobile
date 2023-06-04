import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/api_php/presences/presence_lister.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/presence/addpresence.dart';
import 'package:wpmobile/screens/presence/presence_bt.dart';
import 'package:wpmobile/screens/presence/scan.dart';

import '../../controler/provider/compte_provider.dart';



class Presence_Screen extends StatefulWidget {
  const Presence_Screen({super.key});

  @override
  State<Presence_Screen> createState() => _Presence_ScreenState();
}

class _Presence_ScreenState extends State<Presence_Screen>{

  bool patience = false;
  void await_post()async{
      var response = await presence_list("hhhhhhh",context);   //-------------------appel de la liste de presence
  }

  @override
  Widget build(BuildContext context) {

    //-----------gestion de la longueur et largeur ----
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    await_post();
    
    return Consumer<Compte_provider>(
      builder: (context, settings, child){
        List<Widget> list_presence = [];
        for (var i = 0; i < settings.presence_list.length; i++) {
          list_presence.add(
            Presence_bt(
              width: _width, 
              height: _height, 
              nom: "${settings.presence_list[i][2]} ${settings.presence_list[i][0]}", 
              ha: settings.presence_list[i][4], 
              hd: settings.presence_list[i][5],
              profil: settings.presence_list[i][3],
              )
          );
        }
      
      return Scaffold(
      backgroundColor: Style.backgroundColor,
      //appBar: appBar(context, "Presence Home"),

      body: Column(
        children: [

          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()async{    
                  msgBox();
                }, 
                icon: patience == false ? const Icon(Icons.post_add_rounded,color: Colors.blue,size: 30) : 
                const SpinKitCircle(color: Colors.blue, size: 20)
                ),

                  SizedBox(width: 20,),  //------------espace

                IconButton(onPressed: ()async{    
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'scanner',)));
                }, 
                icon: patience == false ? const Icon(Icons.qr_code_scanner_rounded,color: Colors.blue,size: 30) : 
                const SpinKitCircle(color: Colors.blue, size: 20)
                )
              ],
            ),
          ),

          Container(
            width: double.infinity,
            child: Column(
              children: [

                Card(
                  margin: const EdgeInsets.only(top: 10),
                  elevation: 30,
                  color: Colors.transparent,
                  child: ListTile(
                    title: Container(
                    height: _height*0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: _width*0.15,
                          child: const  Center(child: Text("Profi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: AutofillHints.birthday),)),
                        ),
                        Container(
                          width: _width*0.45,
                          child: const  Center(child: Text("Prenom & Nom",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: AutofillHints.birthday),)),
                        ),
                        Container(
                          width:  _width*0.15,
                          child: const  Center(child: Text("H - AV",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: AutofillHints.birthday),)),
                        ),
                        Container(
                          width: _width*0.15,
                          child: const  Center(child: Text("H - DP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: AutofillHints.birthday),)),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),

                //Container(margin: const EdgeInsets.only(left: 17,right: 17,bottom: 10), width: double.infinity, color: Colors.blue, height: 1),

                Container(
                  height: 400,
                  width: 250,
                  child: /* Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: //list_presence 
                    [ */
                      const Center(child: Text("Aucune activité ou  séance n'est prevue aujourdhui. rendez-vous le 03/06/2023",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ))
                    /* ]
                  ), */
                )
              ],
            ),
          ),
        ],
      )
      );
    });
  }






    //-------------message box  --------

  Future<void> msgBox(){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Container(
            //margin: EdgeInsets.only(top: height*0.05),
            child: SimpleDialog(
              insetPadding: EdgeInsets.only(left: 0,right: 0),
              backgroundColor:const  Color.fromARGB(255, 7, 51, 87),
              
              title: Container(
                margin: EdgeInsets.only(left: width*0.2,right: width*0.2),
                padding: const EdgeInsets.only(bottom: 7),
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.5, color: Colors.blue)) ),
                child: const Center(child: Text("Member List",style: TextStyle(color: Colors.white)))),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
          
                  
            children:  [
          
          //----------------------la liste de menu------------
             SizedBox(
              width: width*0.8,
              height: height*0.6,
              child: const AddPresence()
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
}