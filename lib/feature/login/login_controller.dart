part of 'login_page.dart';

class LoginController extends BaseController {
  late LoginRepository loginRepository;
  String _currentLang = LocalizationService.locale.languageCode;

  LoginController() {
    this.loginRepository = LoginRepository();
  }
  Future<void> funcLogin() async {
    try {
      showLoading();
      await 3.seconds.delay();
      // Get.toNamed(AppConst.routeHome, arguments: 'Sangth');

      // LoginResponse _response = await loginRepository
      //     .loginUser(LoginModel('tuanln@goline.vn', 'Goline123'));
      // if (_response.code == 200) {
      Get.offNamed(AppRouter.routeHome, arguments: ' _response.data');
      // }
    } finally {
      hideLoading();
    }
  }

  Future<void> getCovid() async {
    try {
      showLoading();

      await loginRepository.getCovid();
      Get.toNamed(AppRouter.routeHome, arguments: '_response');
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

  void showBottomSheet() {
    Get.bottomSheet(
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: 100,
                            itemBuilder: (_, index) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Element at index($index)"),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        isScrollControlled: true // show full screen
        );
  }
}
