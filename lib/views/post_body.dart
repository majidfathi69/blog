import 'package:captainwell_blog/models/post.dart';
import 'package:flutter/material.dart';

import 'new_comment.dart';

class PostBody extends StatefulWidget {
  final Post thePost;

  const PostBody({Key key, this.thePost}) : super(key: key);
  @override
  _PostBodyState createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  final primary = Color(0xFF131A2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131A2A),
      body: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 10),
              child: Container(
                width: 250,
                height: 250,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/${widget.thePost.id % 6}.jpg'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "The cheetah (Acinonyx jubatus) is a large cat native to Africa and central Iran.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 20, 28, 20),
              child: ElevatedButton(
                child: Text("Comment"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => NewComment(),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
