import 'dart:convert';

import 'package:easy_permission/easy_permission.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/decrypt.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';

class TacheController with ChangeNotifier{

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

}