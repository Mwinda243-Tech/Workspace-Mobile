import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wpmobile/screens/authentification/authScreem.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {

  late Timer teaming ;
  double chrono=0;
  List<String> users=[];
  List<String> usersx=[];

  Future<bool> goto() async{
      //await Api_php.membre_list(context);
      //await PermissionType.INTERNET;
      //await Api_php.tache_lister(context,"membre");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return const Auth_Screem();
      }));
    return true;
  }



  void startTimer(){
    teaming = Timer.periodic(const Duration(microseconds:80000), (Timer timer){
      setState(() {
        if (chrono>35) {
            teaming.cancel();
            goto();  
        }
      else{
       setState(() {
          chrono=chrono+1;
       });
        print(chrono);
      }
      });
    });
  }


@override
  void initState(){
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
  



      child: Flex(
        direction: Axis.vertical,
        children: [

          //---------------------Container du logo-------------------------
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  height: 350,
                  width: 350,
                  child: Image.asset("assets/icons/3.PNG", fit: BoxFit.contain),
                ),
              ),





              Expanded(
                flex: 2,
                child: Stack(
                  children: [

                    
                    
                    //---------------icon bat-----------------------------
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 55),
                        height: 120,
                        width: 170,
                        child: Image.asset("assets/icons/5.jpg", fit: BoxFit.cover,),
                      ),
                    ),
              
              
                    Container(
                      //margin: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text("from", style: GoogleFonts.acme(
                          fontSize: 17,
                          color: Colors.black,
                          decoration: TextDecoration.none
                        )),
                      ),
                    ),


                    Container(   
                      margin: const EdgeInsets.only(top: 130),                   
                        child: const SpinKitWave(
                          color: Colors.blue ,
                          size: 15,
                          ),
                      )
                  ],
                ),
              )
        ],
      ),
    );
  }
}