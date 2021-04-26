import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'comment.dart';

class PostsModel extends ChangeNotifier {
  /// Internal, private state of the cart. Stores the ids of each item.
  List<Post> _posts = [];
  Post _post;
  int page = 1;

  /// The current catalog. Used to construct items from numeric ids.
  List<Post> get getPosts => _posts;
  Post get getPost => _post;

  void prevPage() async {
    page = page > 1 ? page - 1 : page;
    fetchPosts();
  }

  void nexPage() async {
    page = page + 1;
    fetchPosts();
  }

  /// The current total price of all items.
  int get postsCount => _posts.length;

  void addComment(int postId, String user, String body) async {
    var queryParameters = {'user': user, 'body': body};
    final response = await http.post(
      Uri.https('607a9689bd56a60017ba2d1f.mockapi.io',
          'api/v1/post/$postId/comment', queryParameters),
    );

    if (response.statusCode == 200) {
      _post = Post.fromJson(jsonDecode(response.body)[1]);
      notifyListeners();
    } else {
      throw Exception('Failed!');
    }
    notifyListeners();
  }

  void addPost(String title, String content) async {
    var queryParameters = {'title': title, 'content': content};
    final response = await http.post(
      Uri.https('607a9689bd56a60017ba2d1f.mockapi.io', 'api/v1/post',
          queryParameters),
    );

    if (response.statusCode == 200) {
      Comment.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed!');
    }
    notifyListeners();
  }

  void fetchPostById(int id) async {
    var queryParameters = {'id': id.toString()};
    final response = await http.get(
      Uri.https('607a9689bd56a60017ba2d1f.mockapi.io', 'api/v1/post',
          queryParameters),
    );

    if (response.statusCode == 200) {
      _post = Post.fromJson(jsonDecode(response.body)[0]);
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void fetchPosts() async {
    var queryParameters = {
      'page': page.toString(),
      'limit': '10',
    };
    final response = await http.get(
      Uri.https('607a9689bd56a60017ba2d1f.mockapi.io', 'api/v1/post',
          queryParameters),
    );

    if (response.statusCode == 200) {
      _posts = (jsonDecode(response.body) as List)
          .map((i) => Post.fromJson(i))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

@immutable
class Post {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final int views;
  final List<Comment> comments;
  final bool published;

  Post(
      {@required this.id,
      @required this.title,
      @required this.content,
      @required this.createdAt,
      @required this.views,
      this.comments,
      @required this.published});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Post && other.id == id;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: int.parse(json['id']),
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      views: json['views'],
      published: json['published'],
      comments: json.containsKey("comments")
          ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
          : null,
    );
  }
}
