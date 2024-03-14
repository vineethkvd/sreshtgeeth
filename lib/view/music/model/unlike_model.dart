// To parse this JSON data, do
//
//     final unlikeModel = unlikeModelFromJson(jsonString);

import 'dart:convert';

UnlikeModel unlikeModelFromJson(String str) =>
    UnlikeModel.fromJson(json.decode(str));

String unlikeModelToJson(UnlikeModel data) => json.encode(data.toJson());

class UnlikeModel {
  bool? status;
  String? msg;

  UnlikeModel({
    this.status,
    this.msg,
  });

  factory UnlikeModel.fromJson(Map<String, dynamic> json) => UnlikeModel(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
