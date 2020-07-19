import 'package:cappuccino/pages/recruit/page/recruit_page.dart';
import 'package:cappuccino/router/router_init.dart';
import 'package:fluro/fluro.dart';

import 'page/recruit_page.dart';
class RecruitRouter implements IRouterProvider{

  static String recruitPage = "/project";

  @override
  void initRouter(Router router) {
    router.define(recruitPage, handler: Handler(handlerFunc: (_, params) => RecruitPage()));
  }
}