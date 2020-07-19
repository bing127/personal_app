import 'package:cappuccino/app/app_page.dart';
import 'package:cappuccino/app/webview_page.dart';
import 'package:cappuccino/app/welcome_page.dart';
import 'package:cappuccino/pages/account/account_router.dart';
import 'package:cappuccino/pages/article/article_router.dart';
import 'package:cappuccino/pages/my/my_router.dart';
import 'package:cappuccino/pages/project/project_router.dart';
import 'package:cappuccino/pages/recruit/recruit_router.dart';
import 'package:cappuccino/router/router_init.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '404.dart';


class Routes {

  static String home = "/home";
  static String webViewPage = "/webview";
  static String welcomePage = "/welcome";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("未找到目标页");
        return WidgetNotFound();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => AppPage()
      )
    );

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
      String url = params['url']?.first;
      String title = params['title']?.first;
      return WebviewPage(url: url,title:title);
    }));


    router.define(welcomePage, handler: Handler(handlerFunc: (_, params)=> WelcomePage()));

    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(AccountRouter());
    _listRouter.add(ArticleRouter());
    _listRouter.add(ProjectRouter());
    _listRouter.add(RecruitRouter());
    _listRouter.add(MyRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
