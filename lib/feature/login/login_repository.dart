import 'package:demo_getx/base_app/base_repository.dart';
import 'package:demo_getx/base_app/base_request.dart';
import 'package:demo_getx/const/app_const.dart';
import 'package:demo_getx/feature/login/model/covid_model.dart';
import 'package:demo_getx/feature/login/model/login_model.dart';
import 'package:demo_getx/feature/login/response/login_response.dart';

class LoginRepository extends BaseRepository {
  LoginRepository() : super();

  Future<LoginResponse> loginUser(LoginModel user) async {
    var response = await baseSendRquest(AppConst.urlLogin, RequestMethod.POST,
        jsonMap: user.toJson());
    return LoginResponse.fromJson(response.bodyString as Map<String, dynamic>);
  }

  Future<Covid> getCovid() async {
    var response = await baseSendRquest('/', RequestMethod.GET);
    return Covid.fromJson(response);
  }
}
