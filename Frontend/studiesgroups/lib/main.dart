import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'src/api/listall.dart';
import 'src/screens/allposts.dart';
import 'src/screens/updatepost.dart';
import 'src/screens/connectionfailed.dart';
import 'src/screens/post.dart';
import 'src/Navigation/nav.dart';

bool can = true;

void main() async {
  await http.get('https://studiesgroups.herokuapp.com/').timeout(
    Duration(seconds: 5),
    onTimeout: () {
      can = false;
      return;
    },
  );
  if (can == false) {
    runApp(MaterialApp(
      initialRoute: '/failscreen',
      routes: {
        '/': (context) => Nav(),
        '/updatedata': (context) => UpdateData(),
        '/failscreen': (context) => FailScreen(),
        '/showpost': (context) => ShowPost(),
      },
    ));
  } else {
    await getPosts();
    construct();
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Nav(),
        '/updatedata': (context) => UpdateData(),
        '/failscreen': (context) => FailScreen(),
        '/showpost': (context) => ShowPost(),
      },
    ));
  }
}
