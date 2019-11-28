import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/main.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot_and_share/screenshot_share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

List data;

String _userEmail = '';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = (prefs.getString('email') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("read value from sharepreference is:" + _userEmail),
    );
  }
}

class User extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(81, 23, 19, 5),
        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('images/maingif.gif'),
//            Text('HANGMAN',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    color: Colors.teal.shade50,
//                    fontSize: 40,
//                    fontWeight: FontWeight.bold)),
//            MaterialButton(
//                child: Text(
//                  'PLAY',
//                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                ),
//                textTheme: ButtonTextTheme.accent,
//                color: Colors.orange,
//                onPressed: () {
//                  Navigator.of(context).push(_createRoute());
//                }),
//            Card(
//              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//              color: Colors.white,
//              child: Padding(
//                padding: EdgeInsets.all(15),
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.email,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(width: 15.0),
//                    Text(
//                      'Jeraldjacob10@gmail.com',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Source Sans Pro',
//                          color: Colors.teal),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),
              Container(
                height: 100,
                color: Color.fromRGBO(90, 58, 29, 10),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/Hangman-Logo.png',
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 420,
                  //  color: Color.fromRGBO(76, 118, 45, 10),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/main-page.png'),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Padding(
//Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _textFieldController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Colors.white60),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      new MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        // textColor: Colors.re,
                        color: Colors.blue,

                        child: new Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Page1()));
                        },
                      ),
                    ],
                  )),
              Container(
                child: Card(
                  color: Color.fromRGBO(90, 58, 29, 10),
                ),
                height: 40,
                margin: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Game extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(81, 23, 19, 5),
        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('images/maingif.gif'),
//            Text('HANGMAN',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    color: Colors.teal.shade50,
//                    fontSize: 40,
//                    fontWeight: FontWeight.bold)),
//            MaterialButton(
//                child: Text(
//                  'PLAY',
//                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                ),
//                textTheme: ButtonTextTheme.accent,
//                color: Colors.orange,
//                onPressed: () {
//                  Navigator.of(context).push(_createRoute());
//                }),
//            Card(
//              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//              color: Colors.white,
//              child: Padding(
//                padding: EdgeInsets.all(15),
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.email,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(width: 15.0),
//                    Text(
//                      'Jeraldjacob10@gmail.com',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Source Sans Pro',
//                          color: Colors.teal),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),
              Container(
                height: 100,
                color: Color.fromRGBO(90, 58, 29, 10),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/Hangman-Logo.png',
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 420,
                  //  color: Color.fromRGBO(76, 118, 45, 10),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/hangman/one.png'),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Padding(
//Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _textFieldController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white60,
                                fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      new MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        // textColor: Colors.re,
                        color: Colors.blue,

                        child: new Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Next()));
                        },
                      ),
                    ],
                  )),
              Container(
                child: Card(
                  color: Color.fromRGBO(90, 58, 29, 10),
                ),
                height: 40,
                margin: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _currentUser;
  VideoPlayerController _controller;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('video/gamemusic.mp4')

//    VideoPlayerController.network(
//        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentUser = (prefs.getString('name') ?? '');
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentUser = myController.text;
    });
    prefs.setString('name', _currentUser);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(234, 182, 111, 88),
        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('images/maingif.gif'),
