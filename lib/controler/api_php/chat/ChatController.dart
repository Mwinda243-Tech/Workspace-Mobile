import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ChatController with ChangeNotifier{

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
}