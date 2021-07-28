import 'package:get/get.dart';

import 'base_request.dart';

class BaseRepository {
  final BaseRequest _baseRequest = Get.find<BaseRequest>();

  Future<dynamic> baseSendRquest(String action, RequestMethod requestMethod,
      {Map<String, dynamic>? jsonMap}) {
    return _baseRequest.sendRequest(action, requestMethod, jsonMap: jsonMap);
  }
}
