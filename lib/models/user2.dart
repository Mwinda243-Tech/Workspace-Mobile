

// To parse this JSON data, do
//
//     final User2 = userFromJson(jsonString);

import 'dart:convert';

User2 userFromJson(String str) => User2.fromJson(json.decode(str));

String userToJson(User2 data) => json.encode(data.toJson());

class User2 {
  int? id;
  String? nom;
  String? postNom;
  String? prenom;
  String? imagePath;
  String? email;
  String? passw;
  int? idStatut;
  String? about;

  User2({
     this.id,
     this.nom,
     this.postNom,
     this.prenom,
     this.imagePath,
     this.email,
     this.passw,
     this.idStatut,
     this.about,
  });

  factory User2.fromJson(Map<String, dynamic> json) => User2(
    id: json["id"],
    nom: json["nom"],
    postNom: json["postNom"],
    prenom: json["prenom"],
    imagePath: json["imagePath"],
    email: json["email"],
    passw: json["passw"],
    idStatut: json["id_statut"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "postNom": postNom,
    "prenom": prenom,
    "imagePath": imagePath,
    "email": email,
    "passw": passw,
    "id_statut": idStatut,
    "about": about,
  };
}
