import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/screens/post/modelFichier/ficher1.dart';
import 'package:wpmobile/screens/post/modelFichier/fichier2.dart';
import 'package:wpmobile/screens/post/modelFichier/fichier3.dart';
import 'package:wpmobile/screens/post/modelFichier/fichier4.dart';
import 'package:wpmobile/screens/post/post_details.dart';
import 'package:wpmobile/screens/post/profil_card.dart';


class Post_bt extends StatefulWidget {
  final String id_poste;
  final String description;
  final String dateTime;

  final String id_posteur;
  final String nom_posteur;
  final String profil;          //------profil du posteur------------------

  final List reactionList;      //--------------list des reactions---------------
  final List lecteurList;       //--------------liste de lecteurs--------------
  final String statut_user;
  final String date;
  final List<String> image;

  const Post_bt({super.key,
  required this.id_poste,
  required this.description,
  required this.dateTime,
  required this.id_posteur,
  required this.nom_posteur,
  required this.profil,
  required this.reactionList,
  required this.lecteurList,
  required this.statut_user, 
  required this.date, 
  required this.image,
  
  });


  @override
  State<Post_bt> createState() => _Post_btState();
}

class _Post_btState extends State<Post_bt> {

  bool reaction =false;
  String textReaction = "";
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    List<Widget> file = [Fichier1(lienFil: widget.image[0]),Fichier2(lienFil: widget.image),Fichier3(lienFil: widget.image,),Fichier4(lienFil: widget.image,)];
    return GestureDetector(
                onTap: () => Navigator.push(context,CupertinoPageRoute(builder: (ctx) => DetailPost(
                    image: widget.image,
                    id_poste: widget.id_poste,
                    description: widget.description,
                    dateTime:  widget.dateTime,
                    id_posteur: widget.id_posteur,
                    nom_posteur: widget.nom_posteur,
                    profil: widget.profil,
                    lecteurList: widget.lecteurList,
                    reactionList: widget.reactionList,

                ))),
                child: Container(
                  width: 450,
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color:const Color(0xff2F323C).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      
                      Profil_Card(colorText:  Colors.white, nom: widget.nom_posteur, profil: widget.profil,statut: widget.statut_user,date: widget.date),   //------------profil


                      Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 10),
                        color: Colors.blue,
                        width: 380,
                        height: 1.8,
                      ),


                      //-------------------------contenue principale--------------
                      Container(
                        //color: Colors.yellow,
                        padding: widget.image.length < 1 ? const EdgeInsets.symmetric(horizontal: 10) : EdgeInsets.only(top: 10,bottom: 10,left: 7,right: 7),
                        height: widget.image.length < 1 ? 150 : null,
                        child: Center(child: Text(widget.description,style: TextStyle(color: Colors.white,fontSize: _width*0.035),textAlign: TextAlign.justify)),
                      ),



                      //-------------------------------fil--
                      Container(
                        height: widget.image.length < 1 ? null :  250,
                        width: widget.image.length < 1 ? null :350,

                        child: file[widget.image.length > 4 ? 3 : widget.image.length-1],
                      ),


                      //--------------------------------barre de separation---------------
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        color: Colors.blue,
                        width: 380,
                        height: 1.9,
                      ),


                      //-------------------------reaction------------------
                      Container(
                        margin: const EdgeInsets.only(bottom: 15,top: 15),
                        height: reaction == false ? 25 : (textReaction.length == 0 ? (_height*0.07) : (textReaction.length <=30 ? (_height*0.07) : (((_height*0.08)*(textReaction.length/30).floor())/((textReaction.length/30).floor() == 1 ? 1 : 2)))),

                        child:  reaction == false ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text("${widget.lecteurList.length}: Lecture ",style: TextStyle(color: Colors.white,fontSize: _width*0.030)),
                            //const SizedBox(width: 30),
                            Text("${widget.reactionList.length}: Réaction",style: TextStyle(color: Colors.white,fontSize: _width*0.030)),
                            //const SizedBox(width: 30),
                            IconButton(onPressed: (){
                              setState(() {
                                reaction = true;
                              });
                            }, 
                            icon: Icon(Icons.add_comment_rounded, size: _width*0.06,color: Colors.blue,))
                          ],
                        ) 
                        :  Container(
                          width: _width*0.95,
                          child: Consumer<Compte_provider>(
                            builder: (context, settings, child) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              //-------------------textfield---
                              Container(
                                //height: (_height*0.08)+2,
                                width: _width*0.75,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)
                                ),


                                child: TextField(
                                  style: const TextStyle(color: Colors.white70),
                                  maxLines: 500,
                                  textAlignVertical: TextAlignVertical.bottom,
                                        onChanged: (value) {
                                          setState(() {
                                             textReaction = value.toString();
                                          });  
                                        },
                                  decoration: const InputDecoration(
                                  hintText: "Votre réaction",
                                  hintMaxLines: 1,
                                  border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20),
                                                    ),
                                        borderSide: BorderSide(color:Colors.transparent),
                                                ))),
                              ),
                        
                        
                        
                              //----------------botton envoi
                        
                              IconButton(onPressed: (){
                                List<String> info_user = shareget("users").toString().split("-");
                                Api_php.reaction(info_user[0], widget.id_poste,textReaction);
                                _showDialog(context, "Succes post");
                                setState(() {
                                  reaction = false;
                                });
                              }, 
                              icon: const Icon(Icons.send,size: 35,color: Colors.blue,))
                            ],
                          );}),
                        ),
                      ),

                    ],
                  ),
                ),
              );
  }








   _showDialog(BuildContext context,String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor:  Colors.blue.withOpacity(0.5),
        content: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Icon(msg==""? Icons.close : Icons.verified,color: msg==""? Colors.red : Colors.white),
        const SizedBox(width: 25),
        Text(msg=="" ? "s'il vous plait.., votre creation du compte n'a pas aboutit..." : msg),
      ],
    ))));
  }
}