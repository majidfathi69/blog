import 'package:captainwell_blog/models/post.dart';
import 'package:captainwell_blog/views/post_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A364D),
      appBar: AppBar(
        title: Text("New Post"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Title:",
                        style: TextStyle(
                            fontSize: 18, color: const Color(0XFFAABBD0)),
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      child: TextField(
                        controller: _title,
                        textAlign: TextAlign.right,
                        style: TextStyle(height: 2.0, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF323e54),
                          hintText: "Please enter your title.",
                          hintStyle: TextStyle(
                            color: const Color(0XFF8492AA),
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              borderSide: BorderSide(color: Colors.teal)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              borderSide: const BorderSide(
                                  color: const Color(0xFF323e54), width: 0.0)),
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Content:",
                        style: TextStyle(
                            fontSize: 18, color: const Color(0XFFAABBD0)),
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      child: TextField(
                        controller: _content,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.right,
                        style: TextStyle(height: 2.0, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF323e54),
                          hintText: "Please enter your content.",
                          hintStyle: TextStyle(
                            color: const Color(0XFF8492AA),
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              borderSide: BorderSide(color: Colors.teal)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              borderSide: const BorderSide(
                                  color: const Color(0xFF323e54), width: 0.0)),
                          contentPadding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 20, 28, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 71,
                      width: 151,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          color: Color(0xFF3D72FE)),
                      child: FlatButton(
                        child: Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          context
                              .read<PostsModel>()
                              .addPost(_title.text, _content.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => PostPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 71,
                      width: 151,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          color: Color(0xFF434A58)),
                      child: FlatButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
