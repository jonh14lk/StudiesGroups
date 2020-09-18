import 'dart:async';
import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> deletePost(String id) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, String> queryParameters = {
    'user': DotEnv().env['USER'],
    'password': DotEnv().env['PASSWORD'],
  };
  final response = await HttpUtils.getForString(
    'https://studiesgroups.herokuapp.com/',
    queryParameters: queryParameters,
    headers: headers,
  );
  final parsed = json.decode(response);
  if (parsed['message'] == "user not found") {
    return false;
  }
  return true;
}
