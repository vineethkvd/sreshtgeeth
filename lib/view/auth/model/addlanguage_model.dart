// To parse this JSON data, do
//
//     final addLanguageModel = addLanguageModelFromJson(jsonString);

import 'dart:convert';

AddLanguageModel addLanguageModelFromJson(String str) => AddLanguageModel.fromJson(json.decode(str));

String addLanguageModelToJson(AddLanguageModel data) => json.encode(data.toJson());

class AddLanguageModel {
    bool status;
    String msg;

    AddLanguageModel({
        required this.status,
        required this.msg,
    });

    factory AddLanguageModel.fromJson(Map<String, dynamic> json) => AddLanguageModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
