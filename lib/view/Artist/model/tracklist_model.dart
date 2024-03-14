// To parse this JSON data, do
//
//     final trackListModel = trackListModelFromJson(jsonString);

import 'dart:convert';

TrackListModel trackListModelFromJson(String str) => TrackListModel.fromJson(json.decode(str));

String trackListModelToJson(TrackListModel data) => json.encode(data.toJson());

class TrackListModel {
    String status;
    List<TrackList> trackList;

    TrackListModel({
        required this.status,
        required this.trackList,
    });

    factory TrackListModel.fromJson(Map<String, dynamic> json) => TrackListModel(
        status: json["status"],
        trackList: List<TrackList>.from(json["Track List"].map((x) => TrackList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Track List": List<dynamic>.from(trackList.map((x) => x.toJson())),
    };
}

class TrackList {
    int trackId;
    String trackTitle;

    TrackList({
        required this.trackId,
        required this.trackTitle,
    });

    factory TrackList.fromJson(Map<String, dynamic> json) => TrackList(
        trackId: json["track_id"],
        trackTitle: json["track_title"],
    );

    Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_title": trackTitle,
    };
}
