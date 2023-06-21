import 'package:flutter/material.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/api_php/users/userController.dart';
import 'package:wpmobile/models/user2.dart';




class AddCompte extends StatefulWidget {
  const AddCompte({super.key});

  @override
  State<AddCompte> createState() => _AddCompteState();
}

class _AddCompteState extends State<AddCompte> {
  String? type_compte_choisi ="Compte " ;
  String? type_agent_choisi ="User " ;
  String nom = "";
  String postnom = "";
  String prenom = "";
  String mail = "";
  String passw= "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: ListView(
        children: [
          //----------------------------nom----
                   Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: height*0.05,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                     child: TextField(
                                style: const TextStyle(color: Colors.grey),
                                textAlignVertical: TextAlignVertical.bottom,
                                    onChanged: (value) {
                                      setState(() {
                                        nom = value;
                                      });
                                    },
                                decoration: const InputDecoration(
                                hintText: "Nom agent....",
                                hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(2),
                              ),
                              borderSide: BorderSide.none,
                            ))
                            ),
                      ),
    
    
                //----------------------------postnom
                  Container(
                   margin: const EdgeInsets.only(top: 15),
                   height: height*0.055,
                   decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                     borderRadius: BorderRadius.circular(10),
                   ),
                    child: TextField(
                       style: const TextStyle(color: Colors.grey),
                               textAlignVertical: TextAlignVertical.bottom,
                                   onChanged: (value) {
                                    setState(() {
                                      postnom= value;
                                    });
                                   },
                               decoration: const InputDecoration(
                               hintText: "Post-nom agent....",
                               hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                               border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(2),
                             ),
                             borderSide: BorderSide.none,
                           ))
                           ),
                      ),
    
    
                
                       //-------------------------text saisi
                  Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: height*0.05,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                   child: TextField(
                     style: const TextStyle(color: Colors.grey),
                              textAlignVertical: TextAlignVertical.bottom,
                                  onChanged: (value) {
                                    prenom = value;
                                  },
                              decoration: const InputDecoration(
                              hintText: "Prenom agent....",
                              hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2),
                            ),
                            borderSide: BorderSide.none,
                          ))
                          ),
                      ),
    
    
    
    
                //------------------------Statut-----------------------
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                
                
                      //-------------------------Statut compte
                      Container(
                       width: width*0.35,
                       height: height*0.05,
                       decoration: BoxDecoration(
                         color: Colors.blue.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(10),
                       ),
                         child: PopupMenuButton(
                                     icon: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text(type_compte_choisi!,style: const TextStyle(color: Colors.grey)),
                                       const Icon(Icons.arrow_circle_down_sharp,color: Color.fromRGBO(0, 121, 225, 1),)
                                     ],
                                   ),
                                     initialValue: type_compte_choisi,
                                     onSelected: (value){
                                         setState(() {
                                           type_compte_choisi = value.toString();
                                         });
                                     },
                                     itemBuilder: (BuildContext context){
                                       return [
                                         PopupMenuItem(
                                           value: "Actif",
                                           child: Container(
                                            child: Text("Actif"))
                                           ),
                       
                                         PopupMenuItem(
                                           value: "Bloqué",
                                           child: Container(
                                            child: Text("Bloqué"))
                                           ),
                                       ];
                                     }
                                   ),
                       ),
                
                      //------------------Statut user----------
                      Container(
                       width:  width*0.35,
                       height: height*0.05,
                       decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(10),
                       ),
                         child: PopupMenuButton(
                                     icon: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text(type_agent_choisi!,style : const TextStyle(color: Colors.grey)),
                                       const Icon(Icons.arrow_circle_down_sharp,color: Color.fromRGBO(0, 121, 225, 1),)
                                     ],
                                   ),
                                     initialValue: type_agent_choisi,
                                     onSelected: (value){
                                         setState(() {
                                           type_agent_choisi = value.toString();
                                         });
                                     },
                                     itemBuilder: (BuildContext context){
                                       return [
                                         PopupMenuItem(
                                           value: "Admin",
                                           child: Container(
                                            child: Text("Admin"))
                                           ),
                       
                                         PopupMenuItem(
                                           value: "User_simple",
                                           child: Container(
                                            child: Text("User_simple"))
                                           ),
                       
                                       ];
                                     }
                                   ),
                       ),
                  ]),
                ),
    
    
                //---------------------------mail
                  Container(
                  margin: const EdgeInsets.only(top: 15),
                   height: height*0.05,
                   decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                     borderRadius: BorderRadius.circular(10),
                   ),
                    child: TextField(
                       style: const TextStyle(color: Colors.grey),
                               textAlignVertical: TextAlignVertical.bottom,
                                   onChanged: (value) {
                                        setState(() {
                                          mail=value;
                                        });
                                   },
                               decoration: const InputDecoration(
                               hintText: "mail agent....",
                               hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                               border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(2),
                             ),
                             borderSide: BorderSide.none,
                           ))
                           ),
                      ),
    
    
    
                //---------------------------paswword
                  Container(
                  margin: const EdgeInsets.only(top: 15),
                   height: height*0.05,
                   decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                     borderRadius: BorderRadius.circular(10),
                   ),
                    child: TextField(
                       style: const TextStyle(color: Colors.grey),
                               textAlignVertical: TextAlignVertical.bottom,
                                   onChanged: (value) {
                                       setState(() {
                                         passw=value;
                                       });
                                      },
                               decoration: const InputDecoration(
                               hintText: "Mot de pass initial....",
                               hintStyle: TextStyle(
                                  color: Colors.grey
                                ),
                               border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(2),
                             ),
                             borderSide: BorderSide.none,
                           ))
                           ),
                      ),


          
          //------------------------bt valider
          Center(
            child: InkWell(
              onTap: (){
                print("--------------------------------------------");
                if (type_agent_choisi != null && type_compte_choisi != null) {
                //  Api_php.register(nom, postnom, prenom," ", mail, passw, type_compte_choisi!, type_agent_choisi!);
                 // UserController.registerLocal(User2(nom: nom, postNom: postnom, prenom: prenom, email: mail, passw: passw, about: "Me",idStatut: 1, imagePath: ""));
                 UserController.register(nom, postnom, prenom, 'M', mail, passw, "ACTIF", "ADMIN");
                 // UserController.recupLocal();
                  Navigator.pop(context);
                }
              
              },
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
                  height: height*0.055,
                  width: 170,
                  child: const Center(child: Text("Valider",style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}