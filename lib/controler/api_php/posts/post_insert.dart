import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:provider/provider.dart';

import '../../decrypt.dart';
import '../../provider/compte_provider.dart';



post(String details_poste, String id_membre, String f_join	)async{
     DateTime heure_date_poste = DateTime.now();

      final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/post.php"),body:{
          "details_poste": details_poste,
          "heure_date_poste":heure_date_poste.toString().split(".")[0],
          "Id_membre" : id_membre,
          "f_join": f_join
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      print(data);
      
    } else {
      //print("erreur");
    }
  }

 vu_post(String id_membre, String id_poste, String Date_presence)async{
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




 post_list(BuildContext context)async{
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

reaction(String id_membre,	String id_poste,String detail_reaction	)async{
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


