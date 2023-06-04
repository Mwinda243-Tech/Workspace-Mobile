import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/controler/sizeconfig.dart';
import 'package:wpmobile/screens/post/profil_card.dart';


class DetailPost extends StatefulWidget {
  final String id_poste;
  final String description;
  final String dateTime;
  final String id_posteur;
  final String nom_posteur;
  final String profil;          //------profil du posteur------------------

  final List reactionList;      //--------------list des reactions---------------
  final List lecteurList;       //--------------liste de lecteurs--------------
  final List<String> image; 
  const DetailPost({super.key,
  required this.id_poste,
  required this.description,
  required this.dateTime,
  required this.id_posteur,
  required this.nom_posteur,
  required this.profil,
  required this.reactionList,
  required this.lecteurList, 
  required this.image
  });

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  bool detailClik = false;
  bool choix_detail = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    
    List<Widget> lecteurList= [];
    List<Widget> reactionList= [];

    List<Widget> imagecard = [];

    List<String> date = widget.dateTime.split(" ");

    for (var i = 0; i < widget.image.length; i++) {
      imagecard.add(
        Container(
          height: 250,
          width: _width,
          margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5),
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image[i]),
                fit: BoxFit.cover
                )
            ),
          ),
        )
      );
    }

    /* for (var i = 0; i < widget.lecteurList.length; i++) {
      lecteurList.add( Profil_Card(colorText: Colors.white, nom: "${widget.lecteurList[i][3]} ${widget.lecteurList[i][1]}", profil: widget.lecteurList[i][4],statut: "",date: ""));
    } */

    
    print(widget.reactionList);
    /* for (var i = 0; i < widget.reactionList.length; i++) {
      reactionList.add(BT_reaction(
         widget.reactionList[i][2],
         widget.reactionList[i][3],
         widget.reactionList[i][5],
         widget.reactionList[i][4]
      ));
    }  */

    return Scaffold(
      backgroundColor: Style.backgroundColor,

      appBar: AppBar(
      backgroundColor: Style.backgroundColor,
      elevation: 10,
      leading: Container(
        margin: const EdgeInsets.all(15.0),
        child: IconButton(icon: const Icon( Icons.arrow_back,color: Colors.white), 
        onPressed: (){
          Navigator.pop(context);
        })
        
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          //---------------------------------profil-------------
                            Container(
                              height: _height*0.059,
                              width: _width*0.10,
                              margin:const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                color:const Color(0xff282B35),
                                image: DecorationImage(image: AssetImage(widget.profil))
                              ),
                            ),


                          //----------------------nom------------------
                          Container(
                            width: _width*0.5,
                            margin:const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text(widget.nom_posteur,style: TextStyle(color: Colors.white,fontSize: _width*0.04)),
                                    Text(date[0],style: TextStyle(color: Colors.blue,fontSize: _width*0.034))
                              ],
                            ),
                          )


                        ],
                      ),

        ],
      ),

      actions: [
        CircleAvatar(
          backgroundColor: Style.backgroundColor2,
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.add_comment_rounded)
            )
        ),

        const SizedBox(width: 15)
      ]),
      

      body: Container(
        height:_height,
        padding: const EdgeInsets.only(left: 10,right: 10),
        width: 500,
        child: ListView(
          children: [
                     
                //-------------------------contenue principale--------------
                        Container(
                          padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 7),
                          child: Center(child: Text(widget.description ,style: TextStyle(color: Colors.white,fontSize: _width*0.035),textAlign: TextAlign.justify)),
                        ),
              


                //-------file
                Container(
                  //color: Colors.red,
                  //height: 100,
                  width: 300,
                  child: Column(
                    children: imagecard,
                  ),
                ),


                //------------------------espace vide
                const SizedBox(
                  width: double.infinity,
                  height: 100,
                )
          ],
        ),
    ),


    bottomSheet: Container(
        color: Style.backgroundColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          width: SizeConfig.width,
          height: detailClik==true ? 500 : 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 25),
              
              InkWell(
                onTap: (() {
                  setState(() {
                          if (detailClik == true) {
                            detailClik = false;
                          } else {
                            detailClik = true;
                          }
                        });
                }),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon( detailClik==true ? Icons.keyboard_double_arrow_down_rounded : Icons.keyboard_double_arrow_up_outlined, color: Style.backgroundColor, size: 30),
                              
                    //----------------titre
                    const Text(
                    "Voir les lecteurs",
                    style: TextStyle(color: Colors.white,fontSize: 17),
                  ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 5),
              Container(
                height: detailClik==true ? 450 : null,
                child: detailClik==true ? ListView(
                  children: [

                    separation(400,4,Colors.grey),

                    //------------------------------les option pour faire un choix---------------
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          //--------------choix lecteur
                          InkWell(
                            onTap: (){
                              setState(() {
                                choix_detail = false;
                              });
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Text("Lecteurs", style: TextStyle(color: Colors.white)),
                                  Icon(Icons.check_box_sharp,color: choix_detail == false ? Colors.blue : Colors.grey)
                                ],
                              )),
                          ),


                          //-------------choix reaction
                          InkWell(
                            onTap: (){
                              setState(() {
                                choix_detail = true;
                              });
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Text("Reactions",style: TextStyle(color: Colors.white)),
                                  Icon(Icons.check_box_sharp,color: choix_detail == false ? Colors.grey : Colors.blue)
                                ],
                              )),
                          )
                    
                        ],
                      ),
                    ),

                    //---------------------les reactioms---------------
                    Column(
                      children: choix_detail == false ? lecteurList : reactionList
                    )

                   
                  ],
                ) : null,
              ),

                      
            ],
          ),
        ),
      )
    );
  }





  Widget separation(double taille , double bottomT,Color coleur){
    return Container(
                          margin: EdgeInsets.only(top: bottomT,bottom: bottomT),
                          color: coleur,
                          width: taille,
                          height: 1.8,
                        );
  }



  Widget BT_reaction(String nom, String profil, String date, String contenue){
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(top: 10),
        
           // color: Colors.red,
            width: double.infinity,
            height: 110,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //--------------------informstion du posteur
              Container(
                height: 100,
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //------------------------------Profil---------------------
                    Container(
                              height: _height*0.059,
                              width: _width*0.10,
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                color:const Color(0xff282B35),
                                image: const DecorationImage(image: AssetImage("assets/icons/DSC_5205.JPG"))
                              ),
                            ),


                    //-----------------------------nom----
                    Text(nom, style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),


              SizedBox(
               // height: 150,
                width: _width*0.7,
                child: ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                  alignment: Alignment.topLeft,
                  backGroundColor: Colors.blue.withOpacity(0.2),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 330,
                    ),
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            contenue,
                            style: const TextStyle(color: Colors.black),
                          ),
                              
                          //------------------heure de l'emission------------
                          Text(date)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
                        
        );
  }
}