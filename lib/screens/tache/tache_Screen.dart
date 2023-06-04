import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/controler/sizeconfig.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/tache/tache_bt.dart';




class tache_screen extends StatefulWidget {
  const tache_screen({super.key});

  @override
  State<tache_screen> createState() => _tache_screenState();
}

class _tache_screenState extends State<tache_screen> {
bool choix = false;


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    Api_php.tache_lister(context,"taches");

    SizeConfig().init(context);
    return Consumer<Compte_provider>(
      builder: (context, settings, child) { 
        List<Widget> tacheListEncours = [];
        List<Widget> tacheListFini = [];

       //print(settings.tache_list[0]);
        /* for (var i = 0; i < settings.tache_list.length; i++) {
          tacheListEncours.add(
            Tache_bt(
              description: settings.tache_list[i][0][1],
              date: settings.tache_list[i][0][2],
              membres: settings.tache_list[i][1], 
              statut: '', pourcentage: null,
            ) 
          
          );
        } */

        return Scaffold(
        backgroundColor: Style.backgroundColor,
        //appBar: appBar(context,"Taches"),      //-------------------------app bar----------

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              //-----------------------choix----------------------------
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
        
                    InkWell(
                      onTap: (){
                        setState(() {
                          choix = false;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2,color: choix== false ? Colors.blue : Colors.transparent))
                        ),
                        child: const Center(child: Text("En cours",style: TextStyle(
                          color: Colors.white,
                        ))),
                      ),
                    ),
        
        
        
                    InkWell(
                      onTap: (){
                        setState(() {
                          choix= true;
                        });
                      },
                      child: Container(
                       decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2,color: choix== false ? Colors.transparent : Colors.blue))
                        ),
                        width: 100,
                        height: 40,
                        child: const Center(child: Text("Terminer",style: TextStyle(
                          color: Colors.white,
                        ),)),
                      ),
                    )
                  ],
                ),
              ),




              SizedBox(
                width: _width,
                height: _height*0.72,
                child: /* settings.tache_list.isEmpty ?
                  const Center(
                    child: SizedBox(
                      width: 300,
                      height: 300, 
                      //color: Colors.red,
                      child: SpinKitCubeGrid(color: Colors.blue,size: 50),
                    )) 
                    
                  : */ ListView(
                     children: choix == false ? [

                      Tache_bt(pourcentage: 40,description: "Gestion d'utilisateur(maquette ou interface) du workspace wep", date: "21/05/2023 ", membres: [["James luteza","assets/IMG-20230320-WA0024.jpg","dev Ops"]], statut: "nr"),
                      Tache_bt(pourcentage: 80,description: "mise en place et presentation de la documentation complete de digital academia", date: "21/05/2023 ", membres: [["Steve pindi","assets/IMG-20230320-WA0025.jpg","Dev back-end"],["Izrael Mukendi","assets/IMG-20230320-WA0023.jpg","Dev back-end"]], statut: 'nr',),
                      Tache_bt(pourcentage: 16,description: "Affiche formation flutter, Affiche formation php, Affiche Conferance en ligne de presentation de la strucutre,Session d;information sur nos formation en ligne et presentiel php/symfony et flutter , Affiche partage d'experience sur quelques domaines informatique, Affiche mwinda Academie", date: "21/05/2023 ", membres: [["Ken swenge","assets/IMG-20230320-WA0021.jpg","designer"]], statut: "nr"),
                      
                     ] : [

                      Tache_bt(pourcentage: 100,description: "affiche formation flutter,affiche formation php, session d'information sur nos formation en ligne et en presentiel, formation php,symfony, affiche de presentation de Mwinda Academie", date: "21/05/2023", membres: [["Joseph nzemo","assets/IMG-20230320-WA0018.jpg","designer,graphiste/.."]], statut: 'r',),


                     ]
                     
                     
                     // tacheListEncours
                   ),
              )
            ],
          ),
        ),
    
    
    );
  });


}}



