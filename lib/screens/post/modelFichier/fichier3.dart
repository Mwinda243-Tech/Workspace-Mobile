import 'package:flutter/material.dart';




class Fichier3 extends StatefulWidget {
  List<String> lienFil;
  Fichier3({super.key,
  required this.lienFil
  });

  @override
  State<Fichier3> createState() => _Fichier3State();
}

class _Fichier3State extends State<Fichier3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Row(
        children: [

          Container(
            width: 170,
            decoration:BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(widget.lienFil[0]),
                fit: BoxFit.cover
                )
            ),
          ),



          Column(
            children: [

              Container(
                 width: 170,
                 height: 125,
                 margin: const EdgeInsets.only(left: 5),
                decoration:BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    //bottomRight: Radius.circular(20)
                  ),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(widget.lienFil[1]),
                    fit: BoxFit.cover
                    )
                ),
              ),


              Container(
                 width: 170,
                 height: 120,
                 margin: const EdgeInsets.only(left: 5,top: 5),
                decoration:BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    //topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(widget.lienFil[1]),
                    fit: BoxFit.cover
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}