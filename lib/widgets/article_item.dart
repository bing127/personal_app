import 'package:cached_network_image/cached_network_image.dart';
import 'package:cappuccino/common/remixicon.dart';
import 'package:cappuccino/widgets/avatar.dart';
import 'package:cappuccino/widgets/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:common_utils/common_utils.dart' show DateUtil, TimelineUtil, DayFormat;

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    Key key,
    this.avatar,
    this.author,
    this.type:"juejin",
    this.title,
    this.sub,
    this.look,
    this.praise,
    this.comment,
    this.dateTime,
    this.thumbnail,
  }):super(key:key);

  final String avatar;
  final String author;
  final String type;
  final String title;
  final String sub;
  final String look;
  final String praise;
  final String comment;
  final String dateTime;
  final String thumbnail;

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Avatar(
                              img: "${ avatar != null ? avatar : 'assets/images/feedbackImage.png' }",
                              radius: ScreenUtil().setWidth(23),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(13)
                              ),
                              child: Text(
                                "$author",
                                style: GoogleFonts.barlow(
                                    fontSize: ScreenUtil().setSp(28)
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        _buildTag(type)
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "$title",
                              style: GoogleFonts.barlow(
                                  fontSize: ScreenUtil().setSp(29),
                                  color: Color(0xff111111),
                                  fontWeight: FontWeight.w600
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
                          ],
                        ),
                      ),
                      thumbnail!= null ? Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(20)
                          ),
                          child: PhysicalModel(
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                            child: CachedNetworkImage(
                              width: ScreenUtil().setWidth(180),
                              height: ScreenUtil().setHeight(150),
                              imageUrl: "$thumbnail",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CircularProgressIndicator(),
                            ),
                          )
                      ) : SizedBox.shrink()
                    ],
                  ),
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
                            _buildAction(RemixIcon.eye_line,num: look),
                            _buildAction(RemixIcon.hand_heart_line,num: praise),
                            _buildAction(RemixIcon.discuss_line,num: comment),
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
        ),
      ),
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

  Widget _buildTag(String tag){
    return Tag(
      text: tag == "juejin" ? "掘金" : ( tag == "segmentFault" ? "思否" : "官方" ),
      type: tag == "juejin" ? TagStyle.jueJin : ( tag == "segmentFault" ? TagStyle.segmentFault : TagStyle.official ),
    );
  }

  String _formatTime() {
    return TimelineUtil.formatByDateTime(DateUtil.getDateTime(dateTime),dayFormat: DayFormat.Common, locale: "zh");
  }
}
