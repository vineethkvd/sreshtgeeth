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
import '../model/login_model.dart';
import '../model/otp_model.dart';

class LoginCon extends GetxController with BaseController {

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


  LoginModel? logindata;
  Future<void> loginapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "phone": mobileCon.text,
    "password": passwordCon.text
    });
    var response = await BaseClient1()
        .post(API().logIn, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    logindata = loginModelFromJson(response);
    if (logindata!.status == true) {
      //Fluttertoast.showToast(msg: logindata!.msg.toString());
      GetStorage().write('artidtid', logindata!.data[0].artistId.toString());
      print('hiiii' + logindata!.data[0].artistId.toString());
      // navController.index = 0;
      Get.offAll(() => ArtistHome());
      acon.appuser = false;
      var eee = GetStorage().write('Appuser', acon.appuser);
      var www =GetStorage().read('Appuser');
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: logindata!.msg.toString());
    }
  }
 
}
