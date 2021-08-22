import 'dart:developer';

import 'package:demo_getx/base_app/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  late String arg;

  @override
  void onInit() {
    super.onInit();
    arg = Get.arguments ?? 'sang';
    log('okkkkkkkkkkkkkkkkkkk');
  }
}
