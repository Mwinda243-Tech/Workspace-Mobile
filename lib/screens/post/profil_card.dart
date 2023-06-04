import 'package:flutter/material.dart';



class Profil_Card extends StatefulWidget {
  final Color colorText;
  final String nom;
  final String profil;
  final String statut;
  final String date;
  const Profil_Card({super.key, required this.colorText, required this.nom, required this.profil, required this.statut, required this.date});
  

  @override
  State<Profil_Card> createState() => _Profil_CardState();
}

class _Profil_CardState extends State<Profil_Card> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    List a = widget.date.split(" ");
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
                            width: _width*0.45,
                            margin:const EdgeInsets.only(top: 15,left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text(widget.nom,style: TextStyle(color: widget.colorText,fontSize: _width*0.04)),
                                    Text("${widget.statut}...",style: TextStyle(color: widget.colorText,fontSize: _width*0.037))
                              ],
                            ),
                          ),


                          //-------------heure------------
                          Container(
                            width: _width*0.3,
                            child: Column(
                              children:[
                                     Text(a[1],style: TextStyle(color: Colors.blue,fontSize: _width*0.037)),
                                     Text(a[0],style: TextStyle(color: Colors.blue,fontSize: _width*0.037))
                              ],
                            ),
                          )


                        ],
                      );
  }
}