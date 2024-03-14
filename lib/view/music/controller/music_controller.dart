import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:sreshtgeeth/model/add_to_playlist.dart';
import 'package:sreshtgeeth/view/bottomsheet/controller/podcastuser_controller.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';
import '../../../api_endpoints.dart';
import '../../../base_client.dart';
import 'package:http/http.dart' as http;

import '../../../model/download_song.dart';
import '../model/albumdetail_model.dart';
import '../model/artistdetail_model.dart';
import '../model/like_model.dart';
import '../model/songcount_model.dart';
import '../model/unlike_model.dart';
import '../model/updatetime_model.dart';

class MusicCon extends GetxController with BaseController {
  PodcastUserCon podcastUserCon = PodcastUserCon();
  AudioPlayer audioPlayer = AudioPlayer();
  var id = 0;
  var idd = 0;
  String songtype = '';
  var isplaying = false;
  SiriWaveController siriWaveController = SiriWaveController();

  ValueNotifier<bool> musicplay = ValueNotifier(false);
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();
  var lobs = true.obs;
  var otp = ''.obs;
  var storage = GetStorage();
  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();
  List<Song1> albumsong = [];

  var songtitle = ''.obs;
  var songartist = ''.obs;
  var songcover = ''.obs;
  AlbumDetailModel? albumdetaildata;
  List<AudioSource> uriList = [];
  Future<void> albumdetailapi(id, types, songid, songtitle, int index) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
      "album_id": id,
      "type": types,
      "song_id":songid
    });
    var response = await BaseClient()
        .post(API().albumdetail, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    print(response);
    albumdetaildata = albumDetailModelFromJson(response);

    if (albumdetaildata!.status == 'Success') {
      if (types == "song") {
        if (index != 0) {
          albumsong = albumdetaildata!.song;
          final Song1 user =
              albumsong.where((e) => e.songTitle == songtitle.toString()).first;
          albumsong.remove(user);
          albumsong.insert(0, user);
          albumdetaildata!.song = albumsong;
        }
        print(albumsong);
        for (int i = 0; i < albumdetaildata!.song.length; i++) {
          //print('ccccccccccccccccc'+albumdetaildata!.song[i].songLink);
          try {
            if (albumdetaildata!.song[i].songLink != "") {
              uriList.add(
                  AudioSource.uri(Uri.parse(albumdetaildata!.song[i].songLink),
                      tag: MediaItem(
                        id: albumdetaildata!.song[i].songId.toString(),
                        title: albumdetaildata!.song[i].songTitle,
                        artist: albumdetaildata!.song[i].songArtist,
                        artUri: Uri.parse(albumdetaildata!.song[i].cover),
                        playable: albumdetaildata!.song[i].likeStatus,
                      )));
            }
          } catch (e) {}
          print(uriList);
          //   Get.to(MusicPlayer(id: id,));
        }
      }
      for (int i = 0; i < albumdetaildata!.song.length; i++) {
        //print('ccccccccccccccccc'+albumdetaildata!.song[i].songLink);
        try {
          if (albumdetaildata!.song[i].songLink != "") {
            uriList.add(AudioSource.uri(
              Uri.parse('${albumdetaildata!.song[i].songLink}'),
              tag: MediaItem(
                id: albumdetaildata!.song[i].songId.toString(),
                title: albumdetaildata!.song[i].songTitle,
                artist: albumdetaildata!.song[i].songArtist,
                artUri: Uri.parse(
                  albumdetaildata!.song[i].cover,
                ),
                playable: albumdetaildata!.song[i].likeStatus,
              ),
            ));
          }
          print(albumdetaildata!.song[i].songTitle);
        } catch (e) {}
        print(uriList);
        //   Get.to(MusicPlayer(id: id,));
      }
      //Fluttertoast.showToast(msg: albumdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: albumdetaildata!.status.toString());
    }
  }

  ArtistDetailModel? artistdetaildata;
  Future<void> artistdetailapi(id) async {
    var cus = GetStorage().read('cusId');
    var body =
        jsonEncode({"api_key": API().gapikey, "cus_id": cus, "artist_id": id});
    var response = await BaseClient()
        .post(API().artistdetail, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    artistdetaildata = artistDetailModelFromJson(response);
    if (artistdetaildata!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    }
  }

  LikeModel? likedata;
  Future<void> songlikeapi(id) async {
    var cus = GetStorage().read('cusId');
    var body =
        jsonEncode({"api_key": API().gapikey, "cus_id": cus, "song_id": id});
    var response =
        await BaseClient().post(API().likesong, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    likedata = likeModelFromJson(response);
    if (likedata!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: likedata!.status.toString());
    }
  }

  Addtoplaylist? toplaylist;
  Future<void> playlisttoadd(id) async {
    var cus = GetStorage().read('cusId');
    var body =
    jsonEncode({"api_key": API().gapikey, "cus_id": cus, "song_id": id});
    var response =
    await BaseClient().post(API().addtoplaylist, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    toplaylist = addtoplaylistFromJson(response);
    if (toplaylist!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: toplaylist!.status.toString());
    }
  }


  DownloadSong? download;
  Future<void> download12(id) async {
    var cus = GetStorage().read('cusId');
    var body =
    jsonEncode({"api_key": API().gapikey, "cus_id": cus, "song_id": id});
    var response =
    await BaseClient().post(API().downloadsong, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    download = downloadSongFromJson(response);
    if (download!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: download!.status.toString());
    }
  }

  UnlikeModel? unlikedata;
  Future<void> songunlikeapi(id) async {
    var cus = GetStorage().read('cusId');
    var body =
        jsonEncode({"api_key": API().gapikey, "cus_id": cus, "song_id": id});
    var response =
        await BaseClient().post(API().unlikesong, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    unlikedata = unlikeModelFromJson(response);
    if (unlikedata!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: unlikedata!.status.toString());
    }
  }

  SongCountModel? songcountdata;
  Future<void> songcountapi(songid, albumid) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
      "song_id": songid,
      //"artist_id": artistid,
      "album_id": albumid,
    });
    var response =
        await BaseClient().post(API().songcount, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    songcountdata = songCountModelFromJson(response);
    if (songcountdata!.status == 'Success') {
      //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    } else {
      Fluttertoast.showToast(msg: songcountdata!.status.toString());
    }
  }

  UpdateTimeModel? updatetimedata;
  Future<void> updatetimeapi(songid, albumid, timing) async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
      "song_id": songid,
      "album_id": albumid,
      "timing": timing,
    });
    var response =
        await BaseClient().post(API().updatetime, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    // updatetimedata = updateTimeModelFromJson(response);
    // if (updatetimedata!.status == 'Success') {
    //   //Fluttertoast.showToast(msg: artistdetaildata!.status.toString());
    // } else {
    //   Fluttertoast.showToast(msg: updatetimedata!.status.toString());
    // }
  }
}


