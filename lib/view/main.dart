import 'dart:convert';
import 'file:///E:/test/flutter_rest_api_test/flutter_rest_api_test/lib/model/Post.dart';
import 'package:flutter/material.dart';
import 'CommentsPage.dart';
import 'package:flutter_rest_api_test/api/API.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post Data ',
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post List"),
        ),
        body: ListView.builder(
          itemCount: Posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(Posts[index].title),
              subtitle: Text(Posts[index].body),

              onTap:() {
                Route route = MaterialPageRoute(builder: (context) => ComentsPage());
                Navigator.push(context, route);
              },
            );
          },
        ));
  }
}


