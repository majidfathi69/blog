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
                      "The cheetah (Acinonyx jubatus) is a large cat native to Africa and central Iran. It is the fastest land animal, estimated to be capable of running at 80 to 128 km/h (50 to 80 mph) with the fastest reliably recorded speeds being 93 and 98 km/h (58 and 61 mph), and as such has several adaptations for speed, including a light build, long thin legs and a long tail. It typically reaches 67–94 cm (26–37 in) at the shoulder, and the head-and-body length is between 1.1 and 1.5 m (3.6 and 4.9 ft). Adults weigh between 20 and 65 kg (44 and 143 lb). Its head is small, rounded, and has a short snout and black tear-like facial streaks. The coat is typically tawny to creamy white or pale buff and is mostly covered with evenly spaced, solid black spots. Four subspecies are recognised.",
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
              child: Container(
                height: 71,
                width: 319,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    color: Color(0xFF3D72FE)),
                child: TextButton(
                  child: Text(
                    "Comment",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => NewComment(),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
