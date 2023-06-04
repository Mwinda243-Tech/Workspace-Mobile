import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';





class Profil_tache extends StatefulWidget {
  final Color colorText;
  final String nom;
  final String profil;
  final String index;
  final String statut_tache;
  final String statut_membre;
  final String action;
  const Profil_tache({super.key, required this.colorText, required this.nom, required this.profil, required this.index, required this.statut_tache, required this.statut_membre, required this.action});

  @override
  State<Profil_tache> createState() => _Profil_tacheState();
}

class _Profil_tacheState extends State<Profil_tache> {
  bool chek = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          //---------------------------------profil-------------
                            Container(
                              height: _height*0.065,
                              width: _width*0.12,
                              margin:const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                color:const Color(0xff282B35),
                                image: DecorationImage(image: AssetImage(widget.profil))
                              ),
                            ),


                          //----------------------nom------------------
                          Container(
                            width: _width*0.5,
                            margin:const EdgeInsets.only(top: 15,left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text(widget.nom,style: TextStyle(color: widget.colorText,fontSize: _width*0.04)),
                                    Text(widget.statut_membre,style: TextStyle(color: Colors.blue,fontSize: _width*0.03))
                              ],
                            ),
                          ),


                          //-------------heure------------
                          Container(
                            child: widget.action == "presence" ? const Icon(Icons.arrow_forward_ios_sharp, color:  Colors.blue ) :
                            
                            widget.action == "add" ? Checkbox(
                              side: const BorderSide(color: Colors.blue,width: 1.5),
                              value: chek, 
                              onChanged: (value){
                                  setState(() {
                                    chek = value!;
                                  });
                              
                                  var settings = context.read<Compte_provider>();
                                    settings.updat_agenttache_list(widget.index,chek); 
                                
                              }
                              ): Icon(Icons.check_circle, color: widget.statut_tache=="r" ? Colors.blue : Colors.red)
                          )
                        ],
                      );
  }
}