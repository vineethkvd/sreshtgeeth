// To parse this JSON data, do
//
//     final homeSongModel = homeSongModelFromJson(jsonString);

import 'dart:convert';

HomeSongModel homeSongModelFromJson(String str) => HomeSongModel.fromJson(json.decode(str));

String homeSongModelToJson(HomeSongModel data) => json.encode(data.toJson());

class HomeSongModel {
    bool status;
    List<SongList> songList;

    HomeSongModel({
        required this.status,
        required this.songList,
    });

    factory HomeSongModel.fromJson(Map<String, dynamic> json) => HomeSongModel(
        status: json["status"],
        songList: List<SongList>.from(json["song_list"].map((x) => SongList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "song_list": List<dynamic>.from(songList.map((x) => x.toJson())),
    };
}

class SongList {
    int rjSongId;
    String rjSongTitle;
    String cover;
    String addDate;
    String status;
    String playtime;

    SongList({
        required this.rjSongId,
        required this.rjSongTitle,
        required this.cover,
        required this.addDate,
        required this.status,
        required this.playtime,
    });

    factory SongList.fromJson(Map<String, dynamic> json) => SongList(
        rjSongId: json["rj_song_id"],
        rjSongTitle: json["rj_song_title"],
        cover: json["cover"],
        addDate: json["add_date"],
        status: json["status"],
        playtime: json["playtime"],
    );

    Map<String, dynamic> toJson() => {
        "rj_song_id": rjSongId,
        "rj_song_title": rjSongTitle,
        "cover": cover,
        "add_date": addDate,
        "status": status,
        "playtime": playtime,
    };
}
