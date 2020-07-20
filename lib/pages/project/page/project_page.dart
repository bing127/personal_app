import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
          "项目",
          style: GoogleFonts.barlow(
              fontSize: ScreenUtil().setSp(36),
              color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(20)
          ),
          children: <Widget>[
            ProjectItem(
              dateTime: "2019-03-13 05:59:23",
              type: "node",
              title: "Node-background-management-system",
              sub: "eggjs实现一个较为完整的后台管理系统",
              star: "72",
              fork: "25",
            ),
            ProjectItem(
              dateTime: "2019-03-13 05:59:23",
              type: "python",
              title: "peeplus",
              sub: "python+vue3前后端分离项目",
              star: "19",
              fork: "10",
            ),
            ProjectItem(
              dateTime: "2019-03-13 05:59:23",
              type: "vue",
              title: "cappuccino",
              star: "72",
              fork: "25",
            ),
            ProjectItem(
              dateTime: "2019-07-19 05:59:23",
              type: "dart",
              title: "boss",
              sub: "flutter仿boss",
              star: "8",
              fork: "0",
            ),
            ProjectItem(
              dateTime: "2020-03-28 05:59:23",
              type: "go",
              title: "one_day",
              star: "72",
              fork: "25",
            )
          ],
        ),
      ),
    );
  }
}
