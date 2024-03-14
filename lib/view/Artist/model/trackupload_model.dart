// To parse this JSON data, do
//
//     final trackUploadModel = trackUploadModelFromJson(jsonString);

import 'dart:convert';

TrackUploadModel trackUploadModelFromJson(String str) => TrackUploadModel.fromJson(json.decode(str));

String trackUploadModelToJson(TrackUploadModel data) => json.encode(data.toJson());

class TrackUploadModel {
    bool status;
    dynamic songId;
    String msg;

    TrackUploadModel({
        required this.status,
        required this.songId,
        required this.msg,
    });

    factory TrackUploadModel.fromJson(Map<String, dynamic> json) => TrackUploadModel(
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
