import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> updatePost(
  String title,
  String des,
  String whatsapp,
  String id,
) async {
  final http.Response response = await http.patch(
    'http://localhost:3000/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
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
