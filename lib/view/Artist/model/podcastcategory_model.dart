// To parse this JSON data, do
//
//     final podcastCategoryModel = podcastCategoryModelFromJson(jsonString);

import 'dart:convert';

PodcastCategoryModel podcastCategoryModelFromJson(String str) => PodcastCategoryModel.fromJson(json.decode(str));

String podcastCategoryModelToJson(PodcastCategoryModel data) => json.encode(data.toJson());

class PodcastCategoryModel {
    String status;
    List<PodcastCategoryList> podcastCategoryList;

    PodcastCategoryModel({
        required this.status,
        required this.podcastCategoryList,
    });

    factory PodcastCategoryModel.fromJson(Map<String, dynamic> json) => PodcastCategoryModel(
        status: json["status"],
        podcastCategoryList: List<PodcastCategoryList>.from(json["Podcast Category List"].map((x) => PodcastCategoryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Podcast Category List": List<dynamic>.from(podcastCategoryList.map((x) => x.toJson())),
    };
}

class PodcastCategoryList {
    int podcastCategoryId;
    String podcastCategoryTitle;

    PodcastCategoryList({
        required this.podcastCategoryId,
        required this.podcastCategoryTitle,
    });

    factory PodcastCategoryList.fromJson(Map<String, dynamic> json) => PodcastCategoryList(
        podcastCategoryId: json["podcast_category_id"],
        podcastCategoryTitle: json["podcast_category_title"],
    );

    Map<String, dynamic> toJson() => {
        "podcast_category_id": podcastCategoryId,
        "podcast_category_title": podcastCategoryTitle,
    };
}
