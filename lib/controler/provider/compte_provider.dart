import 'package:flutter/material.dart';



class Compte_provider  extends ChangeNotifier {


  String post_text= "";
  String f_join = "non";
  DateTime heure_date_poste = DateTime.now();
  String Id_membre ="";

  List post_list = []; 
  List presence_list = []; 

  List infor_Compte = [];


  List tache_list = [];
  List membre_list = [];

  String id_tache="";

 void update_infor_Compte(List value ){
    infor_Compte = value;
    notifyListeners();
 }

  void updat_post_list(List value ){
    post_list = value;
    notifyListeners();
  }


  void updat_id_tache(String value ){
    id_tache = value;
    notifyListeners();
  }



  void updat_post(String value ){
    post_text = value;
    notifyListeners();
  }



  void updat_presence_list(List value){
    presence_list = value;
    print(presence_list);
    notifyListeners();
  }



  void updat_taches_list(List value){
    tache_list = value;
    notifyListeners();
  }



  void updat_membre_list(List value){
    membre_list = value;
    notifyListeners();
  }

  void updat_agenttache_list(String value,bool chek){
    for (var i = 0; i < membre_list.length; i++) {
      if (membre_list[i][0]==value && chek==true) {
        membre_list[i][5]="selectionner";
      }
      else if(membre_list[i][0]==value && chek==false){
        membre_list[i][5]="null";
      }
    }
    print(membre_list);
    notifyListeners();
  }

}