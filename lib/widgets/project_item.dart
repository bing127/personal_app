import 'package:cappuccino/common/remixicon.dart';
import 'package:cappuccino/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:common_utils/common_utils.dart' show DateUtil, TimelineUtil, DayFormat;

class ProjectItem extends StatelessWidget {

  const ProjectItem({
    Key key,
    this.type,
    this.title,
    this.sub,
    this.star,
    this.fork,
    this.dateTime,
  }):super(key:key);

  final String type;
  final String title;
  final String sub;
  final String star;
  final String fork;
  final String dateTime;

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
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "$title",
                            style: GoogleFonts.barlow(
                                fontSize: ScreenUtil().setSp(29),
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w600
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          flex: 1,
                        ),
                        Tag(
                          type: TagStyle.github,
                          text: "$type",
                        )
                      ],
                    ),
                  ),
                  sub!= null ? Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(15)
                    ),
                    child: Text(
                      "$sub",
                      style: GoogleFonts.barlow(
                          fontSize: ScreenUtil().setSp(27),
                          color: Color(0xff888888)
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ) : SizedBox.shrink(),
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildAction(RemixIcon.star_smile_line,num: star),
                            _buildAction(RemixIcon.stock_line,num: fork),
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
                    ),
                  )
                ],
              ),
            ),
          ),
        )

      )
    );
  }

  Widget _buildAction(IconData icon, { String num:'0' }) {
    return Row(
      children: <Widget>[
        Icon(
            icon,
            size: ScreenUtil().setSp(35),
            color: Color(0xffb2bac2)
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Text(
          "$num",
          style: GoogleFonts.barlow(
              fontSize: ScreenUtil().setSp(28),
              color: Color(0xffb2bac2)
          ),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(30),
        ),
      ],
    );
  }

  String _formatTime() {
    return TimelineUtil.formatByDateTime(DateUtil.getDateTime(dateTime),dayFormat: DayFormat.Common, locale: "zh");
  }
}
