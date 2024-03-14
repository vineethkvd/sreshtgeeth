// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
    bool status;
    String msg;
    String cusId;

    RegisterUserModel({
        required this.status,
        required this.msg,
        required this.cusId,
    });

    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
        status: json["status"],
        msg: json["msg"],
        cusId: json["cus_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "cus_id": cusId,
    };
}
