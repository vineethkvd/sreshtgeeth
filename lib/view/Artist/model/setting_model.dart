// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
    bool status;
    int totalSubsciption;
    String totalEarning;
    List<Datum> data;

    SettingModel({
        required this.status,
        required this.totalSubsciption,
        required this.totalEarning,
        required this.data,
    });

    factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        status: json["status"],
        totalSubsciption: json["total_subsciption"] ?? '',
        totalEarning: json["total_earning"] ?? '',
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total_subsciption": totalSubsciption,
        "total_earning": totalEarning,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String artistName;
    String artistEmail;
    String artistPhone;
    String artistGender;
    String artistState;
    String artistCity;
    String artistDistrict;
    String artistChurch;
    String artistPromocode;
    String profile;

    Datum({
        required this.artistName,
        required this.artistEmail,
        required this.artistPhone,
        required this.artistGender,
        required this.artistState,
        required this.artistCity,
        required this.artistDistrict,
        required this.artistChurch,
        required this.artistPromocode,
        required this.profile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artistName: json["artist_name"],
        artistEmail: json["artist_email"],
        artistPhone: json["artist_phone"],
        artistGender: json["artist_gender"],
        artistState: json["artist_state"],
        artistCity: json["artist_city"],
        artistDistrict: json["artist_district"],
        artistChurch: json["artist_church"],
        artistPromocode: json["artist_promocode"] ?? '',
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "artist_name": artistName,
        "artist_email": artistEmail,
        "artist_phone": artistPhone,
        "artist_gender": artistGender,
        "artist_state": artistState,
        "artist_city": artistCity,
        "artist_district": artistDistrict,
        "artist_church": artistChurch,
        "artist_promocode": artistPromocode,
        "profile": profile,
    };
}
