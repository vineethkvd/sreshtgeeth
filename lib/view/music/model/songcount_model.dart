// To parse this JSON data, do
//
//     final songCountModel = songCountModelFromJson(jsonString);

import 'dart:convert';

SongCountModel songCountModelFromJson(String str) =>
    SongCountModel.fromJson(json.decode(str));

String songCountModelToJson(SongCountModel data) => json.encode(data.toJson());

class SongCountModel {
  bool? status;
  String? msg;

  SongCountModel({
    this.status,
    this.msg,
  });

  factory SongCountModel.fromJson(Map<String, dynamic> json) => SongCountModel(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
