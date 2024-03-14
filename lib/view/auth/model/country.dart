// To parse this JSON data, do
//
//     final mCountry = mCountryFromJson(jsonString);

import 'dart:convert';

MCountry mCountryFromJson(String str) => MCountry.fromJson(json.decode(str));

String mCountryToJson(MCountry data) => json.encode(data.toJson());

class MCountry {
    String status;
    List<SplashList> splashList;

    MCountry({
        required this.status,
        required this.splashList,
    });

    factory MCountry.fromJson(Map<String, dynamic> json) => MCountry(
        status: json["status"],
        splashList: List<SplashList>.from(json["Splash List"].map((x) => SplashList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Splash List": List<dynamic>.from(splashList.map((x) => x.toJson())),
    };
}

class SplashList {
    String countryId;
    String countryName;

    SplashList({
        required this.countryId,
        required this.countryName,
    });

    factory SplashList.fromJson(Map<String, dynamic> json) => SplashList(
        countryId: json["country_id"],
        countryName: json["country_name"],
    );

    Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "country_name": countryName,
    };
}
