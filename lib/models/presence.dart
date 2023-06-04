

class Presence {
  final int id_presence;
  final String presence_jour;
  final String Date_presence;
  final String heure_arrivee;
  final String heure_depart;     //-----------------------lien image
  final String id_membre;
  final String id_annee;
  

  const Presence({
    required this.id_presence,
    required this.presence_jour,
    required this.Date_presence,
    required this.heure_arrivee,
    required this.heure_depart,
    required this.id_membre,
    required this.id_annee,
    
  });


  factory Presence.fromJson(Map<String ,dynamic> i)=>Presence(
    id_presence : i["id_presence"], 
    presence_jour : i["presence_jour"], 
    Date_presence: i["Date_presence"], 
    heure_arrivee : i["heure_arrivee"],
    heure_depart: i["heure_depart"],
    id_membre : i["id_membre"], 
    id_annee: i["id_annee"], 
    );
    

    Map<String , dynamic> toMap()=>{
      "id_presence": id_presence,
      "nopresence_jourm":presence_jour,
      "Date_presence":Date_presence,
      "heure_arrivee":heure_arrivee,
      "heure_depart":heure_depart,
      "id_membre": id_membre,
      "id_annee":id_annee,
    };
}

