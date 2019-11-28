import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote of the Day'),
        ),
        body: Center(
          child: FutureBuilder<Quote>(
            future:
                getQuote(), //sets the getQuote method as the expected Future
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //checks if the response returns valid data
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data.quote), //displays the quote
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          " - ${snapshot.data.author}"), //displays the quote's author
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                //checks if the response throws an error
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<Quote> getQuote() async {
    String url = 'https://www.randomlists.com/data/vocabulary-words.json';

    final response =
        await http.get(url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class Quote {
  final String author;
  final String quote;

  Quote({this.author, this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        author: json['data'][0]['name'], quote: json['data'][1]['name']);
  }
}

class ApiPage extends StatefulWidget {
  @override
  ApiPageState createState() => new ApiPageState();
}

class ApiPageState extends State<ApiPage> {
  @override
  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            "https://www.randomlists.com/data/vocabulary-words.json"),
        headers: {"Accept": "applications/json"});
    List data = json.decode(response.body);
    print(data[1]["name"]);
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
