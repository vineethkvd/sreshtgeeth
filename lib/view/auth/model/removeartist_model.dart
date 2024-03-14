// To parse this JSON data, do
//
//     final removeArtistModel = removeArtistModelFromJson(jsonString);

import 'dart:convert';

RemoveArtistModel removeArtistModelFromJson(String str) => RemoveArtistModel.fromJson(json.decode(str));

String removeArtistModelToJson(RemoveArtistModel data) => json.encode(data.toJson());

class RemoveArtistModel {
    bool status;
    String msg;

    RemoveArtistModel({
        required this.status,
        required this.msg,
    });

    factory RemoveArtistModel.fromJson(Map<String, dynamic> json) => RemoveArtistModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
