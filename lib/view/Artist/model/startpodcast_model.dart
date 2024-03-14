// To parse this JSON data, do
//
//     final startPodcastModel = startPodcastModelFromJson(jsonString);

import 'dart:convert';

StartPodcastModel startPodcastModelFromJson(String str) =>
    StartPodcastModel.fromJson(json.decode(str));

String startPodcastModelToJson(StartPodcastModel data) =>
    json.encode(data.toJson());

class StartPodcastModel {
  bool? status;
  String? msg;

  StartPodcastModel({
    this.status,
    this.msg,
  });

  factory StartPodcastModel.fromJson(Map<String, dynamic> json) =>
      StartPodcastModel(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