//            Text('HANGMAN',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    color: Colors.teal.shade50,
//                    fontSize: 40,
//                    fontWeight: FontWeight.bold)),
//            MaterialButton(
//                child: Text(
//                  'PLAY',
//                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                ),
//                textTheme: ButtonTextTheme.accent,
//                color: Colors.orange,
//                onPressed: () {
//                  Navigator.of(context).push(_createRoute());
//                }),
//            Card(
//              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//              color: Colors.white,
//              child: Padding(
//                padding: EdgeInsets.all(15),
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.email,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(width: 15.0),
//                    Text(
//                      'Jeraldjacob10@gmail.com',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Source Sans Pro',
//                          color: Colors.teal),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),

              Container(
                height: 50,
                color: Color.fromRGBO(234, 182, 111, 0),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/Hangman-Logo.png',
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 575,
                  color: Color.fromRGBO(34, 80, 41, 20),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 0,
                        height: 40,
                      ),
                      Text(
                        "ONE PLAYER",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Caesar_Dressing',
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
//                      Image.asset('images/hangman/one.png'),
//                      SizedBox(
//                        width: 20,
//                        height: 20,
//                      ),

                      Padding(
////Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.characters,
                          controller: myController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "WORD LIST",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Caesar_Dressing',
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "ANIMALS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "FOOD",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "DAYS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "HOLIDAYS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "SAT",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "MONTH",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
//                                    _incrementCounter();
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) => new Page2()));
                                  }),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                        child: Row(
                          children: <Widget>[
                            new MaterialButton(

                                // textColor: Colors.re,
                                color: Color.fromRGBO(34, 80, 41, 89),
                                child: new Text(
                                  "BACK",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Caesar_Dressing',
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                onPressed: () {
                                  _incrementCounter();
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new MainPage()));
                                }),
                            SizedBox(
                              width: 90,
                            ),
                            new MaterialButton(

                                // textColor: Colors.re,
                                color: Color.fromRGBO(34, 80, 41, 89),
                                child: new Text(
                                  "START",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Caesar_Dressing',
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                onPressed: () {
                                  _incrementCounter();
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SecondPage()));
                                })
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _currentUser = '';
  String _userInput = '';
  var _gameStatus = false;
  Set _guessedCharacters = new Set();
  Set _wrongGuessCharacters = new Set();
  String _imagePath = 'images/hangman/0.png';
  final String url = "https://www.randomlists.com/data/vocabulary-words.json";
  String _wordFromAPI;
  String _wordHint;
  var _currentScore;
  static var _score = 10;
  var _wrongGuess = true;
  var completed = true;

  var resultList = new List<String>();

  var _filler = '-';

  VideoPlayerController _controller;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _incrementCounter();
    _loadCounter();
    //_loadBlank();
    this.getJsonData();
    _controller = VideoPlayerController.asset('video/gamemusic.mp4')

//    VideoPlayerController.network(
//        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();

    //_controller.setLooping(true);
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this._currentUser = (prefs.getString('name') ?? '');
      _currentScore = (prefs.getInt('score') ?? '');
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _currentUser = myController.text;
    });
    // prefs.setString('name', _currentUser);
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var toJsonData = json.decode(response.body);
      data = toJsonData['data'];

      if (response.statusCode == 200) {
        Random rnd;
        int min = 0;
        int max = data.length;
        rnd = new Random();
        var r = min + rnd.nextInt(max - min);
        this._wordFromAPI = data[r]['name'];
        this._wordHint = data[r]['detail'];

        for (int i = 0; i < this._wordFromAPI.length; i++) {
          this.resultList.add(_filler);
        }
      } else {
        this._wordFromAPI = data[1]['name'];

        for (int i = 0; i < this._wordFromAPI.length; i++) {
          this.resultList.add(_filler);
        }
      }
    });

    return "Success";
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(122, 147, 116, 88),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 300,
                //color: Color.fromRGBO(122, 147, 116, 88),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  _imagePath,
                  width: 380,
                  height: 320,
                ),
              ),

              Container(
                height: 400,
                color: Color.fromRGBO(34, 80, 41, 20),
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Text(
                            "PLAYER " +
                                _currentUser +
                                "\n Hint : $_wordFromAPI",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ))),

//                    ),
//                      Image.asset('images/hangman/one.png'),
//                      SizedBox(
//                        width: 20,
//                        height: 20,
//                      ),

                    Padding(
////Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          " " + resultList.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Caesar_Dressing',
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )

