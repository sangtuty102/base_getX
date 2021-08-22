import 'dart:ui';

import 'package:demo_getx/app/app_controller.dart';
import 'package:demo_getx/global/app_global.dart';
import 'package:demo_getx/language/str_en.dart';
import 'package:demo_getx/language/str_vi.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocalizationService extends Translations {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final fallbackLocale = Locale('vi', 'VN');

// language code của những locale được support
  static final langCodes = ['en', 'vi'];

// các Locale được support
  static final locales = [Locale('en', 'US'), Locale('vi', 'VN')];

// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = {'en': 'English', 'vi': 'Tiếng Việt'};
  // LinkedHashMap.from({'en': 'English', 'vi': 'Tiếng Việt'});

// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
        // theem map ngon ngu o day
      };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    String? _initLocale = app_data.read(AppConst.keyLocale);

    for (int i = 0; i < langCodes.length; i++) {
      if (langCode != null && _initLocale != null) {
        if (langCode == langCodes[i]) {
          app_data.write(AppConst.keyLocale, langCodes[i]);
          return locales[i];
        }
      } else {
        String? _lang = Get.deviceLocale?.languageCode;

        if (_lang == langCodes[i]) {
          app_data.write(AppConst.keyLocale, langCodes[i]);
          return locales[i];
        }
      }
    }
    app_data.write(AppConst.keyLocale, langCodes[0]);
    return locales[0];
  }
}
