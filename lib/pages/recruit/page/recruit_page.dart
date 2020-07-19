import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/widgets/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecruitPage extends StatefulWidget {
  @override
  _RecruitPageState createState() => _RecruitPageState();
}

class _RecruitPageState extends State<RecruitPage> {
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
          "招聘",
          style: GoogleFonts.barlow(
              fontSize: ScreenUtil().setSp(36),
              color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
              Panel(
                title: "基本信息",
                child: Column(
                  children: <Widget>[
                    Text("1")
                  ],
                ),
              ),
              Panel(
                title: "个人优势",
                child: Column(
                  children: <Widget>[
                    Text("1")
                  ],
                ),
              ),
            Panel(
              title: "求职期望",
              child: Column(
                children: <Widget>[
                  Text("1")
                ],
              ),
            ),
            Panel(
              title: "工作经历",
              child: Column(
                children: <Widget>[
                  Text("1")
                ],
              ),
            ),
            Panel(
              title: "项目经历",
              child: Column(
                children: <Widget>[
                  Text("1")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
