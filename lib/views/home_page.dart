import 'package:flutter/material.dart';
import 'new_post.dart';
import 'post_page.dart';

class HomePage extends StatelessWidget {
  final primary = Color(0xFF131A2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131A2A),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 105),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: buildList(context),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                    ),
                    child: Text(
                      "وبلاگ کاپیتان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Container(
                height: 71,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xFF3D72FE)),
                child: FlatButton(
                  child: Text(
                    "مطلب جدید",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: NewPost()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(BuildContext context) {
    String content = "قسمتی از متن مطلب در این قسمت نمایش داده می‌شود";
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Barcelona.jpg', "عنوان مطلب جدید",
                content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Californie.jpg', "عنوان مطلب جدید",
                content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Manchots.jpg', "عنوان مطلب جدید",
                content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Mississipi.jpg', "عنوان مطلب جدید",
                content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Mobula.jpg', "عنوان مطلب جدید",
                content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: PostPage(),
                    )));
          },
          //onDoubleTap: , view image
          child: Container(
            child: _buildPost('assets/images/Tegallalang.jpg',
                "عنوان مطلب جدید", content, Color(0XFF2A364D), context),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Stack _buildPost(String image, String title, String content, Color color,
      BuildContext context) {
    Color color = Color(0XFF2A364D);
    return Stack(
      children: <Widget>[
        Container(
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            content,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
