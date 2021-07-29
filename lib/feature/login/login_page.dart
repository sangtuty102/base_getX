import 'dart:developer';

import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/base_app/base_widget.dart';
import 'package:demo_getx/feature/login/login_controller.dart';
import 'package:demo_getx/feature/test_Obx/test1_page.dart';
import 'package:demo_getx/feature/test_getBuilde/test2_controller.dart';
import 'package:demo_getx/feature/test_getBuilde/test2_page.dart';
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
            //test
            ElevatedButton(
                onPressed: () => Get.to(Test1Page()),
                child: Text('NavToABc OBX')),
            ElevatedButton(
                onPressed: () => Get.to(Test2Page())!.whenComplete(() async {
                      await 1.seconds.delay();
                      Test2Controller _controllerA = Get.find();
                      log("message------------------------${_controllerA.count}");
                    }),
                child: Text('NavToABc GetBuild')),

            //
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
