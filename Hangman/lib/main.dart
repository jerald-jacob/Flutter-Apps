import 'package:flutter/material.dart';
import 'package:hangman/screens/HomePage.dart';
import 'package:splashscreen/splashscreen.dart';


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
      navigateAfterSeconds: new MainPage(),
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

