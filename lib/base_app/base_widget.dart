import 'package:demo_getx/base_app/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseGetWidget<T extends BaseController> extends GetView<T> {
  const BaseGetWidget({Key? key, required this.currentTag}) : super(key: key);
  // final String? tag = null;

  final String? currentTag;

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
        onWillPop: () async {
          return !Navigator.of(context).userGestureInProgress;
        },
        child: buildWidgets());
  }

  Widget baseShowLoading(WidgetCallback child) {
    return Obx(
      () => Stack(
        children: [
          child(),
          Visibility(
            visible: controller.isShowLoading.value,
            child: ColoredBox(
              color: Colors.grey.withOpacity(0.5),
              child: Center(
                child: Text(
                  'Loading ...',
                  style: Get.textTheme.bodyText2!
                      .copyWith(color: Colors.orangeAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
