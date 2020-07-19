import 'dart:io';

import 'package:cappuccino/app/app_page.dart';
import 'package:cappuccino/provider/provider_manager.dart';
import 'package:cappuccino/router/application.dart';
import 'package:cappuccino/router/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import 'app/exception_page.dart';

void main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();
  /// 配置初始化
  await SpUtil.getInstance();
  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
    print(flutterErrorDetails.toString());
    return ExceptionPage();
  };

  // 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Cappuccino',
        showPerformanceOverlay: false, //显示性能标签
        debugShowCheckedModeBanner: false,
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
        showSemanticsDebugger: false, // 显示语义视图
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          textTheme: TextTheme(
              subhead: TextStyle(textBaseline: TextBaseline.alphabetic)
          ),
          primaryColor: Colors.white,
          dividerColor: Color(0xFFEEEEEE),
          scaffoldBackgroundColor: Color(0xffF4F6FA),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
//        home: Consumer<UserProvider>(
//          builder: (_,model,__){
//            return model.getUserInfo() != null ? WelcomePage() : AccountPage();
//          },
//        ),
        home: AppPage(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CH'),
          Locale('en', 'US')
        ],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), // 或者 MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
        locale: const Locale("en", "US"),
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          return locale;
        },
      ),
    );
  }
}

