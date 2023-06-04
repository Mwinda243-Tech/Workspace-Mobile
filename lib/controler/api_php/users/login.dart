import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'package:wpmobile/screens/Home_Screen.dart';





Future<dynamic> login(BuildContext context,String mail,String passw) async{
    var a;
    //print("${mail} , ${passw}");
      final response= await http.post(Uri.parse("https://goodben.000webhostapp.com/user/auth"),body:{
          "mail":mail,
          "pass":passw,
      });
      if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_Screen()));

      return data;
     // print(data);
      
       /* if (int.parse(data[1].toString()) == 1) {
        a = decryptLiner(
          data[0],[ "id_membre","nom_membre","postnom_membre",
                    "prenom_membre","mail","profil","pass","statut_compte","statut_membre"]);
        
        /* var settings = context.read<Compte_provider>();
            settings.update_infor_Compte(a); */
        shareset("users", a.join("-"));
        
       // await 
        //Api_php.membre_list(context);
        //await Api_php.post_list(context);
        //await Api_php.tache_lister(context,"taches");
        //await Api_php.tache_lister(context,"membre");
        */
        
        /*
        print(a);
      } else {
          a = data[0];
      }  */
    } else {
      var data=jsonDecode(response.body);
      return data;
     // print(data);
    }
     //print(a);
  }