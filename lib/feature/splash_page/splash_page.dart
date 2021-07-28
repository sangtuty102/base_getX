import 'package:demo_getx/app/app_controller.dart';
import 'package:demo_getx/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          AppStr.pathLogo,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
