// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String status;
    List<Gener> gener;

    CategoryModel({
        required this.status,
        required this.gener,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        gener: List<Gener>.from(json["Gener"].map((x) => Gener.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Gener": List<dynamic>.from(gener.map((x) => x.toJson())),
    };
}

class Gener {
    int rjGenersId;
    String rjGenersName;
    String cover;

    Gener({
        required this.rjGenersId,
        required this.rjGenersName,
        required this.cover,
    });

    factory Gener.fromJson(Map<String, dynamic> json) => Gener(
        rjGenersId: json["rj_geners_id"],
        rjGenersName: json["rj_geners_name"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "rj_geners_id": rjGenersId,
        "rj_geners_name": rjGenersName,
        "cover": cover,
    };
}
