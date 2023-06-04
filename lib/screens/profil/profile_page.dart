import 'package:flutter/material.dart';
import 'package:wpmobile/controler/style.dart';
import 'package:wpmobile/screens/post/appbar.dart';
import 'package:wpmobile/models/user.dart';
import 'package:wpmobile/controler/user_preferences.dart';
import 'package:wpmobile/screens/profil/widget/button_widget.dart';
import 'package:wpmobile/screens/profil/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Style.backgroundColor,
      appBar: appBar(context,"presence"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [

          //----------------------//profil------------------
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),


          const SizedBox(height: 24),
          buildName(user),    //-----------------------------nom
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            //user.nom,
            "Ben kalombo",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            //user.email,
            "mukena@mwinda243.tech.com",
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Modifier Profil',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Text(
              //user.about,
              "Je suis passionné par l’informatique et je passe la majorité de mon temps à développer des solutions pour différent secteurs notamment dans le secteur de l’éducation. Je suis actif dans le développement des projets open source pour l'avancement de certains langage des programmations et le développement des nouveaux framework.",
              style: const TextStyle(fontSize: 16, height: 1.4,color: Colors.white),
            ),

            const SizedBox(height: 40),
          ],
        ),
      );
}
