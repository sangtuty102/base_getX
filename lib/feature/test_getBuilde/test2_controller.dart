import 'dart:developer';

import 'package:get/get.dart';

class Test2Controller extends GetxController {
  var count = 0.obs;
  void increment() {
    count.value++;
    // update();
  }

  @override
  // TODO: implement initialized
  void onInit() {
    log('-----------------onInit');
    super.onInit();
  }

  @override
  void onReady() {
    log('-----------------onReady');
    // thích hợp cho snackbar, dialog
    super.onReady();
  }

  @override
  void onClose() {
    log('-----------------onClose');
    // thích hợp cho snackbar, dialog
    super.onClose();
  }
}
