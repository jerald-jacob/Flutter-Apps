import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class NetworkUtil {
  // Creating singleton object.
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<ParsedResponse> get(String url, {Map headers, Map params}) {
    url += encodeUrl(params);

    print("URL : $url Headers $headers");

    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print("Status code for " + url + "::: " + statusCode.toString());
      print("Response ::: " + res);

      if (res == null || res.isEmpty) {
       // throw EduPlusError.serverError;
      } else {
        return new ParsedResponse(statusCode, res);
      }
    }).catchError((Object e) {
      //TODO : Confirm network status
   //   throw EduPlusError.noInternet;
    });
  }

  Future<ParsedResponse> post(String url, {Map headers, body, encoding}) {
    return http.post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print("Status code for " + url + "::: " + statusCode.toString());
      print("Response ::: " + res);

      if (res == null || res.isEmpty) {
     //   throw EduPlusError.serverError;
      } else {
        return new ParsedResponse(statusCode, res);
      }
    }).catchError((Object e) {
      //TODO : Confirm network status
    //  throw EduPlusError.noInternet;
    });
  }

  Future<ParsedResponse> put(String url, {Map headers, body, encoding}) {
    return http.put(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print("Status code for " + url + "::: " + statusCode.toString());
      print("Response ::: " + res);

      if (res.isEmpty) {
        //throw EduPlusError.serverError;
      } else {
        // TODO : Handle common error codes here...
        return new ParsedResponse(statusCode, res);
      }
    }).catchError((Object e) {
      //TODO : Confirm network status
   //   throw EduPlusError.noInternet;
    });
  }

  Future<ParsedResponse> delete(String url, {Map headers, Map params}) {
    url += encodeUrl(params);
    return http.delete(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print("Status code for " + url + "::: " + statusCode.toString());
      print("Response ::: " + res);

      if (res.isEmpty) {
      //  throw EduPlusError.serverError;
      } else {
        // TODO : Handle common error codes here...
        return new ParsedResponse(statusCode, res);
      }
    }).catchError((Object e) {
      //TODO : Confirm network status
   //   throw EduPlusError.noInternet;
    });
  }

  String encodeUrl(Map<String, dynamic> parameters) {
    if (parameters == null) {
      return "";
    }

    String paramsString = "";
    bool first = true;

    for (String key in parameters.keys) {
      if (first) {
        first = false;
        paramsString += "?";
      } else {
        paramsString += "&";
      }
      paramsString += key + "=" + parameters[key].toString();
    }
    return paramsString;
  }
}
class ParsedResponse {
  int statusCode;
  String response;

  ParsedResponse(this.statusCode, this.response);

  bool isOk() {
    return statusCode == 200;
  }
}