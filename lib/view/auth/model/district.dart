// To parse this JSON data, do
//
//     final mDistrict = mDistrictFromJson(jsonString);

import 'dart:convert';

MDistrict mDistrictFromJson(String str) => MDistrict.fromJson(json.decode(str));

String mDistrictToJson(MDistrict data) => json.encode(data.toJson());

class MDistrict {
    String status;
    List<DistrictList> districtList;

    MDistrict({
        required this.status,
        required this.districtList,
    });

    factory MDistrict.fromJson(Map<String, dynamic> json) => MDistrict(
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
