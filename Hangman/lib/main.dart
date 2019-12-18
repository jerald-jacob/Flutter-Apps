import 'package:flutter/material.dart';
import 'package:hangman/screens/HomePage.dart';
import 'package:hangman/screens/login_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'one_player_page.dart';
import 'screens/words/get_words_list.dart';


main() {
  runApp(MaterialApp(
    home: MyApp1(),
  ));
}

class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      loaderColor: Colors.white,
      seconds: 7,
      navigateAfterSeconds: new GetWordsList(),
      title: new Text(
        'Tell me wow ',
        style: new TextStyle(
          fontSize: 40,
          fontFamily: 'IndieFlower',
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      image: new Image.asset('images/tellmewow.png'),
      backgroundColor: Color.fromARGB(237, 188, 59, 100),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
