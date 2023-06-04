import 'package:flutter/material.dart';




class Presence_bt extends StatefulWidget {
  final double width;
  final double  height;
  final String nom;
  final String profil;
  final String ha;   //--------------------heure d'arriver
  final String hd;   //---------------heure de depart---
  const Presence_bt({super.key, required this.width, required this.height, required this.nom, required this.ha, required this.hd, required this.profil
  });

  @override
  State<Presence_bt> createState() => _Presence_btState();
}

class _Presence_btState extends State<Presence_bt> {
  @override
  Widget build(BuildContext context) {
    return Card(
                  margin: const EdgeInsets.only(top: 5),
                  elevation: 30,
                  color: Colors.transparent,
                  child: ListTile(
                    title: Container(
                    height:widget.height*0.065,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(5)
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          margin: const EdgeInsets.only(left: 12.5,right: 12),
                          height: widget.height*0.055,
                          width: widget.width*0.1,
                          color: Colors.red,
                          //child:  ,
                        ),

                        Container(
                          width: widget.width*0.45,
                          child: Center(child: Text(widget.nom,style: const TextStyle(color: Colors.white),)),
                        ),

                        SizedBox(
                          width: widget.width*0.15,
                          child:  Center(child: Text(widget.ha,style: const TextStyle(color: Colors.white),)),
                        ),

                        Container(
                          width: widget.width*0.15,
                          child: Center(child: Text(widget.hd,style: const TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                  ),
                  ),
                );
  }
}