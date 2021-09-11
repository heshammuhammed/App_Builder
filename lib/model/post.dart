import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
}
