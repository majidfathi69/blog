import 'package:captainwell_blog/models/post.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'new_post.dart';
import 'post_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final primary = Color(0xFF131A2A);
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
  }

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
                    decoration: BoxDecoration(
                      color: primary,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 155,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: SwitchListTile(
                                    title: const Text(
                                      "Offline",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: _showFab,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          _showFab = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Blog",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 71,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF3D72FE)),
                      child: FlatButton(
                        child: Text(
                          "Prev",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          context.read<PostsModel>().prevPage();
                        },
                      ),
                    ),
                    Container(
                      height: 71,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF3D72FE)),
                      child: FlatButton(
                        child: Text(
                          "New Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => NewPost());
                        },
                      ),
                    ),
                    Container(
                      height: 71,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xFF3D72FE)),
                      child: FlatButton(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          context.read<PostsModel>().nexPage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(BuildContext context) {
    String content = "Part of the text is displayed in this section.";
    List<Widget> postsWidget = context
        .watch<PostsModel>()
        .getPosts
        .map(
          (p) => Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (_showFab)
                    context.read<PostsModel>().fetchPostByIdOfflineMode(p.id);
                  else
                    context.read<PostsModel>().fetchPostById(p.id);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PostPage(),
                    ),
                  );
                },
                //onDoubleTap: , view image
                child: Container(
                  child: _buildPost('assets/images/${p.id % 6}.jpg', p.title,
                      content, Color(0XFF2A364D), context),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        )
        .toList();
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: postsWidget.length != 0
          ? postsWidget
          : [
              Center(
                child: LoadingBouncingGrid.square(
                  borderColor: Colors.cyan,
                  size: 30.0,
                ),
              ),
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
