// To parse this JSON data, do
//
//     final albumListModel = albumListModelFromJson(jsonString);

import 'dart:convert';

AlbumListModel albumListModelFromJson(String str) => AlbumListModel.fromJson(json.decode(str));

String albumListModelToJson(AlbumListModel data) => json.encode(data.toJson());

class AlbumListModel {
    String status;
    List<AlbumList> albumList;

    AlbumListModel({
        required this.status,
        required this.albumList,
    });

    factory AlbumListModel.fromJson(Map<String, dynamic> json) => AlbumListModel(
        status: json["status"],
        albumList: List<AlbumList>.from(json["Album List"].map((x) => AlbumList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Album List": List<dynamic>.from(albumList.map((x) => x.toJson())),
    };
}

class AlbumList {
    int albumId;
    String albumName;
    String albumCover;

    AlbumList({
        required this.albumId,
        required this.albumName,
        required this.albumCover,
    });

    factory AlbumList.fromJson(Map<String, dynamic> json) => AlbumList(
        albumId: json["album_id"],
        albumName: json["album_name"],
        albumCover: json["album_cover"],
    );

    Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "album_name": albumName,
        "album_cover": albumCover,
    };
}
