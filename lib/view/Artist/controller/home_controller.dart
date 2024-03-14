import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sreshtgeeth/base_client1.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../../../controller/auth.dart';
import '../model/artistnotification_model.dart';
import '../model/dashboard_model.dart';
import '../model/homesome_model.dart';
import '../model/updateprofile_model.dart';

class HomeCon extends GetxController with BaseController {

  //token
  String? token;
  PickedFile? _pickedFile;
  final picker = ImagePicker();
  File? storedImage;
  File? image;
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


  HomeSongModel? homesongdata;
  Future<void> homesongapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": GetStorage().read('artidtid')
    });
    var response = await BaseClient1()
        .post(API().homesong, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    homesongdata = homeSongModelFromJson(response);
    if (homesongdata!.status == true) {
      //Fluttertoast.showToast(msg: homesongdata!.status.toString());
      } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: homesongdata!.status.toString());
    }
  }

  DashboardModel? dashboarddata;
  Future<void> dashboardapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": GetStorage().read('artidtid')
    });
    var response = await BaseClient1()
        .post(API().dashboard, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    dashboarddata = dashboardModelFromJson(response);
    if (dashboarddata!.status == true) {
      //Fluttertoast.showToast(msg: dashboarddata!.status.toString());
      } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: dashboarddata!.status.toString());
    }
  }


UpldateProfileModel? updateprofileddata;
  Future<void> updateprofileapi() async {    
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    final uri = Uri.parse(API().baseURL1 + API().updateprofile);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(
      {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    request.fields["api_key"] = API().gapikey;
    request.fields["artist_id"] = www;
    if (storedImage?.path != null) {
      var profileim = await http.MultipartFile.fromPath(
          "profile", image!.path);
      request.files.add(profileim);
      print('object' + profileim.toString());
    }
    
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    
    //var data = json.decode(response);
    updateprofileddata = upldateProfileModelFromJson(respStr);
    if (updateprofileddata!.status == true) {
      Fluttertoast.showToast(msg: updateprofileddata!.msg.toString());
     // dashboardapi();
      
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: updateprofileddata!.msg.toString());
    }
  }
    ArtistNotificationModel? artistnotificationdata;
    Future<void> artistnotificationapi() async {
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": GetStorage().read('artidtid')
    });
    var response = await BaseClient1()
        .post(API().notification, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    artistnotificationdata = artistNotificationModelFromJson(response);
    if (artistnotificationdata!.status == "Success") {
      //Fluttertoast.showToast(msg: artistnotificationdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),)); 
      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
        Fluttertoast.showToast(msg: artistnotificationdata!.status.toString());
    }
  }
}
