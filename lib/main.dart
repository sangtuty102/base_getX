import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/const/app_const.dart';
import 'package:demo_getx/feature/home/home_page.dart';
import 'package:demo_getx/feature/login/login_page.dart';
import 'package:demo_getx/feature/splash_page/splash_page.dart';
import 'package:demo_getx/language/localization_ervice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    // ko cho xoay ngang man hinh
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //init // status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.darkAccentColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Application
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        // supportedLocales: [const Locale('vi')],
        builder: (context, child) {
          // tắt hiệu ứng khi kéo xuống của listview
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },

        debugShowCheckedModeBanner: false,
        title: AppStr.appName,
        getPages: route,
        // theme
        themeMode: themeService.theme,
        theme: getThemeDarkOrLight(),
        darkTheme: getThemeDarkOrLight(isDarkMode: true),
        // langgue
        locale: LocalizationService.locale,
        translations: LocalizationService(),
        fallbackLocale: LocalizationService.fallbackLocale,
        logWriterCallback: localLogWriter,
        initialRoute: '/',
        // routes: routes,
        // navigatorObservers: [GetBack((_) {}, Get.routing)],
      ),
    );
  }

  var route = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppConst.routeHome,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppConst.routeLogin,
      page: () => LoginPage(),
    ),
  ];

  void localLogWriter(String text, {bool isError = false}) {
    print('** ' + text + ' [' + isError.toString() + ']');
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
