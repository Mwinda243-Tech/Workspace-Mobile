import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';




class Fichier4 extends StatefulWidget {
 List<String> lienFil;
  Fichier4({super.key,
  required this.lienFil
  });

  @override
  State<Fichier4> createState() => _Fichier4State();
}

class _Fichier4State extends State<Fichier4> {
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            child: Text("${indexx+1}/${widget.lienFil.length}",
            style: const TextStyle(
              color: Colors.white
            ),
            ),
          ),

          Container(
            height: 210,
            width: 300,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  indexx = value;
                });
              },
              controller: PageController(viewportFraction: 0.9),
              itemCount: widget.lienFil.length,
              itemBuilder: ((context, index) => 
              Container(
              margin: const EdgeInsets.only(left: 6,right: 6),
              decoration:BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.lienFil[index]),
                  fit: BoxFit.cover
                  )
              ),
            )
            )),
          ),
        ],
      ),
    );
    
    
    
  }
}