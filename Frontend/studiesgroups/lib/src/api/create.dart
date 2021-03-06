import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<int> createPost(String title, String des, String whatsapp) async {
  if (title.length >= 27) {
    return 0;
  }
  final http.Response response = await http.post(
    'https://studiesgroups.herokuapp.com/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user': DotEnv().env['USER'],
      'password': DotEnv().env['PASSWORD'],
      'title': title,
      'description': des,
      'whatsapp': whatsapp,
    }),
  );
  final parsed = json.decode(response.body);
  if (parsed['message'] == "error") {
    return 1;
  }
  return 2;
}
