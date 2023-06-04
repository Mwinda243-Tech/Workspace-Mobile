import 'package:flutter/material.dart';




class Fichier2 extends StatefulWidget {
  List<String> lienFil;
  Fichier2({super.key,
  required this.lienFil
  });

  @override
  State<Fichier2> createState() => _Fichier2State();
}

class _Fichier2State extends State<Fichier2> {
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



          Container(
             width: 170,
             margin: const EdgeInsets.only(left: 10),
            decoration:BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
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
    );
  }
}