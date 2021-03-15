import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_test/model/ComentModel.dart';
import 'package:flutter_rest_api_test/api/API.dart';


class ComentsPage extends StatefulWidget {
  @override
  _ComentsPageState createState() => _ComentsPageState();
}

class _ComentsPageState extends State<ComentsPage> {
  var _commentList = new List<ComentModel>();

  _getAllComments() {

    API.getComments().then((response)
    {
      setState(() {
        Iterable list = json.decode(response.body);
        _commentList = list.map((e) => ComentModel.fromJson(e)).toList();
      });
    });
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
          title: Text("comments List"),
        ),
        body: ListView.builder(
          itemCount: _commentList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(_commentList[index].email),
              subtitle: Text(_commentList[index].body),

              onTap:() {
                Navigator.pop(context);
              },
            );
          },
        ));
  }
}
