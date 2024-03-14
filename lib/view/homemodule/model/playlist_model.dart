// To parse this JSON data, do
//
//     final playlistModel = playlistModelFromJson(jsonString);

import 'dart:convert';

PlaylistModel playlistModelFromJson(String str) => PlaylistModel.fromJson(json.decode(str));

String playlistModelToJson(PlaylistModel data) => json.encode(data.toJson());

class PlaylistModel {
    String status;
    List<PlayList> playList;

    PlaylistModel({
        required this.status,
        required this.playList,
    });

    factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
        status: json["status"],
        playList: List<PlayList>.from(json["PlayList"].map((x) => PlayList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "PlayList": List<dynamic>.from(playList.map((x) => x.toJson())),
    };
}

class PlayList {
    int songId;
    String songTitle;
    String cover;

    PlayList({
        required this.songId,
        required this.songTitle,
        required this.cover,
    });

    factory PlayList.fromJson(Map<String, dynamic> json) => PlayList(
        songId: json["song_id"],
        songTitle: json["song_title"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "cover": cover,
    };
}