//                      TextField(
//                        textCapitalization: TextCapitalization.characters,
//                        controller: myController,
//                        cursorColor: Colors.white,
//                        style: TextStyle(
//                          fontSize: 30,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                        ),
//                        decoration: InputDecoration(
////Add th Hint text here.
//
//                          hintText: "Enter your word",
//                          hintStyle: TextStyle(
//                              fontSize: 20.0,
//                              color: Colors.white,
//                              fontWeight: FontWeight.w300),
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(10.0),
//                          ),
//                        ),
//                      ),
                        ),

                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "Q",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('Q');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "W",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _incrementCounter();
                                    _guess('W');
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "E",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('e');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "R",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('R');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "T",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('t');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "Y",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('Y');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "U",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('U');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "I",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('I');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "O",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('O');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "P",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('P');
                                    _incrementCounter();
                                  }),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "A",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('a');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "S",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('S');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "D",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('D');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "F",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('F');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "G",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('G');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "H",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('H');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "J",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('J');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "K",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('K');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "L",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('L');
                                    _incrementCounter();
                                  }),
                            ),
                          ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "Z",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('Z');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "X",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('X');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "C",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('C');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "V",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('V');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "B",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('b');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "N",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('N');
                                    _incrementCounter();
                                  }),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                  splashColor: Colors.yellow,
                                  padding: const EdgeInsets.all(3.0),
                                  // textColor: Colors.re,
                                  color: Color.fromRGBO(34, 80, 41, 89),
                                  child: new Text(
                                    "M",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                    _guess('M');
                                    _incrementCounter();
                                  }),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                      child: Row(
                        children: <Widget>[
                          new MaterialButton(
                              // textColor: Colors.re,
                              color: Color.fromRGBO(34, 80, 41, 89),
                              child: new Text(
                                "BACK",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Caesar_Dressing',
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              onPressed: () {
                                _incrementCounter();
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new FirstPage()));
                              }),
                          SizedBox(
                            width: 90,
                          ),
                          new MaterialButton(
                              // textColor: Colors.re,
                              color: Color.fromRGBO(34, 80, 41, 89),
                              child: new Text(
                                "CHECK",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Caesar_Dressing',
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              onPressed: _wordFromAPICount),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

//              Container(
//                child: Text(
//                  "THE WORD YOU ENTERD IS " + _imagePath + " ",
//                  //   _wrongGuessCharacters.toString(),
//                  //_guessedCharacters.toString(),
//                  style: TextStyle(
//                    fontSize: 20,
//                    fontFamily: 'Caesar_Dressing',
//                    color: Colors.white,
//                    fontWeight: FontWeight.w300,
//                  ),
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }

  void _guess(c) {
    c = c.toLowerCase();
    for (int i = 0; i < _wordFromAPI.length; i++) {
      var _imagePathWord = _wordFromAPI[i];
      if (_wordFromAPI[i] == c) {
        _guessedCharacters.add(c);
        _wrongGuess = false;
        resultList[i] = c;
        _wrongGuessCharacters.remove(c);

//        _hangmanImage();
      } else {
        if (_wrongGuessCharacters.contains(_imagePathWord)) {
          _wrongGuessCharacters.remove(_imagePathWord);
        } else {
          _wrongGuessCharacters.add(c);
        }

        completed = false;
        // _hangmanImage();
      }
//      if (resultList[i] == _wrongGuessCharacters.elementAt(i)) {
//        _wrongGuessCharacters.remove(c);
//      }
      if (_wrongGuessCharacters.contains(_imagePathWord)) {
        _wrongGuessCharacters.remove(_imagePathWord);
      } else {}
      //_disp();
      _hangmanImage();
    }

    // _imagePath = _guessedCharacters.elementAt(0);
  }

  void _hangmanImage() {
    var _resultString = resultList.join("");

    if (_resultString == _wordFromAPI) {
      this._imagePath = 'images/hangman/win.jpg';

      _winTheGame();

      //_winTheGame();
    } else if (_wrongGuessCharacters.length == 1) {
      this._imagePath = 'images/hangman/1.png';
    } else if (_wrongGuessCharacters.length == 2) {
      this._imagePath = 'images/hangman/2.png';
    } else if (_wrongGuessCharacters.length == 3) {
      this._imagePath = 'images/hangman/3.png';
    } else if (_wrongGuessCharacters.length == 4) {
      this._imagePath = 'images/hangman/4.png';
    } else if (_wrongGuessCharacters.length == 5) {
      this._imagePath = 'images/hangman/5.png';
    } else if (_wrongGuessCharacters.length == 6) {
      this._imagePath = 'images/hangman/6.png';
    } else if (_wrongGuessCharacters.length == 7) {
      this._imagePath = 'images/hangman/7.png';
    } else if (_wrongGuessCharacters.length >= 8) {
      _lossTheGame();
    }
  }

  void _winTheGame() {
    _score += 10;
    _scoreBord(_score);
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
      title: "CONGRATULATIONS! $_currentUser \n"
          "YOU WIN \n"
          "Earned \n"
          "Points\n"
          "$_currentScore",

      image: Image.asset("images/sucess.jpeg"),
      buttons: [
        DialogButton(
          child: Text(
            "PLAY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage()));
          },
          width: 120,
        )
      ],
    ).show();

    Timer(Duration(seconds: 3), () {
      _screen();
    });
  }

  _scoreBord(_score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentUser = myController.text;
    });
    prefs.setInt('score', _score);
  }

  void _lossTheGame() {
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
      title: "OOPS YOU FAILED",
      desc: "word is " + _wordFromAPI,
      image: Image.asset("images/loss.jpeg"),
      buttons: [
        DialogButton(
          child: Text(
            "TRY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage()));
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "BACK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MainPage()));
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _wordFromAPICount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userInput = myController.text;
    });
    prefs.setString('userInput', _userInput);
  }

  void _screen() {
    ScreenshotShare.takeScreenshotAndShare();
  }

//  void _winTheGame()
//    {
//      Navigator.push(
//          context, new MaterialPageRoute(builder: (context) => new Page2()));
//    }

}

