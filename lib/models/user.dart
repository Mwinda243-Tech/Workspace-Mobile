class User {
  final int id;
  final String nom;
  final String postNom;
  final String prenom;
  final String imagePath;     //-----------------------lien image
  final String email;
  final String passw;
  final int id_statut;
  final String about;

  const User({
    required this.id,
    required this.nom,
    required this.postNom,
    required this.prenom,
    required this.imagePath,
    required this.email,
    required this.passw,
    required this.id_statut,
    required this.about,
  });


  factory User.fromJson(Map<String ,dynamic> i)=>User(
    id : i["id"], 
    nom : i["nom"], 
    postNom: i["postNom"], 
    prenom : i["prenom"],
    imagePath: i["imagePath"],
    email : i["email"], 
    passw: i["passw"], 
    id_statut : i["id_statut"],
    about: i["about"],  
    
    );
    

    Map<String , dynamic> toMap()=>{
      "id": id,
      "nom":nom,
      "postNom":postNom,
      "prenom":prenom,
      "imagePath":imagePath,
      "email": email,
      "passw":passw,
      "id_statut":id_statut,
      "about":about,
    };
}

