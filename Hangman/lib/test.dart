import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
      home: new TestAPI(),
    ));

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
            itemCount: data == null ? 0 : 2,
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
                              builder: (context) => new TestPage()));
                    },
                  )
                ],
              )));
            }),
      ),
    );
  }
}

// ignore: must_be_immutable
class TestPage extends StatelessWidget {
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
                          "Finish",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new TestAPI()));
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
