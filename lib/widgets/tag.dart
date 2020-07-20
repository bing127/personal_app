import 'package:cappuccino/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum TagStyle {
  jueJin,
  segmentFault,
  official,
  github
}

class Tag extends StatelessWidget {

  const Tag({
    Key key,
    this.text,
    this.type: TagStyle.jueJin,
    this.color
  }):super(key:key);

  final String text;
  final TagStyle type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(10),
        right: ScreenUtil().setWidth(10),
        top: ScreenUtil().setHeight(5),
        bottom: ScreenUtil().setHeight(5)
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        color: color!= null ? color.withOpacity(0.05) : _buildColor().withOpacity(0.05),
        border: Border.all(
          color: color!= null ? color : _buildColor(),
          width: ScreenUtil().setWidth(1.5)
        )
      ),
      child: Text(
        "$text",
        style: GoogleFonts.barlow(
            fontSize: ScreenUtil().setSp(25),
            color: color!= null ? color : _buildColor()
        ),
      ),
    );
  }

  Color _buildColor() {
    if(type == TagStyle.jueJin) {
      return Color(0xff007fff);
    } else if(type == TagStyle.segmentFault) {
      return Color(0xff009a61);
    } else if(type == TagStyle.github) {
      return Color(0xff24292e);
    } else {
      return BasicStyle.mainColor;
    }
    return BasicStyle.mainColor;
  }
}
