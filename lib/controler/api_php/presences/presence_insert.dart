import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;





presence( int id_membre, int id_annee,String partir) async{
      DateTime a = DateTime.now();
      String date_presence ="${a.year}-${a.month}-${a.day}";
      String heure_arrivee = "${a.hour}:${a.month}:${a.second}";
      String? heure_depart = "${a.hour}:${a.month}:${a.second}";
      
      final response= await http.post(Uri.parse("http://wspacephp/php/presences.php"),body:{
          "date_presences":date_presence,
          "heure_arrive":heure_arrivee,
          "heure_depart":heure_depart,
          "id_membre":id_membre.toString(),
          "partir" : partir,
      });


      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      //print(data);
      
    } else {
      //print("erreur");
    }
  }