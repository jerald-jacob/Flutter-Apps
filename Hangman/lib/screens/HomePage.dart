import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman/screens/sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Next.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        backgroundColor: Color.fromRGBO(34, 80, 41, 55),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(

                color: Color.fromRGBO(34, 80, 41, 55),

                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[


                    Image.asset(
                    'images/Hangman-Logo.png',
                   // height: 280,
                  ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(85, 15, 30, 10),
                        child: Text(
                          "Can you guess the word?",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Caesar_Dressing',
                            color: Colors.yellow.withOpacity(.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white.withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        color: Color.fromRGBO(34, 80, 41, 20),
                        margin: EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 0,
                                height: 80,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  //   decoration: const BoxDecoration(
                                  color: Color.fromRGBO(16, 50, 33, 20),
//                            gradient: LinearGradient(
//                              colors: <Color>[
//                                Color(0xFF0D47A1),
//                                Color(0xFF1976D2),
//                                Color(0xFF42A5F5),
//                              ],
//                            ),
                                  //   ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'ONE PLAYER',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  //   decoration: const BoxDecoration(
                                  color: Color.fromRGBO(16, 50, 33, 20),
//                            gradient: LinearGradient(
//                              colors: <Color>[
//                                Color(0xFF0D47A1),
//                                Color(0xFF1976D2),
//                                Color(0xFF42A5F5),
//                              ],
//                            ),
                                  //   ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'TWO PLAYER',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  _gameOptions();
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  //   decoration: const BoxDecoration(
                                  color: Color.fromRGBO(16, 50, 33, 20),
//                            gradient: LinearGradient(
//                              colors: <Color>[
//                                Color(0xFF0D47A1),
//                                Color(0xFF1976D2),
//                                Color(0xFF42A5F5),
//                              ],
//                            ),
                                  //   ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'OPTIONS',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  _aboutGame();
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  //   decoration: const BoxDecoration(
                                  color: Color.fromRGBO(16, 50, 33, 20),
//                            gradient: LinearGradient(
//                              colors: <Color>[
//                                Color(0xFF0D47A1),
//                                Color(0xFF1976D2),
//                                Color(0xFF42A5F5),
//                              ],
//                            ),
                                  //   ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text(
                                    'ABOUT GAME',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      //
                                      // fontWeight: FontWeight.,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                )

              ),
            ],
          ),
        ),
      ),
    );
  }

  void _aboutGame() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.error,
      title: "Hangman",
      desc:
      """⚡ Hangman Game is based on the popular word guessing game Hangman. 
          The player guesses letters in order to uncover the hidden word. But be careful,
           you only have a few guesses before you're hanged!""",
      image: Image.asset("images/icon.jpeg"),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MainPage()));
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        )
      ],
    ).show();
  }

  void _gameOptions() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.error,
      title: "Difficulty",

      image: Image.asset("images/icon.jpeg"),

      buttons: [
        DialogButton(
          child: Text(
            "EASY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new FirstPage()));
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "HARD",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new FirstPage()));
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FirstPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
