// To parse this JSON data, do
//
//     final newAlbumModel = newAlbumModelFromJson(jsonString);

import 'dart:convert';

NewAlbumModel newAlbumModelFromJson(String str) => NewAlbumModel.fromJson(json.decode(str));

String newAlbumModelToJson(NewAlbumModel data) => json.encode(data.toJson());

class NewAlbumModel {
    String status;
    List<Album> album;

    NewAlbumModel({
        required this.status,
        required this.album,
    });

    factory NewAlbumModel.fromJson(Map<String, dynamic> json) => NewAlbumModel(
        status: json["status"],
        album: List<Album>.from(json["Album"].map((x) => Album.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Album": List<dynamic>.from(album.map((x) => x.toJson())),
    };
}

class Album {
    int albumId;
    String ablumTitle;
    String cover;

    Album({
        required this.albumId,
        required this.ablumTitle,
        required this.cover,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["album_id"],
        ablumTitle: json["ablum_title"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "ablum_title": ablumTitle,
        "cover": cover,
    };
}
