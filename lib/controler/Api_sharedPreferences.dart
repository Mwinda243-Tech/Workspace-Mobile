import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/material.dart';

  SharedPreferences? sharedPreferences;
  initshare() async {
  // appelle cette methode au debut de la methode main
  sharedPreferences = await SharedPreferences.getInstance();
}


shareset(key, value) {
  sharedPreferences!.setString(key, value);
}


shareget(key) {
  return sharedPreferences!.getString(key);
}

shareclear(key) async {
    await sharedPreferences!.remove(key);
}