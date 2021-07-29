import 'dart:developer';

import 'package:demo_getx/feature/test_getBuilde/test2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test2Page extends StatelessWidget {
// class Test2Page extends GetWidget<Test2Controller> {
  @override
  Widget build(BuildContext context) {
    log('-----------------buildWidget');
    return Scaffold(
        body: Center(
            // child: Container(height: 100, width: 100, color: Colors.red),
            child: GetBuilder<Test2Controller>(
      init: Test2Controller(), // INIT IT ONLY THE FIRST TIME
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Text(
              '${controller.count}',
            ),
          ),
          IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () => controller.increment()),
          ElevatedButton(
              onPressed: () => Get.to(PageC()), child: Text('NavToABc PageC')),
        ],
      ),
    )));
  }
}

// Hoặc sử dụng Get.find()

class PageC extends StatelessWidget {
  Test2Controller _controllerA = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${_controllerA.count}'),
            GetX<Test2Controller>(
              builder: (value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: 100,
                        color: Colors.green,
                        child: Text(
                          '${value.count.value}',
                          style: TextStyle(fontSize: 20),
                        )),
                    IconButton(
                        icon: Icon(Icons.ac_unit),
                        onPressed: () => value.increment())
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
