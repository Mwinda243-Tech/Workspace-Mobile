import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/api_php/users/userController.dart';
import 'package:wpmobile/models/user.dart';
import 'package:wpmobile/models/user2.dart';
import 'package:wpmobile/screens/Home_Screen.dart';
import 'package:wpmobile/utilitaires/Parametres.dart';




class Authentifier with ChangeNotifier{
    User2? userConnect;
connexion(String mail,String passw) async{

      final response= await http.post(Uri.parse("${Parametres.SCHEME}${Parametres.HOST}${Parametres.ENDPOINT_CONNEXION}"),body:{
          "mail":mail,
          "pass":passw,
      });

   // print(response.body);
    if (response.statusCode==200) {
    print("Connexion reussie------------------------------------");
      var data =jsonDecode(response.body);
      print(data);
      User2 user = User2();
    user.id = data["id_membre"];
    user.nom = data["nom_membre"];
    user.prenom = data["prenom_membre"];
    user.postNom = data["postnom_membre"];
    user.email = data["mail"];
    print("-------------------------");
     UserController.registerLocal(user);
      return data;

    } else {
      print("Connexion echouee-------------------------------------");
      var data=null;
      return data;
    }
  }

  session(){
    var data = shareget("user");
    var temp = User2.fromJson(json.decode(data));

    if (temp!=null){
      userConnect = temp;
      print("Session ouvert avec succes");
    }
  }
  finSession(){
    shareclear("user");
    userConnect = null;
    print("Fin de session");
  }
}