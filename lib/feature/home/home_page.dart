import 'package:demo_getx/base_app/base_widget.dart';
import 'package:demo_getx/feature/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BaseGetWidget<HomeController> {
  HomeController get controller => Get.put(HomeController());

  @override
  Widget buildWidgets() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.arg,
            style: Get.textTheme.bodyText2!.copyWith(color: Colors.red),
          ),
          ElevatedButton(onPressed: () => Get.back(), child: Text('back')),
        ],
      ),
    );
  }
}
