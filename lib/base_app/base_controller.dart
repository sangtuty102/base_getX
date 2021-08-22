import 'package:demo_getx/base_app/base_request.dart';
import 'package:demo_getx/global/app_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isShowLoading = false.obs;
  String errorContent = '';
  BaseRequest baseRequestController = Get.find();

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void _setOnErrorListener() {
    baseRequestController.setOnErrorListener((error) {
      errorContent = "Lỗi";

      //Nếu server có trả về message thì hiển thị
      // if (error.response?.data != null &&
      //     error.response!.data is Map &&
      //     error.!.data["Message"] != null) {
      //   errorContent = error.response!.data['Message'];
      // } else {
      if (error.connectionError) {
        errorContent =
            'Không có kết nối Internet. Xin vui lòng kiểm tra kết nối';
      } else if (error.isNotFound) {
        errorContent = AppStr.error404;
      } else {
        switch (error.code) {
          case AppConst.error400:
            errorContent = AppStr.error400;
            break;

          default:
            errorContent = AppStr.errorInternalServer;
        }
      }

      isShowLoading.value = false;
      if (errorContent.isNotEmpty) {
        showSnackBar(errorContent);
      }
    });
  }

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color backgroundColor = AppColors.darkAccentColor,
  }) async {
    Get.showSnackbar<T>(GetBar(
      backgroundColor: backgroundColor,
      messageText: Text(
        message,
        style: Get.textTheme.bodyText1,
      ),
      message: message,
      mainButton: Row(
        children: [
          if (mainButton != null) mainButton,
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
        ],
      ),
      duration: message.length > 100 ? 5.seconds : duration,
    ));
  }

  @override
  void onReady() {
    _setOnErrorListener();
    super.onReady();
  }
}
