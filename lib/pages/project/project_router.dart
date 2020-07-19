import 'package:cappuccino/router/router_init.dart';
import 'package:fluro/fluro.dart';

import 'page/project_page.dart';
class ProjectRouter implements IRouterProvider{

  static String projectPage = "/project";

  @override
  void initRouter(Router router) {
    router.define(projectPage, handler: Handler(handlerFunc: (_, params) => ProjectPage()));
  }
}