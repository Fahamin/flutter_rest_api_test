import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_test/api/NewsApi.dart';
import 'package:flutter_rest_api_test/model/Articles.dart';
import 'package:flutter_rest_api_test/api/API.dart';

import 'file:///E:/test/flutter_rest_api_test/flutter_rest_api_test/lib/ui/NewsTile.dart';

class NewsDetails extends StatefulWidget {
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  var _commentList = new List<Articles>();

  _getAllComments() async {
    NewsApi api = new NewsApi();

    await api.getNews();

    _commentList = api.list;

    setState(() {
      _commentList = api.list;
    });

    for (int i = 0; i < _commentList.length; i++) {
      print(_commentList[i].author);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllComments();

    dispose() {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News List"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: ListView.builder(
            itemCount: _commentList.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsTile(
                imgUrl: _commentList[index].urlToImage ?? "",
                title: _commentList[index].title ?? "",
                desc: _commentList[index].description ?? "",
                content: _commentList[index].content ?? "",
                posturl: _commentList[index].url ?? "",
              );
            }),
      ),
    );
  }
}



/*
ListView.builder(
itemCount: _commentList.length,
itemBuilder: (context, index) {
return ListTile(
leading: Icon(Icons.ac_unit),
title: Text(_commentList[index].title),
subtitle: Text(_commentList[index].author),
onTap: () {
Navigator.pop(context);
},
);
},
));*/
