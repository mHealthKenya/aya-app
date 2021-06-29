import 'package:aya_mobile/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isLoggedIn = true;

  MyAppState() {
    MySharedPreferences.instance
        .getBooleanValue("isfirstRun")
        .then((value) => setState(() {
      isLoggedIn = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //if true return intro screen for first time Else go to login Screen
        home: isLoggedIn ? LoginPage() : OnBoardingPage());
  }
}


class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
  MySharedPreferences._privateConstructor();
  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
}