// To parse this JSON data, do
//
//     final addAlbumModel = addAlbumModelFromJson(jsonString);

import 'dart:convert';

AddAlbumModel addAlbumModelFromJson(String str) => AddAlbumModel.fromJson(json.decode(str));

String addAlbumModelToJson(AddAlbumModel data) => json.encode(data.toJson());

class AddAlbumModel {
    bool status;
    String msg;

    AddAlbumModel({
        required this.status,
        required this.msg,
    });

    factory AddAlbumModel.fromJson(Map<String, dynamic> json) => AddAlbumModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
