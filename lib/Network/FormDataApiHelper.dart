import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

import '../Helper/AppConstant.dart';
import 'ApiServices.dart';


class FormDataApiHelper
{
  var loadingMessage = "loading...";
  var networkErrorMessage = "";
  var networkError;
  bool isNetworkError = false;
  String serverTakingLong = 'Time out';
  String internetConnectionProblem = 'Internet connection problem';
  String somethingWentWrong = 'Something wnt wrong';

  multipartFile(var filePath)
  {
    return MultipartFile.fromFileSync(filePath, filename: filePath.split('/').last);
  }

  Future<dynamic> callFormDataPostApi(var context,var url,var formData, bool isShowLoader) async
  {
    try
    {
      FormData apiData = FormData.fromMap(formData);

      if (isShowLoader) {
        await EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );
      }

      Map<String, String> headers = await ApiServices.getHeaders();
      headers['content-type'] = "application/json";
      headers['accept'] = "application/json";
      headers['authorization'] = "Bearer ${GetStorage().read(AppConstant.TOKEN)}";

      final response = await Dio().post(
        url,
        data: apiData,
        options: Options(
          headers: headers,
          contentType: 'multipart/form-data',
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }
        )
      );

      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      print("=======================Response Start===========================\n\nUrl :"+url.toString()+"\nParams :"+formData.toString()+"\nResponse : "+ response.data.toString()+"\n\n=======================Response End===========================");
      if(response.statusCode==200) {
        return jsonEncode(response.data);
      } else if(response.statusCode==500) {
        AppConstant().toastShow(context, "500 : Internal Server Error");
      } else if(response.statusCode==404) {
        AppConstant().toastShow(context, "404 : Not Found");
      } else if(response.statusCode==401) {
        GetStorage().write(AppConstant.IS_LOGIN, false);
        // AppConstant().loadWithCanNotAllBack(const SplashScreen());
        AppConstant().toastShow(context, "401 : Unauthorized");
      }  else if(response.statusCode==400) {
        AppConstant().toastShow(context, "400 : Bad Request");
      } else {
        AppConstant().toastShow(context, "Something Went Wrong");
      }

    }
    on TimeoutException catch (e)
    {
      if (isShowLoader)
      {
        await EasyLoading.dismiss();
      }

      AppConstant().toastShow(context, "Something Went Wrong");
      isNetworkError = true;
      networkError = e;
    } on SocketException catch (e) {
      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      AppConstant().toastShow(context, "Something Went Wrong");
      isNetworkError = true;
      networkError = e;
    } on Error catch (e) {
      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      AppConstant().toastShow(context, "Something Went Wrong");
      isNetworkError = true;
      networkError = e;
    }
    return null;
  }

}