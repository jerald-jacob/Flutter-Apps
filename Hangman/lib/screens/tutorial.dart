import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/screens/HomePage.dart';
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
        backgroundColor: Color.fromRGBO(34, 80, 41, 20),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                color: Color.fromRGBO(34, 80, 41, 20),
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
                                    "HOLIDAYS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                  }),
                            ),
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
                                    "ANIMALS",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Caesar_Dressing',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onPressed: () {
                                  }),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                          ]),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: new MaterialButton(

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
                          ),
                          Expanded(
                              child: new MaterialButton(

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
                                            new Tutorial()));
                                  }))
                        ],
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

class Tutorial extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<Tutorial> {
  String _currentUser = '';
  String _userInput = '';
  var _gameStatus = false;
  Set _guessedCharacters = new Set();
  Set _wrongGuessCharacters = new Set();
  String _imagePath = 'images/hangman/0hangman.png';
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

  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    super.initState();

    this.getJsonData();
    _incrementCounter();
    _loadCounter();
    //_loadBlank();
//    _controller = VideoPlayerController.asset('video/gamemusic.mp4')
//
////    VideoPlayerController.network(
////        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
//    _controller.play();

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
        isLoading = false;
        Random rnd;
        int min = 0;
        int max = data.length!=0?data.length:1;
        rnd = new Random();
        var r = min + rnd.nextInt(max - min);
        this._wordFromAPI = data[r]['name'];
        this._wordHint = data[r]['detail'];

        for (int i = 0; i < this._wordFromAPI.length; i++) {
          this.resultList.add(_filler);
        }
      } else {
        this._wordFromAPI = data[1]['name'];
        this._wordHint = data[1]['detail'];
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
          child: isLoading
              ?_indicator:

          new ListView.builder
            (
              itemCount:data.length,
              itemBuilder: (BuildContext txt, int index) {
                return new Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey[300],
                          child: ListTile(
//                          leading: snapshot.data["definitions"][index]["image_url"] == null
//                              ? null
//                              : CircleAvatar(
//                            backgroundImage: NetworkImage(snapshot.data["definitions"][index]["image_url"]),
//                          ),
                            title: Text(data[index]['name']),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index]['detail']),
                      )

//
//                      Text(data[index]['name']),
//                      Text(data[index]['detail']),
                    ],
                  ),
                );
              }
          )
        ),
      ),
    );

  }

  var _indicator=
  Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.cyan,
//  strokeWidth: 5,
    )
  );


}


