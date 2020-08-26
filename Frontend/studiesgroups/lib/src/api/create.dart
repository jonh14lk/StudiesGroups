import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> createPost(String title, String des, String whatsapp) {
  return http.post(
    'http://localhost:3000', // localhost:3000
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'description': des,
      'whatsapp': whatsapp,
    }),
  );
}
