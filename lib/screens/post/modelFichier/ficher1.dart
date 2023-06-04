import 'package:flutter/material.dart';



class Fichier1 extends StatefulWidget {
  final String lienFil;
  const Fichier1({super.key, 
  required this.lienFil,
  });

  @override
  State<Fichier1> createState() => _Fichier1State();
}

class _Fichier1State extends State<Fichier1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(widget.lienFil),
          fit: BoxFit.cover
          )
      ),
    );
  }
}