import 'package:demo_getx/base_app/base_controller.dart';
import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/base_app/base_widget.dart';
import 'package:demo_getx/feature/login/login_repository.dart';
import 'package:demo_getx/global/app_global.dart';
import 'package:demo_getx/language/localization_ervice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'login_controller.dart';
part 'widget_view.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  LoginPage({String? loginTag}) : super(currentTag: loginTag);

  @override
  LoginController get controller => Get.put(LoginController(), tag: currentTag);

  @override
  Widget buildWidgets() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => themeService.switchTheme(),
            icon: Icon(
              Get.isDarkMode
                  ? Icons.brightness_high_outlined
                  : Icons.brightness_2_outlined,
              color: Get.isDarkMode
                  ? Colors.yellowAccent
                  : AppColors.backgroundColor,
            ),
          )
        ],
      ),
      body: baseShowLoading(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Get.isDarkMode ? "Dark" : "Light"),
            ElevatedButton(
                onPressed: () => controller.changeLocale(),
                child: Text('chang lang')),
            ElevatedButton(
                onPressed: () => controller.getCovid(), child: Text('Covid')),
            ElevatedButton(
                onPressed: () => controller.funcLogin(), child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
