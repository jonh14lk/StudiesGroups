import 'package:flutter/material.dart';
import 'src/api/listall.dart';
import 'src/screens/allposts.dart';
import 'src/screens/createpost.dart';
import 'src/screens/deletepost.dart';
import 'src/Navigation/nav.dart';

void main() async {
  await getPosts();
  construct();
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => App(),
    '/home': (context) => Home(),
    '/add': (context) => Add(),
    '/delete': (context) => Delete(),
  }));
}
