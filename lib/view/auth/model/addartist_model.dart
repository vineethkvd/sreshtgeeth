// To parse this JSON data, do
//
//     final addArtistModel = addArtistModelFromJson(jsonString);

import 'dart:convert';

AddArtistModel addArtistModelFromJson(String str) => AddArtistModel.fromJson(json.decode(str));

String addArtistModelToJson(AddArtistModel data) => json.encode(data.toJson());

class AddArtistModel {
    bool status;
    String msg;

    AddArtistModel({
        required this.status,
        required this.msg,
    });

    factory AddArtistModel.fromJson(Map<String, dynamic> json) => AddArtistModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
