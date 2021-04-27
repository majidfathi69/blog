import 'package:captainwell_blog/models/post.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';

import 'post_body.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int _currentPage;
  final primary = Color(0xFF131A2A);
  Post thePost;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    thePost = context.watch<PostsModel>().getPost;
    return Scaffold(
      backgroundColor: Color(0xFF131A2A),
      body: thePost == null
          ? Center(
              child: LoadingBouncingGrid.square(
                borderColor: Colors.cyan,
                size: 30.0,
              ),
            )
          : Stack(
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
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 25,
                                right: 25,
                              ),
                              child: PostBody(thePost: thePost),
                            ),
                          ),
                        ),
                        _buildHeader(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: primary,
      ),
      child: Text(
        thePost.title,
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  const BottomNavItem(
      {Key key,
      this.isActive = false,
      this.icon,
      this.activeColor,
      this.inactiveColor,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
              height: 32,
              width: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xFF3D72FE),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF3A3550),
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                ),
              ),
            )
          : Container(
              height: 32,
              width: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xFFFFFFFF),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF3A3550),
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                ),
              ),
            ),
    );
  }
}
