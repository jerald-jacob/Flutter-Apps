import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _languages = <String>['de', 'en', 'es', 'fr', 'it', 'nl', 'pt'];

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
        actions: <Widget>[
          FutureBuilder<String>(
              // get the languageCode, saved in the preferences
              future: SharedPreferencesHelper.getLanguageCode(),
              initialData: 'en',
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return snapshot.hasData
                    ? _buildFlag(snapshot.data)
                    : Container();
              }),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _languages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: _buildFlag(_languages[index]),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () async {
                  // Save the user preference
                  await SharedPreferencesHelper.setLanguageCode(
                      _languages[index]);
                  // Refresh
                  setState(() {});
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // Returns the flag that corresponds to the languageCode
  // Flags are assets, added to the application
  Widget _buildFlag(String languageCode) {
    final double width = 32.0;
    return Image.asset(
      'images/flag-$languageCode.png',
      width: width,
      height: width,
    );
  }
}

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kLanguageCode = "language";

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLanguageCode) ?? 'en';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLanguageCode, value);
  }
}
