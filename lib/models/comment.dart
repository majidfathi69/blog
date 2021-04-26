import 'package:flutter/material.dart';

@immutable
class Comment {
  final int id;
  final int postId;
  final String body;
  final DateTime createdAt;
  final String user;

  Comment(
      {@required this.id,
      @required this.postId,
      @required this.body,
      @required this.createdAt,
      @required this.user});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Comment && other.id == id;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: int.parse(json['id']),
      postId: int.parse(json['postId']),
      body: json['body'],
      createdAt: DateTime.parse(json['createdAt']),
      user: json['user'],
    );
  }
}
