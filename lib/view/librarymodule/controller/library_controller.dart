import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/view/librarymodule/model/podcastlibrary_model.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../model/musiclibrary_model.dart';


class LibraryCon extends GetxController with BaseController {
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();

  var storage = GetStorage();
  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

    MusicLibraryModel? musiclibraryddata;
    Future<void> musiclibraryapi() async {
    var cus =GetStorage().read('cusId');
    var body = jsonEncode({
    "api_key": API().gapikey,
    "cus_id": cus,
    });
    var response = await BaseClient()
        .post(API().musiclibrary, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    musiclibraryddata = musicLibraryModelFromJson(response);
    if (musiclibraryddata!.status == 'Success') {
      //Fluttertoast.showToast(msg: musiclibraryddata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: musiclibraryddata!.status.toString());
    }
  }
  
    PodcastLibraryModel? podcastlibraryddata;
    Future<void> podcastlibraryapi() async {
    var cus =GetStorage().read('cusId');
    var body = jsonEncode({
    "api_key": API().gapikey,
    "cus_id": cus,
    });
    var response = await BaseClient()
        .post(API().podcastlibrary, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    podcastlibraryddata = podcastLibraryModelFromJson(response);
    if (podcastlibraryddata!.status == 'Success') {
      //Fluttertoast.showToast(msg: podcastlibraryddata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: podcastlibraryddata!.status.toString());
    }
  }
}
