

class Poste {
  final int id_poste;
  final String details_poste;
  final String Heure_poste;
  final String Fichier_joint;
  final String Date_poste;     //-----------------------lien image
  final String Id_membre;
  

  const Poste({
    required this.id_poste,
    required this.details_poste,
    required this.Heure_poste,
    required this.Fichier_joint,
    required this.Date_poste,
    required this.Id_membre,
    
  });


  factory Poste.fromJson(Map<String ,dynamic> i)=>Poste(
    id_poste : i["id_poste"], 
    details_poste : i["details_poste"], 
    Heure_poste : i["Heure_poste"],
    Fichier_joint: i["Fichier_joint"],
    Date_poste : i["Date_poste"], 
    Id_membre: i["Id_membre"], 
    );
    

    Map<String , dynamic> toMap()=>{
      "id_poste": id_poste,
      "details_poste":details_poste,
      "Heure_poste":Heure_poste,
      "Fichier_joint":Fichier_joint,
      "Date_poste":Date_poste,
      "Id_membre": Id_membre,
    };
}

