import 'dart:async';

import 'package:cappuccino/common/remixicon.dart';
import 'package:cappuccino/common/style.dart';
import 'package:cappuccino/router/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {

  const WebviewPage({
    Key key,
    @required this.url,
    this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        return WillPopScope(
          onWillPop: () async {
            final String url = await controller.data.currentUrl();
            if( url == widget.url) {
              return true;
            } else {
              controller.data.goBack();
            return false;
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: BasicStyle.mainColor,
              brightness: Brightness.dark,
              leading: IconButton(
                icon: Icon(
                    RemixIcon.arrow_left_line,
                    color: Colors.white
                ),
                onPressed: (){
                  NavigatorUtils.goBack(context);
                },
              ),
              title: Text(
                "${widget.title}",
                style: GoogleFonts.barlow(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.white
                ),
              ),
            ),
            body: SafeArea(
              child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
          ),
        );
      },
    );
  }

}
