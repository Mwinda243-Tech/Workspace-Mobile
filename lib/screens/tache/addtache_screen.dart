import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/post/appbar.dart';
import 'package:wpmobile/screens/tache/profil_tache.dart';




class Addtache_Screen extends StatefulWidget {
  const Addtache_Screen({super.key});

  @override
  State<Addtache_Screen> createState() => _Addtache_ScreenState();
}

class _Addtache_ScreenState extends State<Addtache_Screen> {
String tache_text = "";
bool patience = false;

  @override
  Widget build(BuildContext context) {
    //Api_php.membre_list(context);

    List<List<String>> mb = [
        ["Albin bakumba","assets/icons/DSC_5205.JPG","index","","Ceo","add"],["Parfait Lumbaya","assets/IMG-20230320-WA0022.jpg","index","","An Security","add"],
        ["Moardochée Mbuyamba","assets/fonts/IMG-20230517-WA0034.jpg","index","","Data Analyst","add"],["Ben Kalombo","assets/IMG-20230320-WA0016.jpg","index","","DT","add"],
        ["Ken Swenge","assets/icons/DSC_5205.JPG","index","","sesigner","add"],["Heron akemiko","assets/IMG-20230320-WA0020.jpg","index","","Dev web","add"],
        ["Victorine kaleko","assets/IMG-20230320-WA0019.jpg","index","","Rel publique","add"],["Magloire Mirkobi","assets/IMG-20230320-WA0029.jpg","index","","Data scientist","add"],

      ];
    return Consumer<Compte_provider>(
      builder: (context, settings, child) {
        List<Widget> membrelist= [];
       /*  for (var i = 0; i < settings.membre_list.length; i++) {
          membrelist.add(
            Profil_tache(
              colorText: Colors.white, 
              nom: "${settings.membre_list[i][1]} ${settings.membre_list[i][2]} ${settings.membre_list[i][3]}", 
              profil: settings.membre_list[i][4], 
              index: settings.membre_list[i][0], 
              statut_tache: "", 
              statut_membre: settings.membre_list[i][0], 
              action: "add")
          );
        } */


        for (var i = 0; i < mb.length; i++) {
          membrelist.add(
            Profil_tache(
              colorText: Colors.white, 
              nom: mb[i][0], 
              profil:mb[i][1], 
              index: mb[i][2], 
              statut_tache: "", 
              statut_membre: mb[i][4], 
              action: "add")
          );
        }


      return Scaffold(
      backgroundColor: Style.backgroundColor,
      appBar: appBar(context, "Taches"),

      body: Container(
        child: Column(
          children: [

            //-----------------------------description tache et nom membre-------------
            Container(
              //color: Colors.green,
              height: 650,
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.end,
               
                children: [
                  //--------------------description de la tache
                  Container(
                    margin:const  EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    height: 210,
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
                                height: 170,
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
                                             tache_text = value.toString();
                                          });     
                                        },
                                  decoration: const InputDecoration(
                                  hintStyle :TextStyle(color: Colors.grey),
                                  hintText: "detail sur la Tache",
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
            
                  SizedBox(
                    width: 380,
                    height: 410,
                    //color: Colors.yellow,
                    child: ListView(
                      children: membrelist,
                    ),
                  ),
                ],
              ),
            ),


            
          ],
        ),
      ),


      //-----------------bt valider-----------
      bottomSheet: Container(
        height: 55,
        color: Style.backgroundColor,
        child: Center(
          child: InkWell(
            onTap: ()async{
              
              setState(() {
                patience = true;
              });
              
              await Api_php.tache(tache_text,context);
              for (var i = 0; i < settings.membre_list.length; i++){
                if (settings.membre_list[i][5]=="selectionner") {
                    Api_php.assigner_tache(settings.membre_list[i][0],settings.id_tache,"realiser");
                }
              }

              setState(() {
                patience = false;
              });
              Navigator.pop(context);
              
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 60,
              width: 250,
              child: Center(child: patience == false ? Text("VALIDER",style: TextStyle(color: Colors.white),) : SpinKitCircle(color: Colors.white, size: 20,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue
              ),
            ),
          ),
        ),
      ),
    );
  });}
}