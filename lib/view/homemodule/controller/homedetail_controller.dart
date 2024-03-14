import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/view/homemodule/model/gospel_model.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';
import '../model/follow_model.dart';
import '../model/indianatrist_model.dart';
import '../model/newalbum_model.dart';
import '../model/playlist_model.dart';
import '../model/popular_model.dart';
import '../model/trending_model.dart';
import '../model/search_model.dart';

class HomeDetailCon extends GetxController with BaseController {
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();

  final TextEditingController searchCon = TextEditingController();
  var lobs = true.obs;
  var otp = ''.obs;
  var driverid = ''.obs;
  var driverUnique = ''.obs;
  var driverName = ''.obs;
  var driverStatus = ''.obs;
  var details = [].obs;
  var datacaradd;
  var profiledetails;
  var forgot_id = ''.obs;
  var makePhoneCall;
  var driveruniqueId = ''.obs;
  var driveruniqueId1 = ''.obs;
  var driveruniqueId2 = ''.obs;
  var driveruniqueId3 = ''.obs;
  var driveruniqueId4 = ''.obs;
  var storage = GetStorage();
  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  NewAlbumModel? newalbumddata;
  Future<void> newalbumapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().newalbum, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    newalbumddata = newAlbumModelFromJson(response);
    if (newalbumddata!.status == 'Success') {
      // Fluttertoast.showToast(msg: newalbumddata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: newalbumddata!.status.toString());
    }
  }

  TrendingModel? trendingdata;
  Future<void> trendingapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().trending, body).catchError(handleError);
    //var data = json.decode(response);
    trendingdata = trendingModelFromJson(response);
    if (trendingdata!.status == 'Success') {
      // Fluttertoast.showToast(msg: trendingdata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: trendingdata!.status.toString());
    }
  }

  GosperModal? gospeldata;
  Future<void> gospelapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key":API().gapikey,
      "cus_id":cus,
    });
    var response1 =
        await BaseClient().post(API().gospel,body).catchError(handleError);
    //var data = json.decode(response);
    gospeldata = gosperModalFromJson(response1);
    if (gospeldata!.status == 'Success') {
      // Fluttertoast.showToast(msg: gospeldata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: gospeldata!.status.toString());
    }
  }

  CategoryModel? categorydata;
  Future<void> categoryapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().category, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    categorydata = categoryModelFromJson(response);
    if (categorydata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: categorydata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: categorydata!.status.toString());
    }
  }

  PlaylistModel? playlistdata;
  Future<void> playlistapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
        await BaseClient().post(API().playlist, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    playlistdata = playlistModelFromJson(response);
    if (playlistdata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: playlistdata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: playlistdata!.status.toString());
    }
  }

  PopularModel? populardata;
  Future<void> popularapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response = await BaseClient()
        .post(API().popularsong, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    populardata = popularModelFromJson(response);
    if (populardata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: populardata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: populardata!.status.toString());
    }
  }

  IndianArtistModel? indianartistdata;
  Future<void> indianartistapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response = await BaseClient()
        .post(API().indianartist, body)
        .catchError(handleError);
    //var data = json.decode(response);
    indianartistdata = indianArtistModelFromJson(response);
    if (indianartistdata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: indianartistdata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: indianartistdata!.status.toString());
    }
  }

  SearchModel? searchdata;
  Future<void> searchapi(searchtext) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "search": searchtext,
    });
    var response =
        await BaseClient().post(API().search, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    searchdata = searchModelFromJson(response);
    update();
    if (searchdata!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: searchdata!.status.toString());
    }
  }
  FollowModel? followdata;
  Future<void> followapi(artistId) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus.toString(),
      "artist_id": artistId
    });
    var response =
        await BaseClient().post(API().follow, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    followdata = followModelFromJson(response);
    if (followdata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: indianartistdata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: followdata!.status.toString());
    }
  }

  FollowModel? unfollowdata;
  Future<void> unfollowapi(artistId) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus.toString(),
      "artist_id": artistId
    });
    var response =
        await BaseClient().post(API().unfollow, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    unfollowdata = followModelFromJson(response);
    if (unfollowdata!.status == 'Success') {
      //  Fluttertoast.showToast(msg: indianartistdata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: unfollowdata!.status.toString());
    }
  }
}
