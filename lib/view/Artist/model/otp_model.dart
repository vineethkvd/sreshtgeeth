// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    bool status;
    String msg;
    String phone;
    String otp;

    OtpModel({
        required this.status,
        required this.msg,
        required this.phone,
        required this.otp,
    });

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"],
        msg: json["msg"],
        phone: json["phone"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "phone": phone,
        "otp": otp,
    };
}
