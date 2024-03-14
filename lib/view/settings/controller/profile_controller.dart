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

import '../model/profile_model.dart';

class ProfileCon extends GetxController with BaseController {
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();

  final TextEditingController searchCon = TextEditingController();

  ProfileModel? profiledata;
  Future<void> profileapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().profile, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    profiledata = profileModelFromJson(response);
    if (profiledata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: populardata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: profiledata!.status.toString());
    }
  }
}
