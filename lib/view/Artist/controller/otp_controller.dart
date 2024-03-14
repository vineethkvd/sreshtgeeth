import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/base_client1.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../artist/artistOTP.dart';
import '../model/otp_model.dart';

class OtpCon extends GetxController with BaseController {

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
  final TextEditingController mobile= TextEditingController();
  final TextEditingController otp = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  OtpModel? otpdata;
  Future<void> otpapi() async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "phone": mobile.text,
    });
    var response = await BaseClient1()
        .post(API().artistotp, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    otpdata = otpModelFromJson(response);
    if (otpdata!.status == true) {
      Fluttertoast.showToast(msg: otpdata!.otp.toString());
      Get.to(() => ArtistOTP(otp: otpdata!.otp.toString(),));
      //Get.to(() => OTP(otp: logindata!.otp.toString(),)); 
      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
        Fluttertoast.showToast(msg: otpdata!.msg.toString());
    }
  }
  
}
