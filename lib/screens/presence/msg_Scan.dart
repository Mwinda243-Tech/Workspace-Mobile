import 'package:flutter/material.dart';



class Msg_Scann extends StatefulWidget {
  const Msg_Scann({super.key});

  @override
  State<Msg_Scann> createState() => _Msg_ScannState();
}

class _Msg_ScannState extends State<Msg_Scann> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 80),
          
          //---------------------------------------------Contenu-------------------------------------
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              //-------------------------Profil---------
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:  BorderRadius.circular(10),
                  image: const DecorationImage(image: AssetImage("assets/icons/DSC_5205.JPG"))
                ),
              ),
          
          
          
              //----------------------text---------------------
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: const [
                     Text("Veuillez confirmer votre scanne: ",style: TextStyle(color: Colors.white),),
                     Text("11/01/2023 / HA: 10h35",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}