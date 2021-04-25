import 'package:flutter/material.dart';

class NewComment extends StatefulWidget {
  @override
  _NewCommentState createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A364D),
      appBar: AppBar(
        title: Text("ثبت نظر"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "متن نظر:",
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color(0XFFAABBD0),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(height: 2.0, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF323e54),
                          hintText: "متن نظر خود را وارد کنید.",
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
                          "ثبت",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {},
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
                          "انصراف",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
