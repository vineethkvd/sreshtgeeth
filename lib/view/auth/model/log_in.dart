// To parse this JSON data, do
//
//     final mLogin = mLoginFromJson(jsonString);

import 'dart:convert';

MLogin mLoginFromJson(String str) => MLogin.fromJson(json.decode(str));

String mLoginToJson(MLogin data) => json.encode(data.toJson());

class MLogin {
    bool status;
    String msg;
    String phone;
    int otp;
    List<Datum> data;

    MLogin({
        required this.status,
        required this.msg,
        required this.phone,
        required this.otp,
        required this.data,
    });

    factory MLogin.fromJson(Map<String, dynamic> json) => MLogin(
        status: json["status"],
        msg: json["msg"],
        phone: json["phone"],
        otp: json["otp"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "phone": phone,
        "otp": otp,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int cusId;
    dynamic uniqueId;
    String cusName;
    int cusStatus;

    Datum({
        required this.cusId,
        required this.uniqueId,
        required this.cusName,
        required this.cusStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cusId: json["cus_id"],
        uniqueId: json["unique_id"],
        cusName: json["cus_name"],
        cusStatus: json["cus_status"],
    );

    Map<String, dynamic> toJson() => {
        "cus_id": cusId,
        "unique_id": uniqueId,
        "cus_name": cusName,
        "cus_status": cusStatus,
    };
}
