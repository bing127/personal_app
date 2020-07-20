import 'package:cappuccino/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Panel extends StatelessWidget {

  const Panel({
    Key key,
    this.title,
    this.child,
  }):super(key:key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30),
          top: ScreenUtil().setHeight(20)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          color: Colors.white
        ),
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(15)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(5),
                    height: ScreenUtil().setHeight(30),
                    decoration: BoxDecoration(
                      color: BasicStyle.mainColor,
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20))
                    ),
                    margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(8)
                    ),
                  ),
                  Text(
                    "$title",
                    style: GoogleFonts.barlow(
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
            child!= null ? child : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
