// To parse this JSON data, do
//
//     final uploadSongModel = uploadSongModelFromJson(jsonString);

import 'dart:convert';

UploadSongModel uploadSongModelFromJson(String str) => UploadSongModel.fromJson(json.decode(str));

String uploadSongModelToJson(UploadSongModel data) => json.encode(data.toJson());

class UploadSongModel {
    bool status;
    String songId;
    String msg;

    UploadSongModel({
        required this.status,
        required this.songId,
        required this.msg,
    });

    factory UploadSongModel.fromJson(Map<String, dynamic> json) => UploadSongModel(
        status: json["status"],
        songId: json["song_id"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "song_id": songId,
        "msg": msg,
    };
}