class Page1 extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(81, 23, 19, 5),
        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('images/maingif.gif'),
//            Text('HANGMAN',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    color: Colors.teal.shade50,
//                    fontSize: 40,
//                    fontWeight: FontWeight.bold)),
//            MaterialButton(
//                child: Text(
//                  'PLAY',
//                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                ),
//                textTheme: ButtonTextTheme.accent,
//                color: Colors.orange,
//                onPressed: () {
//                  Navigator.of(context).push(_createRoute());
//                }),
//            Card(
//              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//              color: Colors.white,
//              child: Padding(
//                padding: EdgeInsets.all(15),
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.email,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(width: 15.0),
//                    Text(
//                      'Jeraldjacob10@gmail.com',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Source Sans Pro',
//                          color: Colors.teal),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),
              Container(
                height: 100,
                color: Color.fromRGBO(90, 58, 29, 10),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/Hangman-Logo.png',
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 420,
                  //  color: Color.fromRGBO(76, 118, 45, 10),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/hangman/one.png'),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Padding(
//Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.green,
                          controller: _textFieldController,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      new MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        // textColor: Colors.re,
                        color: Colors.blue,

                        child: new Text(
                          "Go",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Page2()));
                        },
                      ),
                    ],
                  )),
              Container(
                child: Card(
                  color: Color.fromRGBO(90, 58, 29, 10),
                ),
                height: 40,
                margin: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  String _wordFromAPI;
  String _imagePath = '/hangman/1.png';

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(81, 123, 19, 2),
        body: SafeArea(
//            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.asset('images/maingif.gif'),
//            Text('HANGMAN',
//                style: TextStyle(
//                    fontFamily: 'Pacifico',
//                    color: Colors.teal.shade50,
//                    fontSize: 40,
//                    fontWeight: FontWeight.bold)),
//            MaterialButton(
//                child: Text(
//                  'PLAY',
//                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                ),
//                textTheme: ButtonTextTheme.accent,
//                color: Colors.orange,
//                onPressed: () {
//                  Navigator.of(context).push(_createRoute());
//                }),
//            Card(
//              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//              color: Colors.white,
//              child: Padding(
//                padding: EdgeInsets.all(15),
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.email,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(width: 15.0),
//                    Text(
//                      'Jeraldjacob10@gmail.com',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Source Sans Pro',
//                          color: Colors.teal),
//                    )
//                  ],
//                ),
//              ),
//            )
//          ],
//        ),
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),
              Container(
                height: 100,
                color: Color.fromRGBO(90, 58, 29, 10),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/Hangman-Logo.png',
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 420,
                  //  color: Color.fromRGBO(76, 118, 45, 10),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/hangman/seveen.png'),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Padding(
//Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: _textFieldController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name" +
                                (_wordFromAPI = data[1]['name']),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white60,
                                fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      new MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        // textColor: Colors.re,
                        color: Colors.blue,

                        child: new Text(
                          "Finish " + _wordFromAPI,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          _hangmanImage();
                        },
                      ),
                    ],
                  )),
              Container(
                child: Card(
                  color: Color.fromRGBO(90, 58, 29, 10),
                ),
                height: 40,
                margin: EdgeInsets.all(8.0),
              ),
              Container(
                height: 50,
                color: Color.fromRGBO(234, 182, 111, 0),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  _imagePath,
                  width: 295,
                  height: 280,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _hangmanImage() {
    var _resultString = _wordFromAPI;

    if (_resultString == _wordFromAPI) {
      this._imagePath = 'images/hangman/11.png';
    } else {
      this._imagePath = 'images/hangman/10.png';
    }
  }
}

