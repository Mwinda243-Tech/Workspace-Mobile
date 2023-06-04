import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'package:wpmobile/controler/decrypt.dart';





 Future<dynamic> presence_list(String d_jour ,BuildContext context) async{
      
      final response= await http.post(Uri.parse("https://dirinfo.000webhostapp.com/wordSpace/presence_list.php"),body:{
          "date_jour":d_jour,
      });

      if (response.statusCode==200) {
          var data=jsonDecode(response.body);
          var result = decryptMultiline(data, ["nom_membre","postnom_membre","prenom_membre","profil","heure_arrivee","heure_depart"]);
      
      /* var settings =  context.read<Compte_provider>();
          settings.updat_presence_list(result); */
        return data;
      }else {
        //print("erreur");
        return [];
      }
  }