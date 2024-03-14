// To parse this JSON data, do
//
//     final artistModel = artistModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

ArtistModel artistModelFromJson(String str) => ArtistModel.fromJson(json.decode(str));

String artistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
    String status;
    List<MyLanguageList> myLanguageList;

    ArtistModel({
        required this.status,
        required this.myLanguageList,
    });

    factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        status: json["status"],
        myLanguageList: List<MyLanguageList>.from(json["My Language List"].map((x) => MyLanguageList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "My Language List": List<dynamic>.from(myLanguageList.map((x) => x.toJson())),
    };
}

class MyLanguageList {
    int? artistId;
    String? artistName;
    String? profile;
    var select = false.obs;



    MyLanguageList({
        required this.artistId,
        required this.artistName,
        required this.profile,
    });

    factory MyLanguageList.fromJson(Map<String, dynamic> json) => MyLanguageList(
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist_name": artistName,
        "profile": profile,
    };
}
