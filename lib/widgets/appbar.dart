import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/profil/profile_page.dart';




class Appbar extends StatefulWidget {
  final String lieu;
  const Appbar({super.key, required this.lieu});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.backgroundColor,
      elevation: 10,
      leading: Container(
        margin: const EdgeInsets.all(15.0),
        child: widget.lieu =="presence" ?
        IconButton(icon: const Icon( Icons.arrow_back,color: Colors.white), 
        onPressed: (){
          Navigator.pop(context);
        })
        
        : PopupMenuButton(
            child: SvgPicture.asset("assets/menu.svg"),
            itemBuilder: (BuildContext context){
                                       return [
                                         PopupMenuItem(
                                           onTap: (){},
                                           child: Text("Actif")
                                           ),
                       
                                         PopupMenuItem(
                                           child: Text("Bloqué")
                                           ),
                                       ];
                                     }
            ),      
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your space",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Style.appWhite,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5)),

          const SizedBox(width: 5),

          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 3,
          )

        ],
      ),

      actions: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
          },
          child: CircleAvatar(
            backgroundColor: Style.backgroundColor2,
            child: SvgPicture.asset(
              "assets/user.svg",
              color: Style.appWhite,
            ),
          ),
        ),

        const SizedBox(width: 15)
      ],
    );
  }
}