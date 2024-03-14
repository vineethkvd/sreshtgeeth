// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

import 'dart:convert';

TrendingModel trendingModelFromJson(String str) => TrendingModel.fromJson(json.decode(str));

String trendingModelToJson(TrendingModel data) => json.encode(data.toJson());

class TrendingModel {
    String status;
    List<TrendingSong> trendingSong;

    TrendingModel({
        required this.status,
        required this.trendingSong,
    });

    factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        status: json["status"],
        trendingSong: List<TrendingSong>.from(json["Trending_Song"].map((x) => TrendingSong.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Trending_Song": List<dynamic>.from(trendingSong.map((x) => x.toJson())),
    };
}

class TrendingSong {
    int songId;
    String songTitle;
    String cover;

    TrendingSong({
        required this.songId,
        required this.songTitle,
        required this.cover,
    });

    factory TrendingSong.fromJson(Map<String, dynamic> json) => TrendingSong(
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
