import 'package:cappuccino/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: BasicStyle.mainColor,
        brightness: Brightness.dark,
        title: Text(
          "我的",
          style: GoogleFonts.barlow(
              fontSize: ScreenUtil().setSp(36),
              color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
