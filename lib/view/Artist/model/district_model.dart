// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
    String status;
    List<DistrictList> districtList;

    DistrictModel({
        required this.status,
        required this.districtList,
    });

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        status: json["status"],
        districtList: List<DistrictList>.from(json["District List"].map((x) => DistrictList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "District List": List<dynamic>.from(districtList.map((x) => x.toJson())),
    };
}

class DistrictList {
    int districtId;
    String districtName;

    DistrictList({
        required this.districtId,
        required this.districtName,
    });

    factory DistrictList.fromJson(Map<String, dynamic> json) => DistrictList(
        districtId: json["district_id"],
        districtName: json["district_name"],
    );

    Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "district_name": districtName,
    };
}
