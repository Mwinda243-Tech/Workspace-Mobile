import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wpmobile/screens/tache/profil_tache.dart';



class Tache_bt extends StatefulWidget {
  final String description;
  final String date;
  final List membres;
  final String statut;
  final int pourcentage;
  const Tache_bt({super.key, required this.description, required this.date, required this.membres, required this.statut, required this.pourcentage});

  @override
  State<Tache_bt> createState() => _Tache_btState();
}

class _Tache_btState extends State<Tache_bt> {
  bool voir = false;
 

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;


     List<Widget> membres_List = []; 
    for (var i = 0; i < widget.membres.length; i++) {
        membres_List.add(
          Profil_tache(colorText: Colors.white, nom: widget.membres[i][0], profil: widget.membres[i][1], index: "fffff", statut_tache: widget.statut, statut_membre: widget.membres[i][2], action: "dd")
        );
    }



    
    return Container(
     //color: Colors.red,
      margin: const EdgeInsets.only(top: 10,left: 7,right: 7),
      width: _width*0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //-----------------validation bt-----------
          Container(
            margin: EdgeInsets.only(top: _width*0.02 ),
            height: _width*0.15,
            width: _width*0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1.7, color: widget.pourcentage < 50 ? Colors.red : Colors.blue)
            ),
            
            
            child: Center(child: Text("${widget.pourcentage}%",style: TextStyle(color: widget.pourcentage < 50 ? Colors.red : Colors.blue),))
            ),
  

          //---------------description-----------
          Container(
            //height: 200,
            width: _width*0.8,
            //color: Colors.green,
            child: Column(
              children: [

                //------------------------description
                Container(
                  width: _width*0.8,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_width*0.035,),
                    border: Border.all(width: 1.7,color: Colors.blue)
                  ),
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1.5,color: Colors.blue))
                        ),
                        child: Text(widget.description,style: const TextStyle(
                          color: Colors.white
                        )),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            if (voir == true) {
                              voir=false;
                              print(voir);
                            } else {
                              voir = true;
                              print(voir);
                            }
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          padding: const EdgeInsets.only(left: 20),
                          color: Colors.grey.withOpacity(0.4),
                          child: Row(
                            children: [
                              Text("Membres aché à la tache",style: GoogleFonts.titilliumWeb(color: Colors.white),),
                              Icon( voir == false ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_outlined ,color: Colors.blue,)
                            ],
                          ),
                        ),
                      ),

                      Container(
                        child: voir == true? Column(
                          children: membres_List
                          /* [
                        
                        Profil_tache(colorText: Colors.white, nom: "albin bakumba", profil: "",index: "",statut_membre: "",statut_tache: "r",action: ""),
                        Profil_tache(colorText: Colors.white, nom: "albin bakumba", profil: "",index: "",statut_membre: "",statut_tache: "",action: "")
                          ], */
                        ) : null
                      )
                    ],
                  ),
                ),

                Container(
                  height: 50,
                   width: 390,
                   padding: const EdgeInsets.only(left: 15,right: 15),

                   child: Row(
                    children: [
                      //--------------date
                      Container(
                        height: 35,
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Center(
                          child: Text(widget.date,style: const TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                   ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}