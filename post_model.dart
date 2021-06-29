import 'package:flutter/foundation.dart';

class Post {
/* final int userId;*/
  final int id;
  final String title;
  final String details;
  final String author;

  Post({
    /*   @required this.userId = 0,*/
    @required this.id = 0,
    @required this.title = "",
    @required this.details = "",
    @required this.author = "",
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      /* userId: json['userId'] as int,*/
      id: json['id'] as int,
      title: json['title'] as String,
      details: json['details'] as String,
      author: json['author'] as String,
    );
  }
}
