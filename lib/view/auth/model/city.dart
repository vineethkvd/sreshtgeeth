// To parse this JSON data, do
//
//     final mCity = mCityFromJson(jsonString);

import 'dart:convert';

MCity mCityFromJson(String str) => MCity.fromJson(json.decode(str));

String mCityToJson(MCity data) => json.encode(data.toJson());

class MCity {
    String status;
    List<CityList> cityList;

    MCity({
        required this.status,
        required this.cityList,
    });

    factory MCity.fromJson(Map<String, dynamic> json) => MCity(
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
