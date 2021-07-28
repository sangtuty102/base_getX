import 'package:demo_getx/app/app_controller.dart';
import 'package:demo_getx/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

ThemeService themeService = ThemeService();

class ThemeService {
  ThemeMode get theme =>
      isDarkThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// `sangth` TODO get ThemeMode.system
  bool isDarkThemeFromBox() => APP_DATA.read(AppConst.keyIsDarkTheme) ?? false;

  /// Save ThemeMode to local storage
  _saveThemeToBox(bool isDarkMode) =>
      APP_DATA.write(AppConst.keyIsDarkTheme, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(
        isDarkThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    //chang statusbar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.darkAccentColor,
      statusBarColor: Colors.grey.withOpacity(0.2),
      statusBarBrightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
    ));
    _saveThemeToBox(!isDarkThemeFromBox());
  }
}

ThemeData getThemeDarkOrLight({bool isDarkMode = false}) {
  return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: _basicTextTheme(isDarkMode: isDarkMode),
      iconTheme: _buildIconTheme(isDarkMode: isDarkMode),
      appBarTheme: _buildAppBarTheme(isDarkMode: isDarkMode),
      bottomAppBarTheme: _buildBottomAppBarTheme(isDarkMode: isDarkMode),
      bottomSheetTheme: _buildBottomSheetTheme(isDarkMode: isDarkMode),
      tabBarTheme: TabBarTheme().copyWith(
        labelColor: AppColors.darkPrimaryColor,
        unselectedLabelColor: AppColors.darkPrimaryColor,
      ),
      buttonTheme: _buildButtonTheme(isDarkMode: isDarkMode),
      cardTheme: _buildCardTheme(isDarkMode: isDarkMode),
      dialogTheme: _buildDialogTheme(),
      // colors
      primaryColor: AppColors.darkPrimaryColor,
      indicatorColor: Colors.grey,
      textButtonTheme: _textButtonThemeData(),
      scaffoldBackgroundColor:
          isDarkMode ? AppColors.backgroundColor : AppColors.lightAccentColor,
      accentColor: Colors.orange,
      buttonColor: AppColors.buttonColor,
      cardColor: isDarkMode ? AppColors.cardColor : Colors.pink[50],
      secondaryHeaderColor: isDarkMode ? AppColors.buttonColor : Colors.grey,
      backgroundColor:
          isDarkMode ? AppColors.darkAccentColor : AppColors.lightAccentColor,
      dialogBackgroundColor: AppColors.darkPrimaryColor);
}

TextTheme _basicTextTheme({bool isDarkMode = true}) {
  return TextTheme(
    headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    // subtitle
    subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontSize: 14),
    // body
    bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 16),
    // caption - chú thích trong app
    caption: TextStyle(fontSize: 12),
    // button
    button: TextStyle(fontSize: 14),
  ).apply(fontFamily: 'SanFranciscoDisplay');
}

IconThemeData _buildIconTheme({bool isDarkMode = true}) =>
    IconThemeData(color: isDarkMode ? Colors.white : Colors.grey, size: 20.0);

AppBarTheme _buildAppBarTheme({bool isDarkMode = true}) =>
    AppBarTheme().copyWith(
        elevation: 0.0,
        color: isDarkMode ? AppColors.darkAccentColor : AppColors.appBarColor,
        iconTheme: _buildIconTheme(isDarkMode: isDarkMode),
        textTheme: _basicTextTheme(isDarkMode: isDarkMode)..headline4);

ButtonThemeData _buildButtonTheme({bool isDarkMode = true}) =>
    ButtonThemeData().copyWith(
        height: 150,
        minWidth:
            5, // Them vao de context menu copy, paste tren Samsung khong bi soc vang
        buttonColor: isDarkMode ? AppColors.buttonColor : Colors.red,
        textTheme: ButtonTextTheme.accent,
        // colorScheme: base.colorScheme
        //     .copyWith(primary: Colors.white, secondary: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ));

TextButtonThemeData _textButtonThemeData() => TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(Get.textTheme.subtitle1),
        overlayColor: MaterialStateProperty.all(Colors.white38),
      ),
    );

BottomAppBarTheme _buildBottomAppBarTheme({bool isDarkMode = true}) =>
    BottomAppBarTheme(
        color: isDarkMode ? Colors.grey : Colors.white, elevation: 0);

BottomSheetThemeData _buildBottomSheetTheme({bool isDarkMode = true}) =>
    BottomSheetThemeData(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      backgroundColor: isDarkMode ? Colors.redAccent : Colors.black,
      modalBackgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
    );

CardTheme _buildCardTheme({bool isDarkMode = true}) => CardTheme().copyWith(
    color: isDarkMode ? AppColors.darkPrimaryColor : Colors.grey[50],
    elevation: 0.0);

DialogTheme _buildDialogTheme({bool isDarkMode = true}) =>
    DialogTheme(elevation: 1);
