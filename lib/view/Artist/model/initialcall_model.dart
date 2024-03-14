// To parse this JSON data, do
//
//     final initialCallModel = initialCallModelFromJson(jsonString);

import 'dart:convert';

InitialCallModel initialCallModelFromJson(String str) =>
    InitialCallModel.fromJson(json.decode(str));

String initialCallModelToJson(InitialCallModel data) =>
    json.encode(data.toJson());

class InitialCallModel {
  int? code;
  String? message;
  String? requestId;
  Data? data;

  InitialCallModel({
    this.code,
    this.message,
    this.requestId,
    this.data,
  });

  factory InitialCallModel.fromJson(Map<String, dynamic> json) =>
      InitialCallModel(
        code: json["Code"],
        message: json["Message"],
        requestId: json["RequestId"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "RequestId": requestId,
        "Data": data?.toJson(),
      };
}

class Data {
  String? taskId;

  Data({
    this.taskId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        taskId: json["TaskId"],
      );

  Map<String, dynamic> toJson() => {
        "TaskId": taskId,
      };
}
