// To parse this JSON data, do
//
//     final gosperModal = gosperModalFromJson(jsonString);

import 'dart:convert';

GosperModal gosperModalFromJson(String str) => GosperModal.fromJson(json.decode(str));

String gosperModalToJson(GosperModal data) => json.encode(data.toJson());

class GosperModal {
    String status;
    List<Gosper> gosper;

    GosperModal({
        required this.status,
        required this.gosper,
    });

    factory GosperModal.fromJson(Map<String, dynamic> json) => GosperModal(
        status: json["status"],
        gosper: List<Gosper>.from(json["Gosper"].map((x) => Gosper.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Gosper": List<dynamic>.from(gosper.map((x) => x.toJson())),
    };
}

class Gosper {
    int rjArtistId;
    String rjArtistName;
    String? cover;

    Gosper({
        required this.rjArtistId,
        required this.rjArtistName,
        required this.cover,
    });

    factory Gosper.fromJson(Map<String, dynamic> json) => Gosper(
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
