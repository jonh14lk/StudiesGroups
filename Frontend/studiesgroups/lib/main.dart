import 'package:flutter/material.dart';
import 'src/api/listall.dart';
import 'src/screens/allposts.dart';
import 'src/screens/createpost.dart';

void main() async {
  await getPosts();
  construct();
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/add': (context) => Add(),
  }));
}
