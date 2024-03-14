// To parse this JSON data, do
//
//     final podcastLibraryModel = podcastLibraryModelFromJson(jsonString);

import 'dart:convert';

PodcastLibraryModel podcastLibraryModelFromJson(String str) => PodcastLibraryModel.fromJson(json.decode(str));

String podcastLibraryModelToJson(PodcastLibraryModel data) => json.encode(data.toJson());

class PodcastLibraryModel {
    String status;
    List<DownlaodList> recentPodcast;
    List<DownlaodList> downlaodList;

    PodcastLibraryModel({
        required this.status,
        required this.recentPodcast,
        required this.downlaodList,
    });

    factory PodcastLibraryModel.fromJson(Map<String, dynamic> json) => PodcastLibraryModel(
        status: json["status"],
        recentPodcast: List<DownlaodList>.from(json["RecentPodcast"].map((x) => DownlaodList.fromJson(x))),
        downlaodList: List<DownlaodList>.from(json["DownlaodList"].map((x) => DownlaodList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "RecentPodcast": List<dynamic>.from(recentPodcast.map((x) => x.toJson())),
        "DownlaodList": List<dynamic>.from(downlaodList.map((x) => x.toJson())),
    };
}

class DownlaodList {
    int podcastId;
    String rjPodcastTitle;
    String podcastCover;
    String? playDate;

    DownlaodList({
        required this.podcastId,
        required this.rjPodcastTitle,
        required this.podcastCover,
        this.playDate,
    });

    factory DownlaodList.fromJson(Map<String, dynamic> json) => DownlaodList(
        podcastId: json["podcast_id"],
        rjPodcastTitle: json["rj_podcast_title"],
        podcastCover: json["podcast_cover"],
        playDate: json["play_date"],
    );

    Map<String, dynamic> toJson() => {
        "podcast_id": podcastId,
        "rj_podcast_title": rjPodcastTitle,
        "podcast_cover": podcastCover,
        "play_date": playDate,
    };
}
