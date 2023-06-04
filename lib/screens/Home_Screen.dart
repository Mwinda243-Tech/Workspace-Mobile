import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/post/appbar.dart';
import 'package:wpmobile/screens/post/post-home.dart';
import 'package:wpmobile/screens/presence/presence_Screen.dart';
import 'package:wpmobile/screens/tache/tache_Screen.dart';



class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  List<Widget> bodyLister = [const Post_home(),const Presence_Screen(),const tache_screen()];
  int idBpdy = 0;
  List<BottomNavigationBarItem> items =[
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: "Taches"),

  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBar(context, "Your space"),

      body: bodyLister[idBpdy],

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barHeight: 60,
          barBackgroundColor: Style.backgroundColor,
          selectedItemBorderColor: Colors.blue,
          selectedItemBackgroundColor:Style.backgroundColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.blue,
        ),
        selectedIndex: idBpdy,
        onSelectTab: (index) {
          setState(() {
            idBpdy = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: 'presences',
          ),
          FFNavigationBarItem(
            iconData: Icons.calendar_month,
            label: 'Taches',
          ),
          /* FFNavigationBarItem(
            iconData: Icons.note,
            label: 'Notes',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
          ), */
        ],
      )
      
    );
    

  }
}

