import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
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

import '../model/dashboard_model.dart';
import '../model/podcastuser_model.dart';
import '../../podcastmodule/model/upcomingpodcast_model.dart';

class PodcastUserCon extends GetxController with BaseController {
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
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  TimeOfDay? selectedTime;

  //background
  //var task ='firstTask';
  //otp
  final TextEditingController title = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  PodcastUserModel? podcastuserdashboarddata;
  Future<void> podcastdashboardapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode(
        {"api_key": API().gapikey, "cus_id": GetStorage().read('cusId')});
    var response = await BaseClient()
        .post(API().podcastdashboard, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    podcastuserdashboarddata = podcastUserModelFromJson(response);
    if (podcastuserdashboarddata!.status == true) {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: podcastuserdashboarddata!.status.toString());
    }
  }

  UpcomingPodcastModel? upcomingpodcastdata;
  Future<void> upcomingpodcastapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode(
        {"api_key": API().gapikey, "cus_id": GetStorage().read('cusId')});
    var response = await BaseClient()
        .post(API().upcomingpodcast, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    upcomingpodcastdata = upcomingPodcastModelFromJson(response);
    if (upcomingpodcastdata!.status == true) {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: upcomingpodcastdata!.status.toString());
    }
  }
}
