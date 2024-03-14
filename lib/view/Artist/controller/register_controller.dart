import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/base_client1.dart';
import 'package:sreshtgeeth/view/Artist/controller/otp_controller.dart';
import 'package:sreshtgeeth/view/Artist/model/city_model.dart';
import 'package:sreshtgeeth/view/settings/Edit%20Profile/editprofile.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../artist/artistOTP.dart';
import '../model/church_model.dart';
import '../model/district_model.dart';
import '../model/otp_model.dart';
import '../model/register_model.dart';
import '../model/state_model.dart';

class RegisterCon extends GetxController with BaseController {
  
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

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


//   MLogin? logindata;
//   Future<void> loginapi() async {
//     var body = jsonEncode({
//     "api_key": API().gapikey,
//     "phone": mobileCon.text,
//     });
//     var response = await BaseClient()
//         .post(API().logIn, body)
//         .catchError(handleError);
//     if (response == null) return;
//     //var data = json.decode(response);
//     logindata = mLoginFromJson(response);
//     if (logindata!.status == true) {
//       Fluttertoast.showToast(msg: logindata!.otp.toString());
//       storage.write('LocalUserId', logindata!.data[0].uniqueId.toString());
//       print('hiiii' + logindata!.data[0].uniqueId.toString());
//       // navController.index = 0;
//       Get.to(() => OTP(otp: logindata!.otp.toString(),)); 
//       //Get.offAll(LoginView());
//       // Get.to(OTPVerification());
//     } else {
//       Get.to(() => Register());
//       Fluttertoast.showToast(msg: logindata!.msg.toString());
//     }
//   }
//   MCountry? countrydata;
//   //List<DropDownValueModel> searchD = [];
//   Future<void> getCountry() async {
//     var body = jsonEncode({
//     "api_key": API().gapikey,
//     });
//     var response = await BaseClient()
//         .post(API().country, body)
//         .catchError(handleError);
//     if (response == null) return;
//     //var data = json.decode(response);
//     countrydata = mCountryFromJson(response);
//     if (countrydata!.status == true) {
//       Fluttertoast.showToast(msg: countrydata!.status.toString());
//       //Get.to(() => OTP(otp: logindata!.otp.toString(),));
//     } else {
//       Fluttertoast.showToast(msg: countrydata!.status.toString());
//     }
//   }

  StateModel? statedata;
  List<DropDownValueModel> stateList = [];
  Future<void> getstate() async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "country_id":"1"
    });
    var response = await BaseClient1()
        .post(API().state, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    statedata = stateModelFromJson(response);
    if (statedata!.status == 'Success') {
      for (int i = 0; i < statedata!.stateList.length; i++) {
        stateList.add(DropDownValueModel(
            name: '${statedata!.stateList[i].stateName}',
            value: statedata!.stateList[i].stateId));
      }
      print(stateList.toString());
      Fluttertoast.showToast(msg: statedata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: statedata!.status.toString());
    }
  }

  DistrictModel? districtdata;
  List<DropDownValueModel> districtList = [];
  Future<void> getDistrict(stateId) async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "state_id": stateId
    });
    var response = await BaseClient1()
        .post(API().district, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    districtdata = districtModelFromJson(response);
    if (districtdata!.status == 'Success') {
      for (int i = 0; i < districtdata!.districtList.length; i++) {
        districtList.add(DropDownValueModel(
            name: '${districtdata!.districtList[i].districtName}',
            value: districtdata!.districtList[i].districtId));
      }
      print(districtList.toString());
      Fluttertoast.showToast(msg: districtdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: districtdata!.status.toString());
    }
  }

  CityModel? citydata;
  List<DropDownValueModel> cityList = [];
  Future<void> getCity(districtId) async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "district_id": districtId
    });
    var response = await BaseClient1()
        .post(API().city, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    citydata = cityModelFromJson(response);
    if (citydata!.status == 'Success') {
      for (int i = 0; i < citydata!.cityList.length; i++) {
        cityList.add(DropDownValueModel(
            name: '${citydata!.cityList[i].cityName}',
            value: citydata!.cityList[i].cityId));
      }
      print(stateList.toString());
      Fluttertoast.showToast(msg: citydata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: citydata!.status.toString());
    }
  }


ChurchModel? churchdata;
  List<DropDownValueModel> churchList= [];
  Future<void> getChurch(stateId,districtId,cityId) async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "state_id":stateId,
    "district_id":districtId,
    "city_id":cityId
    });
    var response = await BaseClient1()
        .post(API().church, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    churchdata = churchModelFromJson(response);
    if (churchdata!.status == 'Success') {
      for (int i = 0; i < churchdata!.cityList.length; i++) {
        churchList.add(DropDownValueModel(
            name: '${churchdata!.cityList[i].churchName}',
            value: churchdata!.cityList[i].churchName));
      }
      print(churchList.toString());
      Fluttertoast.showToast(msg: churchdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: churchdata!.status.toString());
    }
  }

  RegisterModel? registerdata;
  Future<void> registerapi(gender,state,district,city,chruch) async {
    OtpCon otpcon = Get.put(OtpCon());
    var body = jsonEncode({
    "api_key":API().gapikey,
    "name": userNameCon.text,
    "email": emailCon.text,
    "phone": otpcon.mobile.text,
    "gender": gender,
    "state": state,
    "city": city,
    "district": district,
    "church":chruch,
    "password": newPassCon.text
});
print(body);
    var response = await BaseClient1()
        .post(API().register, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    registerdata = registerModelFromJson(response);
    if (registerdata!.status == true) {
      //Fluttertoast.showToast(msg: registerdata!.msg.toString());
      otpcon.mobile.clear();
      // navController.index = 0;
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: registerdata!.msg.toString());
    }
  }


}
