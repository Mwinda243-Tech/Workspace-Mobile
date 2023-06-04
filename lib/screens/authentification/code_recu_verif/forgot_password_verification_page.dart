import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wpmobile/screens/Home_Screen.dart';
import 'package:wpmobile/screens/theme_helper.dart';


class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() =>
      _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                height: 120,
                margin: const EdgeInsets.only(top: 80),
                width: 120,
                child:Image.asset("img/1659825930291.png", fit: BoxFit.cover,),
              ),



              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Verification',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(3, 3, 91, 1)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                           
                            Container(
                              //color: Colors.red,
                              height: 100,
                              width: 300,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                              Card(
                              elevation: 5,
                              color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 1,color: Colors.black.withOpacity(0.1))
                                      ),
                                      height: 50,
                                      width: 50,
                                      
                                    ),
                                  ),


                              Card(
                              elevation: 10,
                              color: Colors.transparent,
                                    child:Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 1,color: Colors.black.withOpacity(0.1))
                                      ),
                              )),


                              Card(
                              elevation: 10,
                              color: Colors.transparent,
                                    child:Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 1,color: Colors.black.withOpacity(0.1))
                                      ),
                              )),


                              Card(
                              elevation: 10,
                              color: Colors.transparent,
                                    child:Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(width: 1,color: Colors.black.withOpacity(0.1))
                                      ),
                                    ))



                                ],
                              ),
                            ),

                            const SizedBox(height: 20.0),


                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Renvoie!',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ThemeHelper().alartDialog(
                                                "Successful",
                                                "Verification code resend successful.",
                                                context);
                                          },
                                        );
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(3, 3, 91, 1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  onPressed: _pinSuccess
                                      ? () {
                                          
                                        }
                                      : null,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      "Verification".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            
                            onTap: (){
                              Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home_Screen()),        //----------post auth
                                                (Route<dynamic> route) =>
                                                    false);
                            },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
