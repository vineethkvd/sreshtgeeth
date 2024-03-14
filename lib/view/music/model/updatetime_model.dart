// To parse this JSON data, do
//
//     final updateTimeModel = updateTimeModelFromJson(jsonString);

import 'dart:convert';

UpdateTimeModel updateTimeModelFromJson(String str) =>
    UpdateTimeModel.fromJson(json.decode(str));

String updateTimeModelToJson(UpdateTimeModel data) =>
    json.encode(data.toJson());

class UpdateTimeModel {
  bool? status;
  String? msg;

  UpdateTimeModel({
    this.status,
    this.msg,
  });

  factory UpdateTimeModel.fromJson(Map<String, dynamic> json) =>
      UpdateTimeModel(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
