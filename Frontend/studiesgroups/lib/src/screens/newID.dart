import 'package:flutter/material.dart';
import '../api/listall.dart';
import 'allposts.dart';

showID(BuildContext context) {
  AlertDialog popup = AlertDialog(
    backgroundColor: Color(0xFF2d3447),
    title: Text(
      "ID do seu post:",
      style: TextStyle(
        color: Colors.teal,
      ),
    ),
    content: SelectableText(
      posts[posts.length - 1].id,
      style: TextStyle(
        color: Colors.teal,
      ),
    ),
    actions: [
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          construct();
          Navigator.pushNamed(context, '/');
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return popup;
    },
  );
}
