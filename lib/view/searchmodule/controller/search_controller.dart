import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../../../controller/auth.dart';

import '../../searchmodule/module/search_module.dart';

class SearchPageCon extends GetxController with BaseController {
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

  SearchModel? searchdata;
  Future<void> searchpageapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode(
        {"api_key": API().gapikey, "cus_id": GetStorage().read('cusId')});
    var response =
        await BaseClient().post(API().searchpage, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    searchdata = searchModelFromJson(response);
    if (searchdata!.status == "Success") {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: searchdata!.status.toString());
    }
  }
}
