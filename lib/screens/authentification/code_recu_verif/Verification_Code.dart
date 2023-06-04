import 'package:wpmobile/screens/authentification/mail_verification/textafichier.dart';
import 'package:wpmobile/screens/authentification/mail_verification/tout_action.dart';
import 'package:flutter/material.dart';


class Verification_Mail extends StatefulWidget {
  const Verification_Mail({Key? key}) : super(key: key);

  @override
  _Verification_MailState createState() => _Verification_MailState();
}

class _Verification_MailState extends State<Verification_Mail> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Stack(
      children: [
//------------------arriere plan----------------------------------------
        Container(color: Colors.white.withOpacity(0.4)),

//---------------contenue de la page-----------------------------------------
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 50,
              elevation: 10,
              backgroundColor:const Color.fromRGBO(3, 3, 91, 1),
              title: const Text("password??",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              actions: [
                IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.help, size: 30, color: Colors.white))
              ],
            ),
            body: Column(
              children: [
//----------------font arriere et logo de l'unikin-----------------------
                Stack(
                  children: [
                    //-------------- logo unikin ------------------
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 100,
                        height: 100,
                        child:
                            Image.asset("img/1659825930291.png", fit: BoxFit.cover,), // logo unikin
                      ),
                    ),
                  ],
                ),

                //----container cobntenat tous ---------
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
//----tous le text affichier (premiere ligne, deuxieme ligne, troisieme ligne)--------
                          textaffichier(),

                          const SizedBox(height: 40.0), //--espace

//-------------container de textfield, boutton valider et a\souvenir----------------
                          container_de_textfield_boutton_autre(
                              context, _formKey)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
