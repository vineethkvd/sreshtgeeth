// To parse this JSON data, do
//
//     final stopPodcastModel = stopPodcastModelFromJson(jsonString);

import 'dart:convert';

StopPodcastModel stopPodcastModelFromJson(String str) =>
    StopPodcastModel.fromJson(json.decode(str));

String stopPodcastModelToJson(StopPodcastModel data) =>
    json.encode(data.toJson());

class StopPodcastModel {
  bool? status;
  String? msg;

  StopPodcastModel({
    this.status,
    this.msg,
  });

  factory StopPodcastModel.fromJson(Map<String, dynamic> json) =>
      StopPodcastModel(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
