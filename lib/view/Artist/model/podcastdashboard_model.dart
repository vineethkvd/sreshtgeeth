// To parse this JSON data, do
//
//     final podcastDashboardModel = podcastDashboardModelFromJson(jsonString);

import 'dart:convert';

PodcastDashboardModel podcastDashboardModelFromJson(String str) =>
    PodcastDashboardModel.fromJson(json.decode(str));

String podcastDashboardModelToJson(PodcastDashboardModel data) =>
    json.encode(data.toJson());

class PodcastDashboardModel {
  String status;
  List<UpcomingList> upcomingList;
  List<PodcastList> podcastList;

  PodcastDashboardModel({
    required this.status,
    required this.upcomingList,
    required this.podcastList,
  });

  factory PodcastDashboardModel.fromJson(Map<String, dynamic> json) =>
      PodcastDashboardModel(
        status: json["status"],
        upcomingList: List<UpcomingList>.from(
            json["Upcoming_List"].map((x) => UpcomingList.fromJson(x))),
        podcastList: List<PodcastList>.from(
            json["Podcast_List"].map((x) => PodcastList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Upcoming_List":
            List<dynamic>.from(upcomingList.map((x) => x.toJson())),
        "Podcast_List": List<dynamic>.from(podcastList.map((x) => x.toJson())),
      };
}

class PodcastList {
  String heading;
  List<PodcastListElement> podcastList;

  PodcastList({
    required this.heading,
    required this.podcastList,
  });

  factory PodcastList.fromJson(Map<String, dynamic> json) => PodcastList(
        heading: json["Heading"],
        podcastList: List<PodcastListElement>.from(
            json["Podcast List"].map((x) => PodcastListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Heading": heading,
        "Podcast List": List<dynamic>.from(podcastList.map((x) => x.toJson())),
      };
}

class PodcastListElement {
  int podcastId;
  String podcastTitle;
  String rjPodcastType;
  //String liveTime;
  dynamic podcastLink;
  String cover;

  PodcastListElement({
    required this.podcastId,
    required this.podcastTitle,
    required this.rjPodcastType,
    //required this.liveTime,
    required this.podcastLink,
    required this.cover,
  });

  factory PodcastListElement.fromJson(Map<String, dynamic> json) =>
      PodcastListElement(
        podcastId: json["podcast_id"],
        podcastTitle: json["podcast_title"],
        rjPodcastType: json["rj_podcast_type"],
        // liveTime: json["live_time"],
        podcastLink: json["podcast_link"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "podcast_id": podcastId,
        "podcast_title": podcastTitle,
        "rj_podcast_type": rjPodcastType,
        //"live_time": liveTime,
        "podcast_link": podcastLink,
        "cover": cover,
      };
}

class UpcomingList {
  int podcastId;
  String podcastUniqueId;
  String podcastTitle;
  String rjPodcastCategoryTitle;
  String rjPodcastType;
  String liveTime;
  String scheduledDate;
  String scheduledTime;
  String cover;
  String status;
  String liveStatus;

  UpcomingList({
    required this.podcastId,
    required this.podcastUniqueId,
    required this.podcastTitle,
    required this.rjPodcastCategoryTitle,
    required this.rjPodcastType,
    required this.liveTime,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.cover,
    required this.status,
    required this.liveStatus,
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
      };
}
