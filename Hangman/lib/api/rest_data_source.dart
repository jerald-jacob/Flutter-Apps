import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hangman/dao/hm_words.dart';
import 'package:hangman/utils/network_util.dart';

class RestDataSource {
  NetworkUtil _networkUtil = new NetworkUtil();
  static final BASE_URL = "https://github.com/boennemann/animals/blob/master/words.json";

   // static final BASE_URL="https://www.randomlists.com/data/vocabulary-words.json";
  Future<HMWordsList> getWordsList() async {
//    EduPlusSharedPreference prefs = new EduPlusSharedPreference();
//    bool isAuthenticated = await prefs.getBool(PreferenceKey.IS_USER_LOGGED_IN);
//    if (!isAuthenticated) {
//      throw EduPlusError.unAuthorizeAccess;
//    }

    var params = Map<String, dynamic>();
//    params["type"] = 1; //required field : 1 => Diary, 2 => Homework
  //  params["limit"] = defaultLimit;
//    params["page"] = defaultPage;
   // params["sortOrder"] = "DESC";

    var headers = Map<String, String>();
    headers["Content-Type"] = "application/json";
    //String authToken = await prefs.getString(PreferenceKey.AUTH_TOKEN);
    //headers["authToken"] = authToken;

    Future<ParsedResponse> responseData =
        _networkUtil.get(BASE_URL,headers: headers);
    return responseData.then((ParsedResponse res) {
      print("Get Diary List Response :: " + res.toString());
      if (res.isOk()) {
        HMWordsList dataList = new HMWordsList(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
//        throw EduPlusError.unAuthorizeAccess;
//        if (globals.logout == false) {
//          globals.logout = true;
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => LogoutDialog()),
//          );
//        }
//      } else {
//        throw EduPlusError.serverError;
//      }
      }
    }).catchError((Object e) {
      throw e;
    });
  }
}
