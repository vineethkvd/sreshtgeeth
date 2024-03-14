// To parse this JSON data, do
//
//     final upldateProfileModel = upldateProfileModelFromJson(jsonString);

import 'dart:convert';

UpldateProfileModel upldateProfileModelFromJson(String str) => UpldateProfileModel.fromJson(json.decode(str));

String upldateProfileModelToJson(UpldateProfileModel data) => json.encode(data.toJson());

class UpldateProfileModel {
    bool status;
    dynamic songId;
    String msg;

    UpldateProfileModel({
        required this.status,
        required this.songId,
        required this.msg,
    });

    factory UpldateProfileModel.fromJson(Map<String, dynamic> json) => UpldateProfileModel(
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
