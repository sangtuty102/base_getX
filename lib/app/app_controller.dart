import 'package:demo_getx/base_app/base_controller.dart';
import 'package:demo_getx/base_app/base_request.dart';
import 'package:demo_getx/global/app_global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: non_constant_identifier_names
GetStorage app_data = GetStorage();

class AppController extends GetxController {
  @override
  Future<void> onInit() async {
    Get.put(BaseRequest(), permanent: true);

    Get.put(BaseController(), permanent: true);

// thêm vào để splash hiển thị lâu thêm tí
    await 1.seconds.delay();
    Get.offAndToNamed(AppRouter.routeLogin);

    super.onInit();
  }
}
