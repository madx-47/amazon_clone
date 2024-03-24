import 'dart:convert';

import 'package:amazon_clone/Helper/ColorHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


class AppConstant
{
  final GetStorage storage = GetStorage();

  //urls
  static var BASE_URL = "http://192.168.10.228:3000/api/";
  static var IMAGE_URL = "";

  //apis
  static var SIGNIN_API = "${BASE_URL}signin";
  static var VERIFY_OTP_API = "${BASE_URL}verifyOtp";
  static var SIGNUP_API = "${BASE_URL}signup";
  static var GET_PROFILE_API = "${BASE_URL}getProfile";
  static var GET_HOME_API = "${BASE_URL}home";
  static var CONFIRM_SESSION_API = "${BASE_URL}confirmSession";
  static var GET_SESSION_HISTORY_API = "${BASE_URL}getSessionHistory";
  static var START_CHARGING_SESSION_API = "${BASE_URL}startSession";
  static var EMERGENCY_STOP_API = "${BASE_URL}emergencyStop";
  static var GET_ACTIVE_SESSION = "${BASE_URL}getActiveSession";
  static var UPDATE_PROFILE_API = "${BASE_URL}profileUpdate";
  static var GET_PDF_URL_API = "${BASE_URL}getPdfUrl";
  static var COMPLETE_TRANSACTION_DETAIL_API = "${BASE_URL}completeTransactionDetails";
  static var GET_VEHICLES_LIST_API = "${BASE_URL}getCustomerVehicle";
  static var GET_VEHICLES_LIST_BY_CHARGER_API = "${BASE_URL}getVehicleListByChargerId";
  static var GET_VEHICLE_TYPE_API = "${BASE_URL}getVehicleTypes";
  static var ADD_CUSTOMER_VEHICLE_API = "${BASE_URL}addCustomerVehicle";
  static var UPDATE_CUSTOMER_VEHICLE_API = "${BASE_URL}updateCustomerVehicle";
  static var DELETE_CUSTOMER_VEHICLE_API = "${BASE_URL}deleteCustomerVehicle";
  static var GET_CUSTOMER_WALLET_HISTORY_API = "${BASE_URL}getCustomerWalletHistory";
  static var RAISE_SUPPORT_TICKET_API = "${BASE_URL}raiseSupportTicket";
  static var JOIN_ORGANIZATION_LIST_API = "${BASE_URL}requestToOrganization";
  static var GET_PAYMENT_KEY_API = "${BASE_URL}getPaymentKey";
  static var RECHARGE_API = "${BASE_URL}rechargeCustomers";
  static var GET_ORGANIZATION_LIST_API = "${BASE_URL}userDetails";

  //variables
  static var FCM_TOKEN = "fcm_token";
  static var DEVICE = "0";
  static var DEBUG_MODE = "ON";

  static var IS_LOGIN = "is_login";
  static var TOKEN = "token";
  static var USER_ID = "user_id";
  static var FIRST_NAME = "first_name";
  static var LAST_NAME = "last_name";
  static var USER_MOBILE = "user_mobile";
  static var USER_EMAIL = "user_email";
  static var SUPPORT_DETAILS = "support";

  static var USER_MODEL = "user_model";

