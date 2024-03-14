// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    String status;
    List<CityList> cityList;

    CityModel({
        required this.status,
        required this.cityList,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        cityList: List<CityList>.from(json["City List"].map((x) => CityList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "City List": List<dynamic>.from(cityList.map((x) => x.toJson())),
    };
}

class CityList {
    int cityId;
    String cityName;

    CityList({
        required this.cityId,
        required this.cityName,
    });

    factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        cityId: json["city_id"],
        cityName: json["city_name"],
    );

    Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city_name": cityName,
    };
}
