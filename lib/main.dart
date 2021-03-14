import 'dart:convert';
import 'package:flutter_rest_api_test/Post.dart';
import 'package:flutter_rest_api_test/API.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var Posts = new List<Post>();

  _getPosts() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        Posts = list.map((model) => Post.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getPosts();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post List"),
        ),
        body: ListView.builder(
          itemCount: Posts.length,
          itemBuilder: (context, index) {
            return ListTile(

                title: Text(Posts[index].title)

            );
          },
        ));
  }
}