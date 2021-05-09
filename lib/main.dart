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
        // primaryColor: Color(0XFF212845),
        scaffoldBackgroundColor: Color(0xFF2A364D),
        // buttonColor: Color(0XFFF8D320),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(),
            ),
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.white)),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontSize: 18,
              color: Colors.white,
            )),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              // StadiumBorder(),
              RoundedRectangleBorder(),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(14)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
