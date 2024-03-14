// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool status;
    String msg;
    String phone;
    List<Datum> data;

    LoginModel({
        required this.status,
        required this.msg,
        required this.phone,
        required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        phone: json["phone"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "phone": phone,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int artistId;
    String artistName;
    int artistStatus;

    Datum({
        required this.artistId,
        required this.artistName,
        required this.artistStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artistId: json["artist_id"]?? '',
        artistName: json["artist_name"]??'',
        artistStatus: json["artist_status"]??'',
    );

    Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist_name": artistName,
        "artist_status": artistStatus,
    };
}