class TestAPI extends StatefulWidget {
  @override
  TestAPIeState createState() => new TestAPIeState();
}

class TestAPIeState extends State<TestAPI> {
  final String url = "https://www.randomlists.com/data/vocabulary-words.json";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var toJsonData = json.decode(response.body);
      data = toJsonData['data'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GET API"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: data == null ? 0 : 1,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  child: new Center(
                      child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(data[index]['name']),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                  RaisedButton(
                    child: Text("hai"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SecondPage()));
                    },
                  )
                ],
              )));
            }),
      ),
    );
  }
}

class Test extends StatefulWidget {
  TextEditingController _textFieldController = TextEditingController();
  @override
  TestState createState() => new TestState();
}

class TestState extends State<Test> {
  final String url = "https://www.randomlists.com/data/vocabulary-words.json";

  String _imagePath = 'images/hangman/9.png';
  String _wordFromAPI = 'ssdjdsjdjs';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(81, 123, 19, 2),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              // Max Size
//              Container(
//                  height: 100,
//                  color: Color.fromRGBO(90, 58, 29, 10),
//                  margin: EdgeInsets.all(8.0),
//                  child: Image.asset(
//                    'images/maingif.gif',
//                    width: 300,
//                    height: 280,
//                  )),
              Container(
                height: 100,
                color: Color.fromRGBO(90, 58, 29, 10),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  _imagePath,
                  width: 295,
                  height: 280,
                ),
              ),

              Container(
                  height: 420,
                  //  color: Color.fromRGBO(76, 118, 45, 10),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/hangman/seveen.png'),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Padding(
//Add padding around textfield
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          //        controller: _textFieldController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                          decoration: InputDecoration(
//Add th Hint text here.

                            hintText: "Enter your name and address ",
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white60,
                                fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      new MaterialButton(
                        padding: const EdgeInsets.all(8.0),
                        // textColor: Colors.re,
                        color: Colors.blue,

                        child: new Text(
                          "Finish " + _wordFromAPI,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          _hangmanImage();
                        },
                      ),
                    ],
                  )),
              Container(
                child: Card(
                  color: Color.fromRGBO(90, 58, 29, 10),
                ),
                height: 40,
                margin: EdgeInsets.all(8.0),
              ),
              Container(
                height: 50,
                color: Color.fromRGBO(234, 182, 111, 0),
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  _imagePath,
                  width: 295,
                  height: 280,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _hangmanImage() {
    var _resultString = _wordFromAPI;

    if (_resultString != _wordFromAPI) {
      this._imagePath = 'images/hangman/1.png';
    } else {
      this._imagePath = 'images/hangman/10.png';
    }
  }
}
