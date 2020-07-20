import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/widgets/panel.dart';
import 'package:cappuccino/widgets/recruit_item.dart';
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
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(20)
          ),
          children: <Widget>[
              RecruitItem(
                job: "iOS/Android ⾳视频开发⼯程师",
                salary: "40-60K",
                education: "本科",
                year: "3-5年",
                dateTime: "2020-05-23 18:26:57",
                company: "拼多多",
                hrName: "张三",
                hrWork: "技术总监",
              ),
              RecruitItem(
                job: "后端研发工程师",
                salary: "15-30K",
                education: "本科",
                year: "1-3年",
                dateTime: "2020-07-20 07:26:57",
                company: "今日头条",
                avatar: "https://img.bosszhipin.com/beijin/mcs/useravatar/20190506/6ebbb9e1db78dea1dd93bc3a4455a95ecfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_100,limit_0",
                hrName: "胡先生",
                hrWork: "HR",
              ),
            RecruitItem(
              job: "iOS/Android ⾳视频开发⼯程师",
              salary: "40-60K",
              education: "本科",
              year: "3-5年",
              dateTime: "2020-05-23 18:26:57",
              company: "拼多多",
              hrName: "张三",
              hrWork: "技术总监",
            ),
            RecruitItem(
              job: "后端研发工程师",
              salary: "15-30K",
              education: "本科",
              year: "1-3年",
              dateTime: "2020-07-20 07:26:57",
              company: "今日头条",
              avatar: "https://img.bosszhipin.com/beijin/mcs/useravatar/20190506/6ebbb9e1db78dea1dd93bc3a4455a95ecfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_100,limit_0",
              hrName: "胡先生",
              hrWork: "HR",
            ),
            RecruitItem(
              job: "iOS/Android ⾳视频开发⼯程师",
              salary: "40-60K",
              education: "本科",
              year: "3-5年",
              dateTime: "2020-05-23 18:26:57",
              company: "拼多多",
              hrName: "张三",
              hrWork: "技术总监",
            ),
            RecruitItem(
              job: "后端研发工程师",
              salary: "15-30K",
              education: "本科",
              year: "1-3年",
              dateTime: "2020-07-20 07:26:57",
              company: "今日头条",
              avatar: "https://img.bosszhipin.com/beijin/mcs/useravatar/20190506/6ebbb9e1db78dea1dd93bc3a4455a95ecfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_100,limit_0",
              hrName: "胡先生",
              hrWork: "HR",
            ),
            RecruitItem(
              job: "iOS/Android ⾳视频开发⼯程师",
              salary: "40-60K",
              education: "本科",
              year: "3-5年",
              dateTime: "2020-05-23 18:26:57",
              company: "拼多多",
              hrName: "张三",
              hrWork: "技术总监",
            ),
            RecruitItem(
              job: "后端研发工程师",
              salary: "15-30K",
              education: "本科",
              year: "1-3年",
              dateTime: "2020-07-20 07:26:57",
              company: "今日头条",
              avatar: "https://img.bosszhipin.com/beijin/mcs/useravatar/20190506/6ebbb9e1db78dea1dd93bc3a4455a95ecfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_100,limit_0",
              hrName: "胡先生",
              hrWork: "HR",
            ),
            RecruitItem(
              job: "iOS/Android ⾳视频开发⼯程师",
              salary: "40-60K",
              education: "本科",
              year: "3-5年",
              dateTime: "2020-05-23 18:26:57",
              company: "拼多多",
              hrName: "张三",
              hrWork: "技术总监",
            ),
            RecruitItem(
              job: "后端研发工程师",
              salary: "15-30K",
              education: "本科",
              year: "1-3年",
              dateTime: "2020-07-20 07:26:57",
              company: "今日头条",
              avatar: "https://img.bosszhipin.com/beijin/mcs/useravatar/20190506/6ebbb9e1db78dea1dd93bc3a4455a95ecfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_100,limit_0",
              hrName: "胡先生",
              hrWork: "HR",
            ),
          ],
        ),
      ),
    );
  }
}
