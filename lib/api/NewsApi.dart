import 'dart:async';
import 'dart:convert';
import 'package:flutter_rest_api_test/model/Articles.dart';
import 'package:http/http.dart' as http;

const baseUrl =
    "http://newsapi.org/v2/everything?q=tesla&from=2021-02-15&sortBy=publishedAt&apiKey=aa7bbd8a98e643ebb3b26ffa7598171a";

class NewsApi {
  List<Articles> list = [];

  Future<void> getNews() async {
    var rrsponse = await http.get(baseUrl);
    var jsonData = jsonDecode(rrsponse.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["author"] != null && element["url"] != null) {
          Articles articles = Articles(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']).toString(),
            content: element["content"],
          );
          list.add(articles);
        }
      });
    }
  }


}
