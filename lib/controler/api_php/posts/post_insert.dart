import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'  as http;



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