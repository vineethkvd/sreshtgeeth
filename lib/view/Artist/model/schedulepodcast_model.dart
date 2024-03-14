// To parse this JSON data, do
//
//     final schedulePodcastModel = schedulePodcastModelFromJson(jsonString);

import 'dart:convert';

SchedulePodcastModel schedulePodcastModelFromJson(String str) => SchedulePodcastModel.fromJson(json.decode(str));

String schedulePodcastModelToJson(SchedulePodcastModel data) => json.encode(data.toJson());

class SchedulePodcastModel {
    bool status;
    String msg;

    SchedulePodcastModel({
        required this.status,
        required this.msg,
    });

    factory SchedulePodcastModel.fromJson(Map<String, dynamic> json) => SchedulePodcastModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
