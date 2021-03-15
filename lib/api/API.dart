import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/posts";
    return http.get(url);
  }

  static Future getComments() {
    var url = baseUrl + "/comments";
    return http.get(url);
  }
}
