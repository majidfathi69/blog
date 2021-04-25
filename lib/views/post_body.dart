import 'package:flutter/material.dart';

import 'new_comment.dart';

class PostBody extends StatefulWidget {
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
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 10),
              child: Container(
                width: 211,
                height: 211,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Tegallalang.jpg'),
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
                      "یوزپلنگ یا یوز جانوری مهره‌دار و پستاندار از راستهٔ گوشتخواران، خانوادهٔ گربه‌سانان است. این جانور در گذشته در بیشتر مناطق آفریقا و گستره وسیعی از آسیای مرکزی و شبه‌قاره هند یافت می‌شد، اما امروزه با کاهش شدید جمعیت روبرو شده‌است. از میان دو زیرگونهٔ اصلی یوزپلنگ، یکی از زیرگونه‌ها که با نام «یوزپلنگ آسیایی» شناخته می‌شود در خطر جدی انقراض است و تعداد کمی از آن در دشت‌های مرکزی ایران به بقا ادامه می‌دهند. بدن یوزپلنگ در درازای چندین میلیون سال به گونه‌ای پیشرفت پیدا کرده‌است که این جانور بتواند به طور معمول توانایی حرکت با سرعتی برابر با ۱۱۲ کیلومتر در ساعت را داشته باشد و البته برای مدت کوتاه با سرعتی برابر با ۱۲۰ کیلومتر بر ساعت هم توانای دویدن را دارد.",
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
                child: FlatButton(
                  child: Text(
                    "ثبت نظر",
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
                            child: NewComment()));
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
