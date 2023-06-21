import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wpmobile/controler/api_php/api_php.dart';
import 'package:wpmobile/controler/api_php/users/authentification.dart';
import 'package:wpmobile/screens/Home_Screen.dart';




class Auth_Screem extends StatefulWidget {
  const Auth_Screem({Key? key}) : super(key: key);

  @override
  State<Auth_Screem> createState() => _Auth_ScreemState();
}

class _Auth_ScreemState extends State<Auth_Screem> {
  String mail="";
  String pass="";
  bool pressed=false;


  

  late Timer teaming ;
  double chronox=0;

  //------------------------aller à une  page sans possibilite de retourner
  /* Future<bool> goto(page) async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return page;
      }));
    return true;
  } */


   Widget btShowDialogue(String title){
    return InkWell(
                child: Container(
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:const  Color.fromRGBO(0, 121, 225, 1)
                    ),
                          
                  margin: const EdgeInsets.only(top: 20),
                  width: 120,
                  height: 45,
                  child:  Center(
                      child: Text(title, style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                          )),
                        ),
                      ),

                      onTap: (){
                          Navigator.pop(context);
                        },
                    );
                }

   Widget bt_pop(String titre){
    return Container(
      height: 30,
      width: 150,
      decoration: BoxDecoration(
        border:  Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.blue.withOpacity(0.3)
          )
          )
      ),
      child: Text(titre),
    );
   }

  void startTimer(){
    teaming = Timer.periodic(const Duration(seconds:3), (Timer timer){
      setState(() {
        if (chronox>15) {
            teaming.cancel();
            setState(() {
              pressed=false;
              msgBox("l'adresse ou mot de passe incorrect, s'il vous plait veuillez revoir vos informations",1);
            }); 
        }
      else{
       setState(() {
          chronox=chronox+1;
       });
        print(chronox);
      }
      });
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    print("initstate -------------------------------------------");
   // context.read<Authentifier>().session();
    var  session = context.read<Authentifier>().userConnect;
    print("$session ----------------------------------------");

    print("voici la session: ${session?.postNom} ----------------------------------");
    if(session != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return Home_Screen();
      }));

    }else{
      return null;
    }
  }

  Widget build(BuildContext context) {
    //initState();
      return Scaffold(
        backgroundColor: Colors.white,

        //--------------body*---------
        body: ListView(
          children: [

            SizedBox(
              height: 700,

              child:  Stack(
                children: [
                  
                  //----------------arrire plan filtrer----------
                    Container(
                      color: Colors.white.withOpacity(0.3),
                    ),



                //------------body------------------

                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [

                          //--------------logo classApp------
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(top: 30,bottom: 30),
                            decoration: const BoxDecoration(
                              image:  DecorationImage(image: AssetImage("assets/icons/ac1.png"))
                            ),
                          ),


                          // message de bienvenue
                        const Text(
                          'Bienvenue',
                          style:
                              TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color:Color.fromRGBO(0, 121, 225, 1)),
                        ),

                        // message sous bienvenue
                       const Text(
                          'Authentifiez-vous Ici !',
                          style: TextStyle(color: Colors.grey),
                        ),


                        


                          //--------------------label 1
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color:const Color.fromRGBO(0, 121, 225, 1))
                            ),
                            margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                            

                            child: Flex(
                              direction: Axis.horizontal,
                              children: [

                                //---------------------icon1
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                  width: 50,
                                  decoration:const  BoxDecoration(
                                    border: Border(
                                      right: BorderSide(width: 2,color: Color.fromRGBO(0, 121, 225, 1)))
                                    ),
                                  child: const Icon(Icons.phone,color: Color.fromRGBO(0, 121, 255, 1),size: 30,),
                                ),
                              ),


                              //-------------------textField1
                              Expanded(
                                flex: 5,
                                child: TextField(
                                maxLines: 1,
                                textAlignVertical: TextAlignVertical.bottom,
                                    onChanged: (value) {
                                      setState(() {
                                        mail=value.toString();
                                       });  
                                    },
                                decoration: const InputDecoration(
                                hintText: "Votre mail / numero....",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(2),
                              ),
                              borderSide: BorderSide(color:Color.fromRGBO(0, 121, 225, 1)),
                            ))
                            )
                          )
                             // Expanded(child: child)
                              ],
                              )
                        ),



                          //--------------------label 2
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: const Color.fromRGBO(0, 121, 225, 1))
                            ),
                            margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                            

                            child: Flex(
                              direction: Axis.horizontal,
                              children: [

                                //-----------container icon2-----------
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(width: 2,color: Color.fromRGBO(0, 121, 225, 1)))
                                      ),
                                    child: const Icon(Icons.keyboard,color: Color.fromRGBO(0, 121, 225, 1),size: 30,),
                                  ),
                                ),


                                //----------container textfield 2----------------
                                Expanded(
                                  flex: 5,
                                  child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                        onChanged: (value) {
                                          setState(() {
                                             pass = value.toString();
                                          });     
                                        },
                                  decoration: const InputDecoration(
                                  hintText: "Votre pass...****",
                                  border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  borderSide: BorderSide(color:Color.fromRGBO(0, 121, 225, 1)),
                                                          ))),
                                )],
                        )),


                          //-----------------------bt se connecter
                          InkWell(

                            onTap: pressed == true ? null : ()async{
                              if (mail!="" && pass!=""){
                                setState(() {
                                  chronox=0;
                                  
                                });
                             startTimer();
                              setState(() {
                                pressed = true;
                                print(pressed);
                              });
                              print("CLICQUER-------------------");
                              var status = await context.read<Authentifier>().connexion(mail, pass);
                              if(status != null){
                                setState(() {});
                                var session = context.read<Authentifier>().session();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home_Screen()));
                              } else {

                              print("ECHEC----------------------------------");
                              msgBox("Mot de passe ou adresse email incorrect",1);
                              setState(() {
                                pressed = false;
                              });
                              }
                              /* var al = await login(context, mail, pass);
                              print(al);

                              setState(() {
                                pressed = false;
                              });
                              */

                              teaming.cancel();       //---------la foction pour arreter le timer-----------

                              } else {
                                msgBox("Veulliez saisir votre mail, ainsi que le mot de passe s'il vous plait",1);
                              }
                            },
                            
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color:const  Color.fromRGBO(0, 121, 225, 1),
                              ),
                              
                              margin: const EdgeInsets.only(top: 20),
                              width: 250,
                              height: 50,
                              child: Center(
                                child: pressed ==false? const Text("Se connecter", style: TextStyle(
                                  color: Colors.white
                                )) :
                                const SpinKitFadingCircle(
                                  color: Colors.white,
                                  size: 20,
                                )
                                ,
                              ),
                            ),

                            
                          ),



                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: 250,
                              child: const Center(
                                child: Text("Mot de pass oublie ?", style: TextStyle(
                                 color: Color.fromRGBO(3, 3, 91, 1),
                                 fontSize: 15
                                ),),
                              ),
                            ),

                          onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordPage()));
                          },
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }









//-------------message box  --------

  Future<void> msgBox(String message, int action){
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


            Center(child: btShowDialogue("réessayer"))
          ]
          );
        }
      );
    }
  }