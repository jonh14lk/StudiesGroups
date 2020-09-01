import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> findPost(String id) async {
  final http.Response response = await http.get('http://localhost:3000/$id');
  final parsed = json.decode(response.body);
  if (parsed['message'] == "user not found") {
    return false;
  }
  return true;
}
