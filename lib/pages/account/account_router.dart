import 'package:cappuccino/router/router_init.dart';
import 'package:fluro/fluro.dart';

import 'page/account_page.dart';
class AccountRouter implements IRouterProvider{

  static String accountPage = "/account";

  @override
  void initRouter(Router router) {
    router.define(accountPage, handler: Handler(handlerFunc: (_, params) => AccountPage()));
  }
}