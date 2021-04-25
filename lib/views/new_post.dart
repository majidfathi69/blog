import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A364D),
      appBar: AppBar(
        title: Text("ارسال مطلب جدید"),
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
                        "عنوان:",
                        style: TextStyle(
                            fontSize: 18, color: const Color(0XFFAABBD0)),
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      child: TextField(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(height: 2.0, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF323e54),
                          hintText: "عنوان مطلب جدید خود را وارد کنید.",
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
                        "متن:",
                        style: TextStyle(
                            fontSize: 18, color: const Color(0XFFAABBD0)),
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
                          hintText: "متن مطلب جدید خود را وارد کنید.",
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
                          "ارسال",
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
