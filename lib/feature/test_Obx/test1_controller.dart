import 'dart:developer';

import 'package:get/get.dart';

class Test1Controller extends GetxController {
  var count = 0.obs;
  void increment() {
    count.value++;
  }
  @override
  // TODO: implement initialized
  bool get initialized => super.initialized;

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
