import 'package:cappuccino/router/router_init.dart';
import 'package:fluro/fluro.dart';

import 'page/article_page.dart';
class ArticleRouter implements IRouterProvider{

  static String articlePage = "/article";

  @override
  void initRouter(Router router) {
    router.define(articlePage, handler: Handler(handlerFunc: (_, params) => ArticlePage()));
  }
}