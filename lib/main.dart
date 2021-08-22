import 'dart:developer';

import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/global/app_global.dart';
import 'package:demo_getx/language/localization_ervice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
        builder: (context, child) {
          // tắt hiệu ứng khi kéo xuống của listview
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },

        debugShowCheckedModeBanner: false,
        title: AppStr.appName,
        // getPages: AppRouter.routers,
        // dùng generate vì muốn truyền param là tagController cho page, chứ ko muốn là argument
        onGenerateRoute: AppRouter.onGenerateRoute,
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
      ),
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    log('** ' + text + ' [' + isError.toString() + ']');
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
