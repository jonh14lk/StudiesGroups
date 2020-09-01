import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Post> posts = [];

List<Post> parse(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

Future getPosts() async {
  posts.clear();
  final http.Response response = await http.get('http://localhost:3000/');
  String st = response.body;
  posts = parse(st);
}

class Post {
  String id, title, description, whatsapp;

  Post({this.id, this.title, this.description, this.whatsapp});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      whatsapp: json['whatsapp'] as String,
    );
  }
}
