// To parse this JSON data, do
//
//     final mChurch = mChurchFromJson(jsonString);

import 'dart:convert';

MChurch mChurchFromJson(String str) => MChurch.fromJson(json.decode(str));

String mChurchToJson(MChurch data) => json.encode(data.toJson());

class MChurch {
    String status;
    List<CityList> cityList;

    MChurch({
        required this.status,
        required this.cityList,
    });

    factory MChurch.fromJson(Map<String, dynamic> json) => MChurch(
        status: json["status"],
        cityList: List<CityList>.from(json["City List"].map((x) => CityList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "City List": List<dynamic>.from(cityList.map((x) => x.toJson())),
    };
}

class CityList {
    int churchId;
    String churchName;

    CityList({
        required this.churchId,
        required this.churchName,
    });

    factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        churchId: json["church_id"],
        churchName: json["church_name"],
    );

    Map<String, dynamic> toJson() => {
        "church_id": churchId,
        "church_name": churchName,
    };
}
