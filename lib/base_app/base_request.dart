import 'package:demo_getx/global/app_global.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

enum RequestMethod { POST, GET }

class BaseRequest extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    // TODO init
    httpClient.baseUrl = AppConst.urlBase;
    httpClient.timeout = Duration(microseconds: AppConst.requestTimeOut);
  }

  void setOnErrorListener(Function(HttpStatus error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(HttpStatus error) onErrorCallBack;

  Future<dynamic> sendRequest(
    String action,
    RequestMethod requestMethod, {
    Map<String, dynamic>? jsonMap,
    bool isQueryParametersPost = false,
  }) async {
    Response response;
    Map<String, String>? _headers = await getBaseHeader();
    if (requestMethod == RequestMethod.POST) {
      response = await post(action, isQueryParametersPost ? '' : jsonMap,
          query: isQueryParametersPost ? jsonMap : null, headers: _headers);
    } else {
      response = await get(action);
    }
    if (response.isOk && response.body != null)
      return response.body;
    else
      return showDialogError(response.status);
  }

  Future<Map<String, String>?> getBaseHeader() async {
    return null;
    // {
    // 'apikey': '12345678'
    // "Content-Type": "application/json",
    // "Authentication": "sangth_hello",
    // };
  }

  dynamic showDialogError(HttpStatus e) {
    onErrorCallBack(e);
  }
}
