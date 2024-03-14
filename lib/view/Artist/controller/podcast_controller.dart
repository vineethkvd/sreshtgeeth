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
import '../artist/artistOTP.dart';
import '../artistHomepage.dart';
import '../model/dashboard_model.dart';
import '../model/homesome_model.dart';
import '../model/initialcall_model.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';
import '../model/podcastcategory_model.dart';
import '../model/podcastdashboard_model.dart';
import '../model/schedulepodcast_model.dart';
import '../model/setting_model.dart';
import '../model/startpodcast_model.dart';
import '../model/stoppodcast_model.dart';
import '../model/updateprofile_model.dart';

class PodcastCon extends GetxController with BaseController {
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

  List<DropDownValueModel> categorylist = [];
  PodcastCategoryModel? categorydata;
  Future<void> podcastcategoryapi() async {
    var body = jsonEncode({
      "api_key": API().gapikey,
    });
    var response = await BaseClient1()
        .post(API().podcastcategory, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    categorydata = podcastCategoryModelFromJson(response);
    if (categorydata!.status == 'Success') {
      //Fluttertoast.showToast(msg: categorydata!.status.toString());
      for (int i = 0; i < categorydata!.podcastCategoryList.length; i++) {
        categorylist.add(DropDownValueModel(
            name: categorydata!.podcastCategoryList[i].podcastCategoryTitle,
            value: categorydata!.podcastCategoryList[i].podcastCategoryId));
        //print('wwwwwwwwwwwwwwwwwww' + tracklistdata!.trackList.length.toString());
      }
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: categorydata!.status.toString());
    }
  }

  PodcastDashboardModel? podcastdashboarddata;
  Future<void> dashboardapi() async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode(
        {"api_key": API().gapikey, "artist_id": GetStorage().read('artidtid')});
    var response = await BaseClient1()
        .post(API().podcastdashboard, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    podcastdashboarddata = podcastDashboardModelFromJson(response);
    if (podcastdashboarddata!.status == true) {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    }
  }

  SchedulePodcastModel? schedulepodcastdata;
  Future<void> scheculepodcastapi(category, types) async {
    showLoading();
    var www = GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    final uri = Uri.parse(API().baseURL1 + API().schedulepodcast);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(
      {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    request.fields["api_key"] = API().gapikey;
    request.fields["artist_id"] = www;
    request.fields["title"] = title.text;
    request.fields["podcast_category"] = category.toString();
    request.fields["podcast_date"] =
        '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
    request.fields["podcast_time"] =
        '${selectedTime?.hour ?? 0}:${selectedTime?.minute ?? 0}:00';
    request.fields["podcast_type"] = types.toString();
    if (storedImage?.path != null) {
      var profileim = await http.MultipartFile.fromPath("cover", image!.path);
      request.files.add(profileim);
      print('object' + profileim.toString());
    }

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    //var data = json.decode(response);
    schedulepodcastdata = schedulePodcastModelFromJson(respStr);
    if (schedulepodcastdata!.status == true) {
      //Fluttertoast.showToast(msg: schedulepodcastdata!.msg.toString());
      title.clear();
      storedImage = null;
      selectedDate = DateTime.now();
      hideLoading();

      // Get.offAll(ArtistHome());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: schedulepodcastdata!.msg.toString());
    }
  }

  StartPodcastModel? startpodcastdata;
  Future<void> startpodcastdapi(podcastId) async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
      "api_key": API().gapikey,
      "artist_id": GetStorage().read('artidtid'),
      "podcast_id": podcastId
    });
    var response = await BaseClient1()
        .post(API().startpodcast, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    startpodcastdata = startPodcastModelFromJson(response);
    if (startpodcastdata!.status == true) {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: startpodcastdata!.status.toString());
    }
  }

  InitialCallModel? initialcalldata;
  Future<void> initialcallapi(roomId) async {
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
      "RoomId": roomId.toString(),
    });
    print('rrrrrrrrrrrrrrrrrr' + "${body}");

    var response = await BaseClient1()
        .post(API().initialcall, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    initialcalldata = initialCallModelFromJson(response);
    if (initialcalldata!.message == 'succeed') {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      print('rrrrrrrrrrrrrrrrrr' + "${initialcalldata!.message}");
      Fluttertoast.showToast(msg: initialcalldata!.message.toString());
    }
  }

  StopPodcastModel? stoppodcastdata;
  Future<void> stoppodcastapi(roomId, taskid) async {
    final AuthCon acon = Get.put(AuthCon());
    var body =
        jsonEncode({"RoomId": roomId.toString(), "TaskId": taskid.toString()});
    print('rrrrrrrrrrrrrrrrrr' + "${body}");

    var response = await BaseClient1()
        .post(API().stoppodcast, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    stoppodcastdata = stopPodcastModelFromJson(response);
    if (stoppodcastdata!.status == 'succeed') {
      //Fluttertoast.showToast(msg: podcastdashboarddata!.status.toString());
    } else {
      //Get.to(() => Register());
      print('rrrrrrrrrrrrrrrrrr' + "${stoppodcastdata!.status}");
      Fluttertoast.showToast(msg: stoppodcastdata!.status.toString());
    }
  }
}
