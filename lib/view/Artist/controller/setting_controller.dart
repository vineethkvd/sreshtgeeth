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

import '../../../controller/auth.dart';
import '../artist/artistOTP.dart';
import '../artistHomepage.dart';
import '../model/content_model.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';
import '../model/setting_model.dart';

class SettingCon extends GetxController with BaseController {

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
  final TextEditingController mobileCon= TextEditingController();
  final TextEditingController passwordCon= TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();


  SettingModel? settingdata;
  Future<void> settingapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": GetStorage().read('artidtid')
    });
    var response = await BaseClient1()
        .post(API().settings, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    settingdata = settingModelFromJson(response);
    if (settingdata!.status == true) {
      Fluttertoast.showToast(msg: settingdata!.status.toString());
      } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: settingdata!.status.toString());
    }
  }


  ContentModel? contentdata;
  Future<void> contentapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": GetStorage().read('artidtid')
    });
    var response = await BaseClient1()
        .post(API().content, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    contentdata = contentModelFromJson(response);
    if (contentdata!.status == true) {
      //Fluttertoast.showToast(msg: contentdata!.status.toString());
      } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: contentdata!.status.toString());
    }
  }


}
