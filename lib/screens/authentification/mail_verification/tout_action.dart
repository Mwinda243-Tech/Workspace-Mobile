

import 'package:wpmobile/screens/authentification/authScreem.dart';
import 'package:wpmobile/screens/authentification/code_recu_verif/forgot_password_verification_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wpmobile/screens/theme_helper.dart';


Form container_de_textfield_boutton_autre(
    BuildContext context, GlobalKey<FormState> _formKey) {
  return Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
//--------------------container du text field-------------------------------
        Container(
          decoration: ThemeHelper().inputBoxDecorationShaddow(),
          child:TextFormField(
            decoration: ThemeHelper().textInputDecoration("Email", "Enter your email"),
            validator: (val) {
              if (val!.isEmpty) {
                return "Email can't be empty";
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                  .hasMatch(val)) {
                return "Enter a valid email address";
              }
              return null;
            },
          ),
        ),

        const SizedBox(height: 20), //--espace

//-----------------conatainer du bouttom valider---------------------------
        Container(
          decoration: ThemeHelper().buttonBoxDecoration(context),
          child: ElevatedButton(
            style: ThemeHelper().buttonStyle(),
            child: Text(
              "valider".toLowerCase(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
            //  if (_formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ForgotPasswordVerificationPage()),
                );
              }
           // },
          ),
        ),

        const SizedBox(height: 30.0), //--espace

//---------------------text en bas du boutton----------------------------
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "je m'en souviens! ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                )
              ),
              TextSpan(
                text: ' Connexion',
                style: const TextStyle(
                  color: Color.fromRGBO(3, 3, 91, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Auth_Screem()),
                    );
                  },
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
