import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> deletePost(String id) async {
  final http.Response response = await http.delete(
    'http://localhost:3000/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  final parsed = json.decode(response.body);
  print(parsed['message']);
  if (parsed['message'] == "user not found") {
    return false;
  }
  return true;
}
