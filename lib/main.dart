import 'package:captainwell_blog/models/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostsModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<PostsModel>().fetchPosts();
    return MaterialApp(
      title: 'وبلاگ کاپیتان',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
