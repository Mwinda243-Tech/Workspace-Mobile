import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class Drawer_vue extends StatefulWidget {
  const Drawer_vue({super.key});

  @override
  State<Drawer_vue> createState() => _Drawer_vueState();
}

class _Drawer_vueState extends State<Drawer_vue> {
  //-----------------bt_cours
  Widget drawer_bt(String titre, IconData icon){
    return InkWell(
      child: Container(
        height: 40,
        width: 200,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    //----------------------icon-------------
                  Container(
                    margin: const EdgeInsets.only(left: 20,right: 7),
                      child: Icon(icon, size: 18,color: Colors.blue,)
                  ),
                  
                  Center(child: Text(titre)),
                  ],
                ),
              ),
          
          onTap: (){
            switch (titre) {
              case "Suivi de paiement":{
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Paiement_screen()));
                break;
              }

              case "Horaire":{
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> Horaire_interro_generale()));
                break;
              }
                
              default:
            }
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu_sceen()));
          },
    );
  }


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
        //width: _width/1.5,
        height: 700,
        //_height/1.5,
      child: Column(
        children: [

          //--------------------logo ecole---------------
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                           image: const DecorationImage(
                            image: AssetImage("assets/icons/3.PNG"),
                            fit: BoxFit.cover
                            )
                        ),
                        width: 100,
                        height: 100,
          ),


          //------------------Nom ecole--------
          Center(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 6),
                          margin: const EdgeInsets.only(bottom: 20,top: 10),
                          decoration: BoxDecoration(
                            border: Border( bottom:  BorderSide( width: 2, color: Color.fromRGBO(0, 121, 225, 1).withOpacity(0.2)))
                          ),
                          child: Text("Mwinda work-Space",style: GoogleFonts.titilliumWeb(
                            color: Colors.black,
                            fontSize: 16
                          ),),
                        ),
                      ),



        Column(
          children: [

            drawer_bt("Apropos",Icons.architecture_sharp),
            drawer_bt("Documentation",Icons.assignment_rounded),
            drawer_bt("Parametre",Icons.settings),
          ],
        ),


        Container(
          margin: const EdgeInsets.only(top: 100),
          child: drawer_bt("Deconnexion",Icons.toggle_off_outlined),
        )
        ],
      ),
    );
  }
}