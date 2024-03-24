

import 'package:get_storage/get_storage.dart';

import '../Helper/AppConstant.dart';

class ApiServices {

  static dynamic getHeaders() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read(AppConstant.TOKEN)}',
    };
    // headers['Authorization'] = 'Bearer ${GetStorage().read(AUTHORIZATION_TOKEN)}';

    // var headers;
    // headers['content-type'] = "application/json";
    // headers['accept'] = "application/json";
    // headers['authorization'] = "Bearer ${GetStorage().read(AppConstant.TOKEN)}";

    return headers;
  }

  static dynamic getHeadersMulti() async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': '*/*',
      'Authorization': 'Bearer ${GetStorage().read(AppConstant.TOKEN)}',
    };
    // headers['Authorization'] = 'Bearer ${GetStorage().read(AUTHORIZATION_TOKEN)}';

    // var headers;
    // headers['content-type'] = "application/json";
    // headers['accept'] = "application/json";
    // headers['authorization'] = "Bearer ${GetStorage().read(AppConstant.TOKEN)}";

    return headers;
  }

}