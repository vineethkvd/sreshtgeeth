
// To parse this JSON data, do
//
//     final upcomingPodcastModel = upcomingPodcastModelFromJson(jsonString);

import 'dart:convert';

UpcomingPodcastModel upcomingPodcastModelFromJson(String str) =>
    UpcomingPodcastModel.fromJson(json.decode(str));

String upcomingPodcastModelToJson(UpcomingPodcastModel data) =>
    json.encode(data.toJson());

class UpcomingPodcastModel {
  String? status;
  List<UpcomingList>? upcomingList;

  UpcomingPodcastModel({
    this.status,
    this.upcomingList,
  });

  factory UpcomingPodcastModel.fromJson(Map<String, dynamic> json) =>
      UpcomingPodcastModel(
        status: json["status"],
        upcomingList: json["Upcoming_List"] == null
            ? []
            : List<UpcomingList>.from(
                json["Upcoming_List"]!.map((x) => UpcomingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Upcoming_List": upcomingList == null
            ? []
            : List<dynamic>.from(upcomingList!.map((x) => x.toJson())),
      };
}

class UpcomingList {
  int? podcastId;
  String? podcastUniqueId;
  String? podcastTitle;
  String? rjPodcastCategoryTitle;
  String? rjPodcastType;
  String? liveTime;
  String? scheduledDate;
  String? scheduledTime;
  String? cover;
  String? status;
  String? liveStatus;
  String? podStatus;
  DateTime? podcastEndTime;

  UpcomingList({
    this.podcastId,
    this.podcastUniqueId,
    this.podcastTitle,
    this.rjPodcastCategoryTitle,
    this.rjPodcastType,
    this.liveTime,
    this.scheduledDate,
    this.scheduledTime,
    this.cover,
    this.status,
    this.liveStatus,
    this.podStatus,
    this.podcastEndTime,
  });

  factory UpcomingList.fromJson(Map<String, dynamic> json) => UpcomingList(
        podcastId: json["podcast_id"],
        podcastUniqueId: json["podcast_unique_id"],
        podcastTitle: json["podcast_title"],
        rjPodcastCategoryTitle: json["rj_podcast_category_title"],
        rjPodcastType: json["rj_podcast_type"],
        liveTime: json["live_time"],
        scheduledDate: json["scheduled_date"],
        scheduledTime: json["scheduled_time"],
        cover: json["cover"],
        status: json["status"],
        liveStatus: json["live_status"],
        podStatus: json["pod_status"],
        podcastEndTime: json["podcast_end_time"] == null
            ? null
            : DateTime.parse(json["podcast_end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "podcast_id": podcastId,
        "podcast_unique_id": podcastUniqueId,
        "podcast_title": podcastTitle,
        "rj_podcast_category_title": rjPodcastCategoryTitle,
        "rj_podcast_type": rjPodcastType,
        "live_time": liveTime,
        "scheduled_date": scheduledDate,
        "scheduled_time": scheduledTime,
        "cover": cover,
        "status": status,
        "live_status": liveStatus,
        "pod_status": podStatus,
        "podcast_end_time": podcastEndTime?.toIso8601String(),
      };
}
