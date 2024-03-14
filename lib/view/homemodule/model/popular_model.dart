// To parse this JSON data, do
//
//     final popularModel = popularModelFromJson(jsonString);

import 'dart:convert';

PopularModel popularModelFromJson(String str) => PopularModel.fromJson(json.decode(str));

String popularModelToJson(PopularModel data) => json.encode(data.toJson());

class PopularModel {
    String status;
    List<PopularSong> popularSong;

    PopularModel({
        required this.status,
        required this.popularSong,
    });

    factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        status: json["status"],
        popularSong: List<PopularSong>.from(json["Popular_Song"].map((x) => PopularSong.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Popular_Song": List<dynamic>.from(popularSong.map((x) => x.toJson())),
    };
}

class PopularSong {
    int songId;
    String songTitle;
    String songArtist;
    String ablumId;
    int artistId;
    String cover;

    PopularSong({
        required this.songId,
        required this.songTitle,
        required this.songArtist,
        required this.ablumId,
        required this.artistId,
        required this.cover,
    });

    factory PopularSong.fromJson(Map<String, dynamic> json) => PopularSong(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        ablumId: json["ablum_id"],
        artistId: json["artist_id"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "ablum_id": ablumId,
        "artist_id": artistId,
        "cover": cover,
    };
}
