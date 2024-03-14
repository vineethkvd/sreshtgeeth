// To parse this JSON data, do
//
//     final churchModel = churchModelFromJson(jsonString);

import 'dart:convert';

ChurchModel churchModelFromJson(String str) => ChurchModel.fromJson(json.decode(str));

String churchModelToJson(ChurchModel data) => json.encode(data.toJson());

class ChurchModel {
    String status;
    List<CityList> cityList;

    ChurchModel({
        required this.status,
        required this.cityList,
    });

    factory ChurchModel.fromJson(Map<String, dynamic> json) => ChurchModel(
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
