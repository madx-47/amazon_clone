import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/Network/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Helper/AppConstant.dart';
import 'FormDataApiHelper.dart';

class WebApiHelper extends FormDataApiHelper
{
  var networkError;
  bool isNetworkError = false;

///////////////////////////////////// Post API //////////////////////////////////

  Future<http.Response?> callPostApi(BuildContext context,String apiUrl, Map<String, dynamic>? data, bool isShowLoader) async
  {

    try {

      // Map<String, String> headers = await ApiServices.getHeaders();
      // headers['content-type'] = "application/json";
      // headers['accept'] = "application/json";
      // headers['authorization'] = "Bearer ${GetStorage().read(AppConstant.TOKEN)}";

      var response = await http.post(
          Uri.parse(apiUrl),
          body: json.encode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          }

      );


      print(
          "=======================Response Start===========================\n\n"
              "Url :$apiUrl\nParams :$data\nResponse : ${response.body.toString()}\n\n"
              "=======================Response End==========================="
      );

      return response;

      // if (response.statusCode == 200) {
      //   return jsonEncode(response.body.toString());
      // } else if (response.statusCode == 500) {
      //   AppConstant().toastShow(context, "500 : Internal Server Error");
      // } else if (response.statusCode == 404) {
      //   AppConstant().toastShow(context, "404 : Not Found");
      // } else if (response.statusCode == 401) {
      //   GetStorage().write(AppConstant.IS_LOGIN, false);
      //   // AppConstant().loadWithCanNotAllBack(const SplashScreen());
      //   AppConstant().toastShow(context, "401 : Unauthorized");
      // } else if (response.statusCode == 400) {
      //   AppConstant().toastShow(context, "400 : Bad Request");
      // } else {
      //   AppConstant().toastShow(context, "Something Went Wrong");
      // }
    }
    catch(e){
         AppConstant().toastShow(context, "errro catch");
         print(e.toString());
         }



  }

/////////////////////////////////// Delete API //////////////////////////////////

  Future<dynamic> callDeleteApi(BuildContext context,String apiUrl, Map<String, dynamic>? data, bool isShowLoader) async
  {
    try
    {
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

      var response = await http.delete(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: headers,
        encoding: Encoding.getByName("utf-8"),
      );

      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      print("=======================Response Start===========================\n\nUrl :$apiUrl\nParams :$data\nResponse : ${response.body.toString()}\n\n=======================Response End===========================");
      if(response.statusCode==200) {
        return jsonEncode(response.body.toString());
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

    } on TimeoutException catch (e) {
      if (isShowLoader) {
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

////////////////////////////////////// Put API //////////////////////////////////

  Future<dynamic> callPutApi(BuildContext context,String apiUrl, Map<String, dynamic>? data, bool isShowLoader) async
  {
    try
    {
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

      var response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: headers,
        encoding: Encoding.getByName("utf-8"),
      );

      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      print("=======================Response Start===========================\n\nUrl :$apiUrl\nParams :$data\nResponse : ${response.body.toString()}\n\n=======================Response End===========================");
      if(response.statusCode==200) {
        return jsonEncode(response.body.toString());
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

    } on TimeoutException catch (e) {
      if (isShowLoader) {
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

////////////////////////////////////// Get API //////////////////////////////////

  Future<dynamic> callGetApi(BuildContext context,String apiUrl, bool isShowLoader) async
  {
    try
    {
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

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      print("=======================Response Start===========================\n\nUrl :$apiUrl\nResponse : ${response.body.toString()}\n\n=======================Response End===========================");
      if(response.statusCode==200) {
        return jsonEncode(response.body.toString());
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
      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      AppConstant().toastShow(context, "Something Went Wrong");
      isNetworkError = true;
      networkError = e;
    }
    on SocketException catch (e)
    {
      if (isShowLoader) {
        await EasyLoading.dismiss();
      }

      AppConstant().toastShow(context, "Something Went Wrong");
      isNetworkError = true;
      networkError = e;
    }
    on Error catch (e)
    {
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
