import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/base_app/base_widget.dart';
import 'package:demo_getx/feature/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'multipleLanguage'.tr,
          style: Get.textTheme.bodyText1,
        ),
      ),
      body: baseShowLoading(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
            Text(Get.isDarkMode ? "Dark" : "Light"),
            Card(
              child: SizedBox(
                height: 150,
                child: Icon(Icons.ac_unit),
              ),
            ),
            ElevatedButton(
                onPressed: () => themeService.switchTheme(),
                child: Text('changTheme')),
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
