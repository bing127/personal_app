import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
