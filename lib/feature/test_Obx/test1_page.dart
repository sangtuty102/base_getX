import 'dart:developer';

import 'package:demo_getx/feature/test_Obx/test1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test1Page extends GetView<Test1Controller> {
  Test1Controller get controller => Get.put(Test1Controller());
  @override
  Widget build(BuildContext context) {
    log('-----------------buildWidget');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${controller.count.value}'),
          Obx(() => Container(
              height: 100,
              color: Colors.red,
              child: Text(
                '${controller.count.value}',
                style: TextStyle(fontSize: 20),
              ))),
          // GetX<Test1Controller>(
          //   init: Test1Controller(),
          //   builder: (value) {
          //     print("count  rebuild");
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Container(
          //             height: 100,
          //             color: Colors.green,
          //             child: Text(
          //               '${value.count.value}',
          //               style: TextStyle(fontSize: 20),
          //             )),
          //         IconButton(
          //             icon: Icon(Icons.ac_unit),
          //             onPressed: () => value.increment())
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.ac_unit), onPressed: () => controller.increment()),
    );
  }
}
