// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    bool status;
    int totalSubsciption;
    dynamic totalEarning;
    int follower;
    int songs;
    String totalplaytime;
    List<Datum> data;
    List<SongList> songList;

    DashboardModel({
        required this.status,
        required this.totalSubsciption,
        required this.totalEarning,
        required this.follower,
        required this.songs,
        required this.totalplaytime,
        required this.data,
        required this.songList,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        totalSubsciption: json["total_subsciption"],
        totalEarning: json["total_earning"],
        follower: json["follower"],
        songs: json["songs"],
        totalplaytime: json["totalplaytime"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        songList: List<SongList>.from(json["song_list"].map((x) => SongList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total_subsciption": totalSubsciption,
        "total_earning": totalEarning,
        "follower": follower,
        "songs": songs,
        "totalplaytime": totalplaytime,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "song_list": List<dynamic>.from(songList.map((x) => x.toJson())),
    };
}

class Datum {
    String artistName;
    String artistEmail;
    String artistPhone;
    String artistGender;
    String artistState;
    String artistCity;
    String artistDistrict;
    String artistChurch;
    dynamic artistPromocode;
    dynamic profile;

    Datum({
        required this.artistName,
        required this.artistEmail,
        required this.artistPhone,
        required this.artistGender,
        required this.artistState,
        required this.artistCity,
        required this.artistDistrict,
        required this.artistChurch,
        required this.artistPromocode,
        required this.profile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artistName: json["artist_name"],
        artistEmail: json["artist_email"],
        artistPhone: json["artist_phone"],
        artistGender: json["artist_gender"],
        artistState: json["artist_state"],
        artistCity: json["artist_city"],
        artistDistrict: json["artist_district"],
        artistChurch: json["artist_church"],
        artistPromocode: json["artist_promocode"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "artist_name": artistName,
        "artist_email": artistEmail,
        "artist_phone": artistPhone,
        "artist_gender": artistGender,
        "artist_state": artistState,
        "artist_city": artistCity,
        "artist_district": artistDistrict,
        "artist_church": artistChurch,
        "artist_promocode": artistPromocode,
        "profile": profile,
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
