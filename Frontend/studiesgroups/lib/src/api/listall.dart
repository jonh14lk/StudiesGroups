import 'dart:async';
import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<Post> posts = [];

void sortPostsBydate() {
  posts.sort((a, b) {
    for (var i = 0; i < 5; i++) {
      if (a.dateInformation[i] != b.dateInformation[i]) {
        return b.dateInformation[i].compareTo(a.dateInformation[i]);
      }
    }
    return b.dateInformation[5].compareTo(a.dateInformation[5]);
  });
}

List<Post> parse(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future getPosts() async {
  posts.clear();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, dynamic> queryParameters = {
    'user': DotEnv().env['USER'],
    'password': DotEnv().env['PASSWORD'],
  };
  final response = await HttpUtils.getForString(
    'https://studiesgroups.herokuapp.com/',
    queryParameters: queryParameters,
    headers: headers,
  );
  print(response);
  posts = parse(response);
  sortPostsBydate();
}

class Post {
  String id, date, title, description, whatsapp;
  List<int> dateInformation;

  Post({
    this.id,
    this.date,
    this.title,
    this.description,
    this.whatsapp,
    this.dateInformation,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    Post ret = Post(
      id: json['_id'] as String,
      date: json['date'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      whatsapp: json['whatsapp'] as String,
      dateInformation: [],
    );
    int left = 0, right = 4;
    while (right <= 19) {
      ret.dateInformation.add(int.parse(ret.date.substring(left, right)));
      left = right + 1;
      right = left + 2;
    }
    return ret;
  }
}
