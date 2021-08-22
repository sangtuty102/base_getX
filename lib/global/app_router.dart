import 'package:demo_getx/feature/home/home_page.dart';
import 'package:demo_getx/feature/login/login_page.dart';
import 'package:demo_getx/feature/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

class ArgumentModel {
  ArgumentModel({
    this.tagController,
    required this.argument,
  });

  String? tagController;
  dynamic argument;
}

class AppRouter {
  // router
  static const String routeLogin = '/loginPage';
  static const String routeHome = '/homePage';

  // func in main
  static Route onGenerateRoute(RouteSettings settings) => PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => getWidgetByRoute(settings),
      );

  static Widget getWidgetByRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return SplashPage();
      case routeHome:
        return HomePage();
      case routeLogin:
        return LoginPage(
          loginTag: setting.arguments
                  is ArgumentModel // ko hiểu đoan code ngu si này xuống dòng mà ko hiểu là obj
              ? (setting.arguments as ArgumentModel).tagController
              : null,
        );
    }
    return SizedBox();
  }

  // var routers = [
  //   GetPage(
  //     // binding: Bindings(),
  //     name: '/',
  //     page: () => SplashPage(),
  //   ),
  //   GetPage(
  //     name: routeHome,
  //     page: () => HomePage(),
  //   ),
  //   GetPage(
  //     name: routeLogin,
  //     page: () => LoginPage(),
  //   ),
  // ];
}
