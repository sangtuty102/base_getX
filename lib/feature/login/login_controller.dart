import 'package:demo_getx/base_app/base_controller.dart';
import 'package:demo_getx/base_app/base_theme.dart';
import 'package:demo_getx/const/app_const.dart';
import 'package:demo_getx/feature/login/login_repository.dart';
import 'package:demo_getx/feature/login/model/login_model.dart';
import 'package:demo_getx/feature/login/response/login_response.dart';
import 'package:demo_getx/language/localization_ervice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  late LoginRepository loginRepository;
  String _currentLang = LocalizationService.locale.languageCode;
  var _test = 1.obs;

  LoginController() {
    this.loginRepository = LoginRepository();
  }
  Future<void> funcLogin() async {
    try {
      showLoading();
      // await 3.seconds.delay();
      // Get.toNamed(AppConst.routeHome, arguments: 'Sangth');

      LoginResponse _response = await loginRepository
          .loginUser(LoginModel('tuanln@goline.vn', 'Goline123'));
      if (_response.code == 200) {
        Get.offNamed(AppConst.routeHome, arguments: ' _response.data');
      }
    } finally {
      hideLoading();
    }
  }

  Future<void> getCovid() async {
    try {
      showLoading();

      await loginRepository.getCovid();
      Get.toNamed(AppConst.routeHome, arguments: '_response');
    } finally {
      hideLoading();
    }
  }

  Future<void> changeLocale() async {
    Get.bottomSheet(
      Container(
        color: AppColors.bottomSheetColor(
            isDark: themeService.isDarkThemeFromBox()),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              Text(
                'chooseLang'.tr,
                style: Get.textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Divider(
                  height: 1,
                  color: Colors.red,
                ),
              ),
              ...LocalizationService.langs.entries
                  .map(
                    (lang) => ListTile(
                        leading: Icon(
                          _currentLang == lang.key
                              ? Icons.radio_button_checked_outlined
                              : Icons.radio_button_unchecked_outlined,
                          color: _currentLang == lang.key
                              ? Colors.greenAccent
                              : Colors.grey,
                        ),
                        title: Text(
                          lang.value,
                          style: Get.textTheme.bodyText2,
                        ),
                        onTap: () {
                          LocalizationService.changeLocale(lang.key);
                          _currentLang = lang.key;
                          Get.back();
                        }),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
