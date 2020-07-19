import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    Key key,
    this.img,
    this.title,
    this.radius: 20,
    this.border:false,
    this.backgroundColor
  }): super(key: key);

  final String img;
  final String title;
  final double radius;
  final bool border;
  final Color backgroundColor;
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    double boxRadius = widget.radius != null ? widget.radius : ScreenUtil().setWidth(60);
    String titleName = widget.title!= null ? (widget.title.length >=3 ? widget.title.substring(widget.title.length -2,widget.title.length) : widget.title) : '';
    Widget content;
    Widget textContent = Container(
      width: boxRadius * 2,
      height: boxRadius * 2,
      decoration: BoxDecoration(
        color: Color(0xff0F82FF),
        borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
      ),
      alignment: Alignment.center,
      child: Text(
        titleName,
        style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(28),
            fontWeight: FontWeight.w700
        ),
      ),
    );
    Widget picContent = widget.img!= null ? PhysicalModel(
      child: Container(
          width: boxRadius * 2,
          height: boxRadius * 2,
          decoration: BoxDecoration(
              color: widget.backgroundColor != null ? widget.backgroundColor : Color(0xff0F82FF),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))
          ),
          child:  widget.img.contains("assets") ? Image.asset(widget.img) : CachedNetworkImage(
            imageUrl: "${widget.img}",
            fit: BoxFit.cover,
            errorWidget: (context, url ,_ ){
              return textContent;
            },
            placeholder: (context, url) => CircularProgressIndicator(),
          )
      ),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(widget.radius),
    ) : SizedBox(width: 0,height: 0,);
    if(titleName!= null && widget.img!= null){
      content = picContent;
    } else if(widget.img!= null){
      content = picContent;
    } else {
      content = textContent;
    }


    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.border ? 2.0 : 0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
      ),
      child: content,
    );
  }
}