  toastShow(BuildContext context, String msg)
  {
    Get.snackbar(
      "Error",
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.lightBlue,
      icon: const Icon(Icons.add_alert),
    );
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM ,// Also possible "TOP" and "CENTER"
    //     backgroundColor: Colors.black87,
    //     textColor: white
    // );
  }
  //
  longToastShow(BuildContext context, String msg) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM ,// Also possible "TOP" and "CENTER"
    //     backgroundColor: Colors.black87,
    //     textColor: white
    // );
  }

  loadWithCanBack(dynamic pageName)
  {
    Get.to(pageName,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),);
  }

  loadWithCanNotBack(dynamic pageName)
  {
    Get.off(pageName,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),);
  }

  loadWithCanNotAllBack(dynamic pageName)
  {
    Get.offAll(pageName,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),);
  }

  setStatusBarWhite()
  {
    const SystemUiOverlayStyle(
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
  }

  hideKeyboard()
  {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  //
  // static SupportModel getSupportDetail()
  // {
  //   return SupportModel.fromJson(AppConstant().storage.read(SUPPORT_DETAILS));
  // }

///////////////////////////////// Date Formate //////////////////////////////////

  static var SERVER_DATE_PATTEN = "yyyy-MM-dd";
  static var SERVER_DATE_TIME_PATTEN = "yyyy-MM-dd HH:mm:ss";
  static var dd_MM_yyyy_hh_mm_a_PATTEN = "dd-MM-yyyy hh:mm a";
  static var dd_MM_yyyy_HH_mm_ss_PATTEN = "dd-MM-yyyy HH:mm:ss";
  static var dd_MM_yyyy_PATTEN = "dd-MM-yyyy";
  static var yyyy_MM_dd_PATTEN = "yyyy-MM-dd";
  static var MMM_dd_yyyy_PATTEN = "MMM dd,yyyy";
  static var dd_MM_yyyy_SLASH_PATTEN = "dd/MM/yyyy";
  static var EEE_dd_PATTEN = "EEE dd";
  static var EEEE_PATTEN = "EEEE";
  static var dd_PATTEN = "dd";
  static var HH_mm_PATTEN = "HH:mm";
  static var HH_mm_ss_PATTEN = "HH:mm:ss";
  static var hh_mm_a_PATTEN = "hh:mm a";
  static var MMMM_dd_PATTEN = "MMMM dd";

  globalDateTimeFormat(var currentFormat, var returnFormat, var yourDateOrTime)
  {
    DateTime inputDate = DateFormat(currentFormat).parse(yourDateOrTime);
    return DateFormat(returnFormat).format(inputDate);
  }

  Future<String> openCalender(BuildContext context, var firstDate, var lastDate) async
  {
    String date ="";
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, picker)
        {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: secondaryColor,
                  onPrimary: white,
                  surface: secondaryColor,
                  onSurface: black,
                ),
                dialogBackgroundColor: white,
              ),
              child: picker!);
        }
    );
    if (newSelectedDate != null)
    {
      date = DateFormat('dd-MM-yyyy').format(newSelectedDate);
    }
    return date;
  }

  Future<String> openTimePicker(BuildContext context) async
  {
    String time = "";
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, picker) {
          return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: secondaryColor,
                  onPrimary: white,
                  surface: white,
                  onSurface: black,
                ),
                dialogBackgroundColor: white,
              ),
              child: picker!
          );
        }
    );
    if (newTime != null) {
      final now = DateTime.now().add(Duration(minutes: 10));
      if(DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute).isAfter(now))
        time = DateFormat('hh:mm a').format(DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute));
      else
      {
        // toastShow(context, "Please select future time.");
        return "";
      }
    }
    return time;
  }
  //
  // static Future<Map<Permission, PermissionStatus>> permissionServices({required Permission permission, required String title,required var height,required var width,}) async
  // {
  //   Map<Permission, PermissionStatus> statuses = await [permission].request();
  //
  //   if (statuses[permission]!.isPermanentlyDenied) {
  //     TitleYesNoDialog(
  //         height: height,
  //         width: width,
  //         title: title,
  //         positive: no,
  //         positiveStyle: regular_red_10,
  //         positiveClick: ()
  //         {
  //           Get.back();
  //         },
  //         negative: yes,
  //         negativeStyle: regular_cyan_10,
  //         negativeClick: ()
  //         {
  //           openAppSettings();
  //           Get.back();
  //         }
  //     );
  //   }
  //   else if (statuses[permission]!.isDenied)
  //   {
  //     permissionServices(permission: permission,title: title, height: height, width: width);
  //   }
  //   return statuses;
  // }

  var colorList = [
    Color(0xFFEEE9F5),
    Color(0xFFE9F8FB),
    Color(0xFFFEEBE5),
    Color(0xFFE9F6FF),
    Color(0xFFF1EAD0),
    Color(0xFFFBF7EB),
    Color(0xFFE3D3F0),
    Color(0xFFF5DAE1),
    Color(0xFFD0E8D0),
    Color(0xFFF5DACF),
  ];

  // getImagesFromCamera({required Function(XFile) pickedFile,required double limitInMB}) async {
  //   Map<Permission, PermissionStatus> statuses = await permissionServices(permission: Permission.camera,title: 'please_give_camera_permission');
  //   if(statuses[Permission.camera]!.isGranted){
  //     XFile? file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 60);
  //     if (file != null) {
  //       if(getFileSizeString(bytes: await file.length(),limitInMB: limitInMB,isConvertToKB: false)){
  //         pickedFile.call(file);
  //       }
  //     }
  //   }
  // }

  dateTimeFormat(var sdate)
  {
    try {
      String time = "";
      if (sdate.contains("T"))
      {
        time = sdate.split("T")[1].trim().substring(0, 8);
        sdate = sdate.split("T")[0].trim();
      }

      String dateStr = "$sdate $time";
      DateFormat df = DateFormat("yyyy-MM-dd HH:mm:ss");
      DateTime date = df.parse(dateStr);

      DateFormat sdfDestination = DateFormat("dd-MM-yyyy\nhh:mm a");
      return sdfDestination.format(date);

    } catch (e) {
      return "";
    }
  }

  getDateTimeFormat(String sdate)
  {
    try {
      String time = "";
      if (sdate.contains("T")) {
        time = sdate.split("T")[1].trim().substring(0, 8);
        sdate = sdate.split("T")[0].trim();
      }

      String dateStr = "$sdate $time";
      DateFormat df = DateFormat("yyyy-MM-dd HH:mm:ss");
      DateTime date = df.parse(dateStr);

      DateFormat sdfDestination = DateFormat("dd-MM-yyyy hh:mm a");
      return sdfDestination.format(date);

    } catch (e) {
      return "";
    }
  }

  base64Encode(String data)
  {
    try
    {
      return base64.encode(utf8.encode(data)).replaceAll('\n', '');
    }
    catch (e)
    {
      print(e);
      // Handle exceptions, if necessary
    }
    return data;
  }

}
