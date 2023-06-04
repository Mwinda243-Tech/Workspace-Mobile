import 'package:flutter/material.dart';

Container textaffichier() {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
//---------------------text de mot de passe oublier--------------------------
        Text(
          'mot de passe oublie?',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Color.fromRGBO(3, 3, 91, 1)),
          // textAlign: TextAlign.center,
        ),

        SizedBox(
          height: 10,
        ),

//--------------------------text de la deuxieme ligne----------------------------
        Text(
          "Entrez l'adresse E-mail assoiciee a ce compte.",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),

        SizedBox(
          height: 10,
        ),

// ------------------------text de la troisieme ligne----------------------------
        Text(
          "Le mot de passe de verrification vous sera envoye via cette adresse.",
          style: TextStyle(
            color: Colors.white38,
            // fontSize: 20,
          ),
          // textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
