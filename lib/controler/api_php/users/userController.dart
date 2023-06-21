import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/decrypt.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/models/user.dart';
import 'package:wpmobile/models/user2.dart';
import 'package:wpmobile/screens/Home_Screen.dart';
import 'package:wpmobile/utilitaires/Parametres.dart';

class UserController with ChangeNotifier {

  static void register(String nom, String postnom, String prenom, String profil, String mail, String passw,String statut_compte, String statut_membre)async{
    final response= await http.post(Uri.parse("${Parametres.SCHEME}${Parametres.HOST}${Parametres.ENDPOINT_REGISTER}"),body:{
      "nom_membre":nom,
      "postnom_membre":postnom,
      "prenom_membre":prenom,
      "sexe":profil,
      "mail":mail,
      "pass":passw,
      "statut_compte" : statut_compte,
      "statut_membre" : statut_membre
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      print(data);
      print("ENREGISTREMENT REUSSI");


    } else {
      print("erreur agent non enregistré");
    }
  }

  static void registerLocal(User2 user)async {

  shareset("user", jsonEncode(user.toJson()));
  print(" The value save is "+shareget("user"));
  }
 static void recupLocal()async {
    var data = shareget("user");
   var user1 = User2.fromJson(json.decode(data));
    print("l'utilisateur recuperer est : ${user1.nom}");

 }

}