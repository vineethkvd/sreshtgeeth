// To parse this JSON data, do
//
//     final indianArtistModel = indianArtistModelFromJson(jsonString);

import 'dart:convert';

IndianArtistModel indianArtistModelFromJson(String str) => IndianArtistModel.fromJson(json.decode(str));

String indianArtistModelToJson(IndianArtistModel data) => json.encode(data.toJson());

class IndianArtistModel {
    String status;
    List<IndianArtist> indianArtist;

    IndianArtistModel({
        required this.status,
        required this.indianArtist,
    });

    factory IndianArtistModel.fromJson(Map<String, dynamic> json) => IndianArtistModel(
        status: json["status"],
        indianArtist: List<IndianArtist>.from(json["Indian_Artist"].map((x) => IndianArtist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Indian_Artist": List<dynamic>.from(indianArtist.map((x) => x.toJson())),
    };
}

class IndianArtist {
    int rjArtistId;
    String rjArtistName;
    String? cover;

    IndianArtist({
        required this.rjArtistId,
        required this.rjArtistName,
        required this.cover,
    });

    factory IndianArtist.fromJson(Map<String, dynamic> json) => IndianArtist(
        rjArtistId: json["rj_artist_id"],
        rjArtistName: json["rj_artist_name"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "rj_artist_id": rjArtistId,
        "rj_artist_name": rjArtistName,
        "cover": cover,
    };
}
