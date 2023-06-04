import 'package:flutter/material.dart';


class Gestionnaire_bt extends StatefulWidget {
  const Gestionnaire_bt({super.key});

  @override
  State<Gestionnaire_bt> createState() => _Gestionnaire_btState();
}

class _Gestionnaire_btState extends State<Gestionnaire_bt> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
                onTap: () {} ,//Navigator.push(context,CupertinoPageRoute(builder: (ctx) => DetailPost())),
                child: Container(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  width: 450,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color:const Color(0xff2F323C).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //---------------------------------icon-------------
                        Container(
                          height: _height * 0.078,
                          width: _width * 0.14,
                          margin:const EdgeInsets.only(top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        
                          child: const Icon(Icons.picture_as_pdf_outlined,color: Colors.white,size: 40,),
                        ),


                      //----------------------nom------------------
                      Container(
                        width: _width * 0.53,
                        height: _height * 0.078,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Text("Compte rendu dela ............",style: TextStyle(color: Colors.white,fontSize: _width*0.036),),
                                Text("CEo/",style: TextStyle(color: Colors.blue,fontSize: _width * 0.032))
                          ],
                        ),
                      ),


                      //-------------heure------------
                      SizedBox(
                        height: _height * 0.078,
                        width: _width * 0.195,
                        child: Column(
                          children: [
                                 Text("13h30",style: TextStyle(color: Colors.blue,fontSize: _width * 0.032)),
                                 Text("01/01/2023",style: TextStyle(color: Colors.blue,fontSize: _width * 0.032))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}