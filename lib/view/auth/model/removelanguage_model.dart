// To parse this JSON data, do
//
//     final removeLanguageModel = removeLanguageModelFromJson(jsonString);

import 'dart:convert';

RemoveLanguageModel removeLanguageModelFromJson(String str) => RemoveLanguageModel.fromJson(json.decode(str));

String removeLanguageModelToJson(RemoveLanguageModel data) => json.encode(data.toJson());

class RemoveLanguageModel {
    bool status;
    String msg;

    RemoveLanguageModel({
        required this.status,
        required this.msg,
    });

    factory RemoveLanguageModel.fromJson(Map<String, dynamic> json) => RemoveLanguageModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
