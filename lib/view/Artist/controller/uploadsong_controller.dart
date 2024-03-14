import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/base_client1.dart';
import 'package:sreshtgeeth/view/Artist/model/genrelist_model.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../../../controller/auth.dart';
import '../artist/artistOTP.dart';
import '../artistHomepage.dart';
import '../model/addalbum_model.dart';
import '../model/albumlist_model.dart';
import '../model/languagelist_model.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';
import '../model/tracklist_model.dart';
import '../model/trackupload_model.dart';
import '../model/uploadsong_model.dart';
import '../songupload/trackupload.dart';

class UploadSongCon extends GetxController with BaseController {

  //token
  String? token;
  File? storedImage;
  File? image;
  //ll
  

  
   //String filePath = '';
   String filePathh = '';
   //File? selectedfile;
   File? selectedfiles;  


  bool? isLoaded;
  var lat;
  var lon;
  var timeNotifier = ''.obs;

  //background
  //var task ='firstTask';
  //otp
  final TextEditingController passwordCon= TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  
  TextEditingController omr = TextEditingController();
  TextEditingController album = TextEditingController();
  TextEditingController track = TextEditingController();
  TextEditingController instrumental = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController artist = TextEditingController();
  TextEditingController featuring = TextEditingController();
  TextEditingController lyricist = TextEditingController();
  TextEditingController composition = TextEditingController();
  TextEditingController music = TextEditingController();
  TextEditingController production = TextEditingController();
  TextEditingController isrc = TextEditingController();
  TextEditingController genere = TextEditingController();
  TextEditingController advise = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController label = TextEditingController();
  TextEditingController release = TextEditingController();
  var load = false.obs;

  
  List<DropDownValueModel> tracklist = [];
  TrackListModel? tracklistdata;
  Future<void> tracklistapi() async {
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
});
    var response = await BaseClient1()
        .post(API().tracklist, body)
        .catchError(handleError);
    if (response == null) return;
    tracklistdata = trackListModelFromJson(response);
    if (tracklistdata!.status == 'Success') {
      //Fluttertoast.showToast(msg: tracklistdata!.status.toString());
      for (int i = 0; i < tracklistdata!.trackList.length; i++) {
        tracklist.add(DropDownValueModel(
            name: tracklistdata!.trackList[i].trackTitle,
            value: tracklistdata!.trackList[i].trackId));
            print('wwwwwwwwwwwwwwwwwww' + tracklistdata!.trackList.length.toString());
      }
      } else {
      Fluttertoast.showToast(msg: tracklistdata!.status.toString());
    }
  }

  List<DropDownValueModel> languagelist = [];
  LanguageListModel? languagelistdata;
  Future<void> languagelistapi() async {
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
});
    var response = await BaseClient1()
        .post(API().languagelist, body)
        .catchError(handleError);
    if (response == null) return;
    languagelistdata = languageListModelFromJson(response);
    if (languagelistdata!.status == 'Success') {
      //Fluttertoast.showToast(msg: languagelistdata!.status.toString());
      for (int i = 0; i < languagelistdata!.languageList.length; i++) {
        languagelist.add(DropDownValueModel(
            name: languagelistdata!.languageList[i].languageTitle,
            value: languagelistdata!.languageList[i].languageId));
            print('wwwwwwwwwwwwwwwwwww' + languagelistdata!.languageList.length.toString());
      }
      } else {
      Fluttertoast.showToast(msg: tracklistdata!.status.toString());
    }
  }


  List<DropDownValueModel> genrelist = [];
  GenreListModel? genrelistdata;
  Future<void> genrelistapi() async {
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": www
});
    var response = await BaseClient1()
        .post(API().genrelist, body)
        .catchError(handleError);
    if (response == null) return;
    genrelistdata = genreListModelFromJson(response);
    if (genrelistdata!.status == 'Success') {
      //Fluttertoast.showToast(msg: genrelistdata!.status.toString());
      for (int i = 0; i < genrelistdata!.genersList.length; i++) {
        genrelist.add(DropDownValueModel(
            name: genrelistdata!.genersList[i].genersName,
            value: genrelistdata!.genersList[i].genersId));
            print('wwwwwwwwwwwwwwwwwww' + genrelistdata!.genersList.length.toString());
      }
      } else {
      Fluttertoast.showToast(msg: genrelistdata!.status.toString());
    }
  }

  UploadSongModel? uploaddata;
  Future<void> uploadapi(albumId,track, instrument,production,genre,advice,language,date) async {
    load.value = true;
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    var body = jsonEncode({
    "api_key": API().gapikey,
    "artist_id": www,
    "album_id": albumId,
    "track_type":track,
    "instrumental_type": instrument,
    "title": title.text,
    "primary_artist": artist.text,
    "featuring": featuring.text,
    "lyricist": lyricist.text,
    "composition": composition.text,
    "music": music.text,
    "production_year": production,
    "isrc_code": isrc.text,
    "genere": genre,
    "parental_advisory": advice,
    "lyrics_language": language,
    "label_name" : label.text,
    "date_of_production": date

});
print('................................................' + body);
    var response = await BaseClient1()
        .post(API().uploadsong, body)
        .catchError(handleError);
    if (response == null) return;
    uploaddata = uploadSongModelFromJson(response);
    if (uploaddata!.status == true) {
      load.value = false;
      //Fluttertoast.showToast(msg: uploaddata!.status.toString());
      Get.to(() => trackUpload(vocal: instrument,));
      title.clear();
      artist.clear();
      isrc.clear();
      label.clear();
      music.clear();
      lyricist.clear();
      composition.clear();
      featuring.clear();

      } else {
      Fluttertoast.showToast(msg: uploaddata!.status.toString());
    }
  }


  
  TrackUploadModel? uploadtrackdata;
  Future<void> uploadtrackapi() async {
    load.value = true;
    var www =GetStorage().read('artidtid');
    final AuthCon acon = Get.put(AuthCon());
    final uri = Uri.parse(API().baseURL1 + API().uploadtrack);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(
      {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    request.fields["api_key"] = API().gapikey;
    request.fields["song_id"] = uploaddata?.songId ?? '';
    if (storedImage?.path != null) {
      var profileim = await http.MultipartFile.fromPath(
          "cover", image!.path);
      request.files.add(profileim);
      print('object' + profileim.toString());
    }

    if (selectedfiles?.path != null) {
      var profileaudio = await http.MultipartFile.fromPath(
          "audio", selectedfiles!.path);
      request.files.add(profileaudio);
      print('object' + profileaudio.toString());
    }
    
    // if (selectedfile?.path != null) {
    //   var profileaudios = await http.MultipartFile.fromPath(
    //       "vocals", selectedfile!.path);
    //   request.files.add(profileaudios);
    //   print('object' + profileaudios.toString());
    // }
    

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    
    //var data = json.decode(response);
    uploadtrackdata = trackUploadModelFromJson(respStr);
    if (uploadtrackdata!.status == true) {
      load.value = false;
      //Fluttertoast.showToast(msg: uploadtrackdata!.msg.toString());
      Get.offAll(()=>const ArtistHome());
      storedImage = null;
     // filePath = '';
      filePathh = '';
    } else {
      //Get.to(() => Register());
      Fluttertoast.showToast(msg: uploadtrackdata!.msg.toString());
    }
  }

}
