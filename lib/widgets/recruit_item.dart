import 'package:cappuccino/router/fluro_navigator.dart';
import 'package:cappuccino/widgets/avatar.dart';
import 'package:cappuccino/widgets/tag.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum RecruitSource {
  boss,
  laGou
}


class RecruitItem extends StatelessWidget {
  const RecruitItem({
    Key key,
    this.type:"boss",
    this.salary,
    this.job,
    this.year,
    this.education,
    this.company,
    this.hrName,
    this.avatar,
    this.hrWork,
    this.dateTime,
  }):super(key:key);

  final String type;
  final String avatar;
  final String job;
  final String year;
  final String education;
  final String company;
  final String hrName;
  final String hrWork;
  final String dateTime;
  final String salary;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30),
          top: ScreenUtil().setHeight(20)
      ),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: (){
              NavigatorUtils.goWebViewPage(context, "测试", "https://www.zhipin.com/job_detail/d5f5609bcae85fdb03V72Nu6E1E~.html?ka=job_list_4_blank&lid=nlp-jpTU3BLYl7.search.4");
            },
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$job",
                            style: GoogleFonts.barlow(
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "$salary",
                              style: GoogleFonts.barlow(
                                  fontSize: ScreenUtil().setSp(30),
                                  color: Color(0xfffc6c38)
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(15),
                            ),
                            _buildTag()
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildDetail("$year"),
                        _buildDetail("$education")
                      ],
                    )
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          bottom: ScreenUtil().setHeight(15)
                      ),
                      child: Text(
                        "${ company ?? "未知" }",
                        style: GoogleFonts.barlow(
                            fontSize: ScreenUtil().setSp(30),
                          color: Color(0xff232323)
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Avatar(
                            img: "${ avatar != null ? avatar : 'assets/images/feedbackImage.png' }",
                            radius: ScreenUtil().setWidth(23),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "   $hrName",
                                  style: GoogleFonts.barlow(
                                      fontSize: ScreenUtil().setSp(28),
                                      color: Color(0xff898989)
                                  ),
                                ),
                                TextSpan(
                                    text: " • ",
                                    style: GoogleFonts.barlow(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color(0xff898989)
                                    ),
                                ),
                                TextSpan(
                                    text: "$hrWork",
                                    style: GoogleFonts.barlow(
                                        fontSize: ScreenUtil().setSp(28),
                                        color: Color(0xff898989)
                                    ),
                                )
                              ]
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${_formatTime()}",
                        style: GoogleFonts.barlow(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color(0xffb2bac2)
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }


  Widget _buildTag(){
    return Tag(
      text: "来源:${type == "boss" ? "Boss" : "拉勾"}",
      color: Color(type == "boss" ? 0xff5dd5ca : 0xff00b38a),
    );
  }

  Widget _buildDetail(String text) {
    return Container(
      margin: EdgeInsets.only(
        right: ScreenUtil().setWidth(20)
      ),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(10),
          top: ScreenUtil().setHeight(5),
          bottom: ScreenUtil().setHeight(5)
      ),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8))
      ),
      child: Text(
          "$text",
          style: GoogleFonts.barlow(
              fontSize: ScreenUtil().setSp(28),
              color: Color(0xff737373)
          ),
      ),
    );
  }

  String _formatTime() {
    return TimelineUtil.formatByDateTime(DateUtil.getDateTime(dateTime),dayFormat: DayFormat.Common, locale: "zh");
  }
}
