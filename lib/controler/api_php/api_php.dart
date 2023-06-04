
import 'package:easy_permission/easy_permission.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/decrypt.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/screens/Home_Screen.dart';

class Api_php {
  


//---enregistrement---
  static void register(String nom, String postnom, String prenom, String profil, String mail, String passw,String statut_compte, String statut_membre)async{
      final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/register.php"),body:{
          "nom":nom,
          "postnom":postnom,
          "prenom":prenom,
          "profil":profil,
          "mail":mail,
          "pass":passw,
          "statut_compte" : statut_compte,
          "statut_membre" : statut_membre
      });
     if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      print(data);
      

    } else {
      //print("erreur");
    }
  }



  static tache(String detait_tache, BuildContext context) async{
    DateTime a = DateTime.now();
    final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/tache.php"),body:{
          "detail_taches":detait_tache,
          "Date_tache":a.toString().split(".")[0],
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);

      var settings =  context.read<Compte_provider>();
          settings.updat_id_tache(data["data"][2]["id_tache"]);
      
    } else {
      //print("erreur");
    }

  }



  static assigner_tache( String id_membre, String id_tache, String statut_tache) async{
    final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/assigner_tache.php"),body:{
          "id_membre":id_membre,
          "id_tache":id_tache,
          "statut_tache":statut_tache,
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      print(data);
      
    } else {
      //print("erreur");
    }
  }
  
  
  static reaction(String id_membre,	String id_poste,String detail_reaction	)async{
    DateTime a = DateTime.now();
    final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/reaction.php"),body:{
          "id_membre":id_membre,
          "id_poste":id_poste,
          "detail_reaction":detail_reaction,
          "Date_heure_raction" : "${a.day}:${a.month}:${a.year} ${a.hour}:${a.minute}"
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      print(data);
      
    } else {
      //print("erreur");
    }
  }
  
  


  static chat(String id_membre, String id_recepteur, String id_annee, String detail_chat, String Fichier_joint,  String type_fichierchat, String Date_heure_chat)async{
    final response= await http.post(Uri.parse("http://wspacephp/php/chat.php"),body:{
          "id_membre":id_membre,
          "id_recepteur":id_recepteur,
          "id_annee":id_annee,
          "detail_chat":detail_chat,
          "Fichier_joint" : Fichier_joint,
          "type_fichierchat": type_fichierchat,
          "Date_heure_chat": Date_heure_chat
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      //print(data);
      
    } else {
      //print("erreur");
    }
  }




  static vu_chat(String id_membre, String id_chat)async{
    final response= await http.post(Uri.parse("http://wspacephp/php/vu_chat.php"),body:{
          "id_membre":id_membre,
          "id_chat":id_chat,
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      //print(data);
      
    } else {
      //print("erreur");
    }
  }




   static vu_post(String id_membre, String id_poste, String Date_presence)async{
    final response= await http.post(Uri.parse("http://wspacephp/php/vu_post.php"),body:{
          "id_membre":id_membre,
          "id_poste":id_poste,
          "Date_presence":Date_presence,
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      //print(data);
      
    } else {
     // print("erreur");
    }
  }




static post_list(BuildContext context)async{
  List<List> a;
  List resultf = [];

  //-----------------------recuperation de posts----------------
  final response= await http.get(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/post_list.php"));
      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      //print(data);
      
    if (int.parse(data[0].toString()) == 1) {
      List b = data[1];
        a = decryptMultiline(
          b,[ "id_poste","details_poste",
              "Date_heure_poste","id_membre",
              "nom_membre","postnom_membre",
              "prenom_membre","profil"]);

          for (var i = 0; i < a.length; i++) {
            List<List<String>> lecteur = [];
            List<List<String>> reactions = [];
            List resul = [];

              //------------------recuperation des lecteurs---------------------
              final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/vu_post_list.php"),body:{
                  "id_poste": a[i][0]
                  });

              if (response.statusCode==200) {
                  var beta = jsonDecode(response.body);
                  List b = beta[1];
                  lecteur = decryptMultiline(
                  b,[ "Date_heure_vupost","nom_membre",
                    "postnom_membre","prenom_membre" ,"profil"]);
              }

              //------------recuperation dses reaction par rapport au post
              final response2= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/reaction_list.php"),body:{
                  "id_poste": a[i][0]
                  });
              if (response2.statusCode==200) {
                  var beta = jsonDecode(response2.body);
                  //print(beta);
                  List b = beta;
                  reactions = decryptMultiline(
                  b,["nom_membre", "postnom_membre","prenom_membre","profil",
                  "detail_reaction","Date_heure_raction"]);
              }

              resul.add(a[i]);
              resul.add(lecteur);
              resul.add(reactions);
            resultf.add(resul);  
          }
         var settings = context.read<Compte_provider>();
            settings.updat_post_list(resultf);
      } else {
          //a = data[1];
      }
    }
}



  static tache_lister (BuildContext context,String action) async {
      await PermissionType.INTERNET;
      List resultfinal = [];
      var data;
      final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/tache_list.php"),body: {"action":action});


      if (response.statusCode==200) {
        if (action == "taches") {
          data = jsonDecode(response.body);
          List b = data;
          List c =[];
          List a = decryptMultiline(
                b,[ "id_tache","detail_tache",
                    "Date_heure_tache"]);

        for (var i = 0; i < a.length; i++) {
            List result = [];
            final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/agent_tache_list.php"),body:{
                  "id_tache": a[i][0]
                  });

            if (response.statusCode==200) {
                  data = jsonDecode(response.body);
                  List b = data;
                    c = decryptMultiline(
                  b,[ "nom_membre","postnom_membre",
                    "prenom_membre","profil","statut_tache","id_membre"]);         
              }
            result.add(a[i]);
            result.add(c);
            resultfinal.add(result);
        }

          var settings = context.read<Compte_provider>();
            settings.updat_taches_list(resultfinal);
        } else {
          List result = [];
          List c = [];
          var data;
          final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/tache_list.php"),body: {"action":action});

            if (response.statusCode==200) {
                  data = jsonDecode(response.body);
                  List b = data;
                  c = decryptMultiline(
                  b,[ "id_membre","nom_membre","postnom_membre","prenom_membre","profil"," ","statut_membre"]); 

                var settings = context.read<Compte_provider>();
                  settings.updat_membre_list(c); 
                print(c);  
              }
        }
      
      }
    }
 





 static essei(String intro)async{
  var data;
      final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/essai.php"),body: {
        "mail": intro
      });

            if (response.statusCode==200) {
                  data = jsonDecode(response.body);
                  print(data);
            }
 }






  
  }