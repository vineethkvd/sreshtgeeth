import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';

import 'package:http/http.dart' as http;

import '../model/dashboard_model.dart';

class HomesCon extends GetxController with BaseController {
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();
  var lobs = true.obs;
  var otp = ''.obs;
  var driverid = ''.obs;
  var driverUnique = ''.obs;
  var driverName = ''.obs;
  var driverStatus = ''.obs;
  var details = [].obs;
  var datacaradd;
  var profiledetails;
  var forgot_id = ''.obs;
  var makePhoneCall;
  var driveruniqueId = ''.obs;
  var driveruniqueId1 = ''.obs;
  var driveruniqueId2 = ''.obs;
  var driveruniqueId3 = ''.obs;
  var driveruniqueId4 = ''.obs;
  var storage = GetStorage();
  bool appuser = false;
  //register
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController mailCon = TextEditingController();
  final TextEditingController firstNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController VehicleNumCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController Instructions = TextEditingController();
  final TextEditingController carnumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController districtcon = TextEditingController();
  final TextEditingController statecon = TextEditingController();
  final TextEditingController ReferralIDcon = TextEditingController();
  final TextEditingController addresscon = TextEditingController();
  final TextEditingController DateController = TextEditingController();
  final TextEditingController DatetoController = TextEditingController();

  final TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController upload2 = TextEditingController();
  TextEditingController upload3 = TextEditingController();
  TextEditingController upload4 = TextEditingController();
  var selectGender = "Male".obs;

  //token
  String? token;

  //ll

  bool? isLoaded;
  var lat;
  var lon;
  var timeNotifier = ''.obs;

  //background
  //var task ='firstTask';
  //otp
  final TextEditingController otpCon = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  DashboardModel? dashboarddata;
  List<DropDownValueModel> artistList = [];
  Future<void> dashboardapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().dashboard, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    dashboarddata = dashboardModelFromJson(response);
    if (dashboarddata!.status == 'Success') {
    } else {
      Fluttertoast.showToast(msg: dashboarddata!.status.toString());
    }
  }
}
