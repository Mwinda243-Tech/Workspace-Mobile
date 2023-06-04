import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/post/appbar.dart';
import 'package:wpmobile/screens/presence/msg_Scan.dart';







class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _gLobalkey = GlobalKey();
  String textQr = "";
  String mesg = "";
  QRViewController? controller;
  Barcode? result;
  bool test = false;
  
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
     setState(() {
       result = event;
     });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    /* if (result != null) {
      textQr = result.toString();
        try {
          textQr = textQr.split("#-#")[1].split(" ")[0].split("-")[0];
          if (textQr == DateTime.now().toString().split(" ")[0].split("-")[0]){
            //
          } else {
            mesg="Qr erroné, veuillez Re-scanner le code";
          }
        } catch (e) {
          mesg = "Qr erroné, veuillez Re-scanner le code x";
        }
    } */


    return Scaffold(
      backgroundColor: Style.backgroundColor,
      appBar: appBar(context,"Scanner"),      //-------------------------app bar----------
      body: Center(
        child: Column(
          children: <Widget>[

            IconButton(onPressed: (){
              setState(() {
                test = true;
                //msgBox();

                //DateTime a = DateTime.now(); 
                //textQr = "9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoKCgoxeThbeZTn1MRJ0ch1RzO+8x2rl1AAAAAAAAAAAAAAAAAGaMbgBrNAAAAAAAAAPJ5fT5qU0rj25nX0+b2RGdMOedeJXfzek0AETWnCuw4z6NPNXccXbCZvDKzDWSdHLTrvn07ufQAAAAAAAAAAAAGGgGGs0M0GGgAwAAGsGsGgAYDcGs0GHk83o89evlw9hx7R5j0eryeuNzcM8nXhXo9Xl9UAAc80TU2TliI7jOHpHn30DlPYc57YRtCFDa5Dq4js44d3LDs4adnn075yg9DjZbz4eh58PS8w9Ly4evIg7OMnpzkPQwbgAbgAaBmjG4AAAAAAAADDyefv56ery+o58O/A9Pq8vrhO8DjhXo9Pm9UAAc6jmds56dHGjcoTPQTHajlXQeW+45c/Tp5d9#-#${DateTime.now().toString()}";
                //textQr = textQr.split("#-#")[1].split(" ")[0].split("-")[0];
                
                print(textQr);
              });
            }, icon: const Icon(Icons.add_box_sharp)),

            Container(
              height: 380,
              width: 400,
              margin: const EdgeInsets.only(top: 90),
              child: test == false ? QRView(
                  key: _gLobalkey,
                  onQRViewCreated: qr
              ) : Msg_Scann()
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: (result !=null) ? Text(mesg,style: const TextStyle(color: Colors.white),) : const Text('Scan a code',style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
