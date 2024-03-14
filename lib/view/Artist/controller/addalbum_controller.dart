import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
import '../model/addalbum_model.dart';
import '../model/albumlist_model.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';

class AddAlbumCon extends GetxController with BaseController {

  //token
  String? token;
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
  final TextEditingController album= TextEditingController();
  final TextEditingController passwordCon= TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  
  var load = false.obs;
  AddAlbumModel? albumdata;
  Future<void> albumapi() async {
    load.value = true;
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    final uri = Uri.parse(API().baseURL1 + API().addalbum);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(
      {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    request.fields["api_key"] = API().gapikey;
    request.fields["title"] = album.text;
    request.fields["artist_id"] = www;
    if (storedImage?.path != null) {
      var profileim = await http.MultipartFile.fromPath(
          "cover", image!.path);
      request.files.add(profileim);
      print('object' + profileim.toString());
    }
    
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    
    //var data = json.decode(response);
    
    albumdata = addAlbumModelFromJson(respStr);
    if (albumdata!.status == true) {
      load.value = false;
      album.clear();
      storedImage = null;
      //Fluttertoast.showToast(msg: albumdata!.msg.toString());
      
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: albumdata!.msg.toString());
    }
  }

  AlbumListModel? listdata;
  List<DropDownValueModel> titlelist = [];
  Future<void> albumlistapi() async {
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": www
});
    var response = await BaseClient1()
        .post(API().albumlist, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    listdata = albumListModelFromJson(response);
    if (listdata!.status == 'Success') {
     // Fluttertoast.showToast(msg: listdata!.status.toString());
      for (int i = 0; i < listdata!.albumList.length; i++) {
        titlelist.add(DropDownValueModel(
            name: listdata!.albumList[i].albumName,
            value: listdata!.albumList[i].albumId));
            print('wwwwwwwwwwwwwwwwwww' + titlelist.length.toString());
      }

      //GetStorage().write('artidtid', logindata!.data[0].artistId.toString());
      //print('hiiii' + logindata!.data[0].artistId.toString());
      // navController.index = 0;
      } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: listdata!.status.toString());
    }
  }


}
