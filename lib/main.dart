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
      title: 'وبلاگ',
      theme: ThemeData(
        primaryColor: Color(0XFF212845),
        scaffoldBackgroundColor: Color(0xFF2A364D),
        primarySwatch: Colors.yellow,
        buttonColor: Color(0XFFF8D320),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          buttonColor: Color(0xFF3D72FE),
          textTheme: ButtonTextTheme.normal,
          // minWidth: 150,
          height: 45,
          colorScheme: ColorScheme.light(),
        ),
      ),
      home: HomePage(),
    );
  }
}
