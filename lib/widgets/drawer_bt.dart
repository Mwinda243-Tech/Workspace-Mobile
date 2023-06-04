import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Drawer2 extends StatefulWidget {
  const Drawer2();

  @override
  State<Drawer2> createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {

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
              case "Deconnexion":{
                Navigator.pop(context);
                Navigator.pop(context);
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
        width: _width/1.5,
        height: _height,
      child: Column(
        children: [

          //--------------------logo ecole---------------
          Container(
            margin: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                           image: const DecorationImage(
                            image: AssetImage("assets/DSC_5205.JPG"),
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
                          child: Text("MAZAMBI KILELU Boniface",style: GoogleFonts.titilliumWeb(
                            color: Colors.black,
                            fontSize: 16
                          ),),
                        ),
                      ),



        Column(
          children: [

            drawer_bt("Documentation",Icons.description_outlined),
            drawer_bt("Apropos",Icons.assignment_rounded),
            drawer_bt("Retours",Icons.arrow_back)
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