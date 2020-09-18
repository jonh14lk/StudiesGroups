import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> updatePost(
  String title,
  String des,
  String whatsapp,
  String id,
) async {
  final http.Response response = await http.patch(
    'https://studiesgroups.herokuapp.com/$id',
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
  if (parsed['message'] == "user not found") {
    return false;
  }
  return true;
}
