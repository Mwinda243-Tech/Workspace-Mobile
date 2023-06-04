import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/Api_sharedPreferences.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/provider/compte_provider.dart';
import 'package:wpmobile/screens/post/appbar.dart';
import 'package:wpmobile/controler/sizeconfig.dart';
import 'package:wpmobile/screens/post/post_bt.dart';
import 'package:wpmobile/controler/style.dart';



class Post_home extends StatefulWidget {
  const Post_home({super.key});

  @override
  State<Post_home> createState() => _Post_homeState();
}

class _Post_homeState extends State<Post_home> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    SizeConfig().init(context);
    

    Api_php.post_list(context);

    return Consumer<Compte_provider>(
      builder: (context, settings, child) {
       
        List<Widget> postlist= [];

       /* for (var i = 0; i <settings.post_list.length ; i++) {
          postlist.add(Post_bt(
            id_poste: settings.post_list[i][0][0],
            description: settings.post_list[i][0][1],
            dateTime: settings.post_list[i][0][2],
            id_posteur: settings.post_list[i][0][3],
            nom_posteur: " ${settings.post_list[i][0][6]} ${settings.post_list[i][0][4]}",
            profil: settings.post_list[i][0][7],
            lecteurList: settings.post_list[i][1],
            reactionList: settings.post_list[i][2],
          ));
       } */

       postlist.add(Container(
        height: 100,
        width: 50,
       ));

      return Scaffold(
        backgroundColor: Style.backgroundColor,
        //appBar: appBar(context,"Your space"),      //-------------------------app bar----------

        //drawer: Drawer_vue(),
        
        body: /* settings.post_list.length == 0 ? 
        Center(
          child: Container(
            width: 300,
            height: 300, 
            //color: Colors.red,
            child: const SpinKitCubeGrid(color: Colors.blue,size: 50),
            )) :  */
        
          SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Post_bt(id_poste: "id_poste", description: "bonjour les gars, c'est deja pour aujourd'hui. rendez-vous à 20h pour la mise au point", dateTime: "dateTime", id_posteur: "id_posteur", nom_posteur: "Albin bakumba", profil: "assets/icons/DSC_5205.JPG", reactionList: ["ddd","nn","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr""rrrrrr"], lecteurList: ["rrrrrr","ffff","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr","rrrrrr"],statut_user: "CEO",date: "01/06/2023 10h35'",image: ["assets/fonts/IMG-20230525-WA0014.jpg","assets/fonts/IMG-20230525-WA0032.jpg","assets/fonts/IMG-20230525-WA0023.jpg","assets/fonts/IMG-20230525-WA0036.jpg","assets/fonts/IMG-20230526-WA0004.jpg","assets/fonts/IMG-20230525-WA0035.jpg","assets/fonts/IMG-20230525-WA0024.jpg","assets/fonts/IMG-20230525-WA0022.jpg","assets/fonts/IMG-20230527-WA0012.jpg","assets/fonts/IMG-20230527-WA0013.jpg"],),
              Post_bt(id_poste: "id_poste", description: "Bonsoir cher tous, merci pour votre presences et on se dit à tres bien-tot. le travail finira par payer", dateTime: "dateTime", id_posteur: "id_posteur", nom_posteur: "Ben Mukena", profil: "assets/IMG-20230320-WA0016.jpg", reactionList: ["ddd","nn","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"], lecteurList: ["rrrrrr","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"], statut_user: "DT",date: "25/05/2023 19h35'",image: ["assets/fonts/IMG-20230514-WA0014.jpg","assets/fonts/IMG-20230514-WA0016.jpg","assets/fonts/IMG-20230514-WA0016.jpg"],),
              Post_bt(id_poste: "id_poste", description: "Bonjour à tous; l'un des objectifs a été atteint avec succès bravo !!, mais c'est juste un début. l'impact sera immense!!!", dateTime: "dateTime", id_posteur: "id_posteur", nom_posteur: "Ben Mukena", profil: "assets/IMG-20230320-WA0016.jpg", reactionList: ["ddd","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn","nn"], lecteurList: ["rrrrrr","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"],statut_user: "DT",date:"14/05/2023 17h35'",image: ["assets/fonts/IMG-20230513-WA0000.jpg","assets/fonts/IMG-20230515-WA0021.jpg","assets/fonts/IMG-20230513-WA0004.jpg"],),
              Post_bt(id_poste: "id_poste", description: "Bonsoir cher tous, nous vous remercions pour votre participation, et nous vous disons à tres bien-tot", dateTime: "dateTime", id_posteur: "id_posteur", nom_posteur: "Izrael mukendi", profil: "assets/IMG-20230320-WA0023.jpg", reactionList: ["ddd","nn","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"], lecteurList: ["rrrrrr","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"], statut_user: "CEO/I",date: "12/05/2023 19h35'",image: ["assets/fonts/IMG-20230514-WA0014.jpg","assets/fonts/IMG-20230514-WA0016.jpg"],),
              Post_bt(id_poste: "id_poste", description: "salut la famille, juste vous informer que nous sommes de partenaire officiel des journées informatique, encore une victoire qui nous rapproche de l'objectif", dateTime: "dateTime", id_posteur: "id_posteur", nom_posteur: "Ben Mukena", profil: "assets/IMG-20230320-WA0016.jpg", reactionList: ["ddd","nn","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"], lecteurList: ["rrrrrr","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff","ffff"],statut_user: "DT",date: "08/05/2023 17h35'",image: ["assets/fonts/IMG-20230513-WA0058.jpg"],),
            ]
            
            //postlist
          ),
        ),

      //bottomNavigationBar: BottomNavigationBar(items: items),
      /* bottomSheet: BottomSheet(
        elevation: 10,
        onClosing: (){},
        builder: ((context) => Container(
          height: 60,
          color: Colors.red,
        ))) */
      
    );
  });}




  //-------------message box  --------

  Future<void> msgBox(String message){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
          return SimpleDialog(
            title: const Icon(Icons.sentiment_dissatisfied_rounded,size: 45,color: Color.fromRGBO(3, 3, 91, 1),),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),

        //contenue du showdialogue (messageBox)
        
          children:  [

             Container(
              height: 80,
              width: 250,
              margin: const EdgeInsets.only(left: 10,right: 10),
              child: Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(3, 3, 91, 1)
                  ),
                ),
              ),

            ),


            Center()
          ]
          );
        }
      );
    }
}




