import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/screens/tache/profil_tache.dart';




class AddPresence extends StatefulWidget {
  const AddPresence({super.key});

  @override
  State<AddPresence> createState() => _AddPresenceState();
}

class _AddPresenceState extends State<AddPresence> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    

     List<List<String>> mb = [
        ["Albin bakumba","assets/icons/DSC_5205.JPG","index","","Ceo","add"],["Parfait Lumbaya","assets/IMG-20230320-WA0022.jpg","index","","An Security","add"],
        ["Moardochée Mbuyamba","assets/fonts/IMG-20230517-WA0034.jpg","index","","Data Analyst","add"],["Ben Kalombo","assets/IMG-20230320-WA0016.jpg","index","","DT","add"],
        ["Ken Swenge","assets/icons/DSC_5205.JPG","index","","sesigner","add"],["Heron akemiko","assets/IMG-20230320-WA0020.jpg","index","","Dev web","add"],
        ["Victorine kaleko","assets/IMG-20230320-WA0019.jpg","index","","Rel publique","add"],["Magloire Mirkobi","assets/IMG-20230320-WA0029.jpg","index","","Data scientist","add"],

      ];
    

    return Consumer<Compte_provider>(
      builder: (context, settings, child) {

        List<Widget> membre_list = [];
       /*  for (var i = 0; i < settings.membre_list.length; i++) {
          membre_list.add(
            Profil_tache(
              colorText: Colors.white, 
              nom: "${settings.membre_list[i][3]} ${settings.membre_list[i][1]}", 
              profil: settings.membre_list[i][4],
              index: settings.membre_list[i][0],
              statut_membre: settings.membre_list[i][6],
              statut_tache: "",
              action: "presence"),
          );
        }
 */

        for (var i = 0; i < mb.length; i++) {
          membre_list.add(
            Profil_tache(
              colorText: Colors.white, 
              nom: mb[i][0], 
              profil: mb[i][1],
              index: "",
              statut_membre: mb[i][4],
              statut_tache: "",
              action: "presence"),
          );
        }

      return Column(
      children: [

        
            Container(
              height: 38,
              width: _width*0.6,
                decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.09),
                borderRadius: BorderRadius.circular(20)
              ),

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //-------------recherche-------,
                    Container(
                      //color: Colors.red,
                      width: _width*0.43,
                    ),


                    //----------------bt------------
                    IconButton(onPressed: (){}, icon: const Icon(Icons.search))
                  ],
                )
            ),



            //---------------------list-----
            Container(
             // color: Colors.red,
              height: _height*0.54,
              child: ListView(
                children: membre_list
              ),
            )
            
          ],
        );
      });
  }
}