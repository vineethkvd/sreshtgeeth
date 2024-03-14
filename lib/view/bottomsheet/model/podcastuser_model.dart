// To parse this JSON data, do
//
//     final podcastUserModel = podcastUserModelFromJson(jsonString);

import 'dart:convert';

PodcastUserModel podcastUserModelFromJson(String str) =>
    PodcastUserModel.fromJson(json.decode(str));

String podcastUserModelToJson(PodcastUserModel data) =>
    json.encode(data.toJson());

class PodcastUserModel {
  String? status;
  List<Banner>? banner;
  List<UpcomingList>? upcomingList;
  List<RecentPodcast>? recentPodcast;
  List<PodcastList>? podcastList;
  List<Follow>? follow;

  PodcastUserModel({
    this.status,
    this.banner,
    this.upcomingList,
    this.recentPodcast,
    this.podcastList,
    this.follow,
  });

  factory PodcastUserModel.fromJson(Map<String, dynamic> json) =>
      PodcastUserModel(
        status: json["status"],
        banner: json["banner"] == null
            ? []
            : List<Banner>.from(json["banner"]!.map((x) => Banner.fromJson(x))),
        upcomingList: json["Upcoming_List"] == null
            ? []
            : List<UpcomingList>.from(
                json["Upcoming_List"]!.map((x) => UpcomingList.fromJson(x))),
        recentPodcast: json["Recent_Podcast"] == null
            ? []
            : List<RecentPodcast>.from(
                json["Recent_Podcast"]!.map((x) => RecentPodcast.fromJson(x))),
        podcastList: json["Podcast_List"] == null
            ? []
            : List<PodcastList>.from(
                json["Podcast_List"]!.map((x) => PodcastList.fromJson(x))),
        follow: json["follow"] == null
            ? []
            : List<Follow>.from(json["follow"]!.map((x) => Follow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "banner": banner == null
            ? []
            : List<dynamic>.from(banner!.map((x) => x.toJson())),
        "Upcoming_List": upcomingList == null
            ? []
            : List<dynamic>.from(upcomingList!.map((x) => x.toJson())),
        "Recent_Podcast": recentPodcast == null
            ? []
            : List<dynamic>.from(recentPodcast!.map((x) => x.toJson())),
        "Podcast_List": podcastList == null
            ? []
            : List<dynamic>.from(podcastList!.map((x) => x.toJson())),
        "follow": follow == null
            ? []
            : List<dynamic>.from(follow!.map((x) => x.toJson())),
      };
}

class Banner {
  int? bannerId;
  String? bannerTitle;
  String? banner;

  Banner({
    this.bannerId,
    this.bannerTitle,
    this.banner,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerId: json["banner_id"],
        bannerTitle: json["banner_title"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_title": bannerTitle,
        "banner": banner,
      };
}

class Follow {
  int? artistId;
  String? artistName;
  String? artistCover;

  Follow({
    this.artistId,
    this.artistName,
    this.artistCover,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        artistCover: json["artist_cover"],
      );

  Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist_name": artistName,
        "artist_cover": artistCover,
      };
}

class PodcastList {
  String? heading;
  int? categoryId;
  List<RecentPodcast>? podcastList;

  PodcastList({
    this.heading,
    this.categoryId,
    this.podcastList,
  });

  factory PodcastList.fromJson(Map<String, dynamic> json) => PodcastList(
        heading: json["Heading"],
        categoryId: json["Category_id"],
        podcastList: json["Podcast List"] == null
            ? []
            : List<RecentPodcast>.from(
                json["Podcast List"]!.map((x) => RecentPodcast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Heading": heading,
        "Category_id": categoryId,
        "Podcast List": podcastList == null
            ? []
            : List<dynamic>.from(podcastList!.map((x) => x.toJson())),
      };
}

class RecentPodcast {
  int? podcastId;
  String? podcastTitle;
  String? rjPodcastType;
  String? liveTime;
  String? podcastLink;
  dynamic cover;

  RecentPodcast({
    this.podcastId,
    this.podcastTitle,
    this.rjPodcastType,
    this.liveTime,
    this.podcastLink,
    this.cover,
  });

  factory RecentPodcast.fromJson(Map<String, dynamic> json) => RecentPodcast(
        podcastId: json["podcast_id"],
        podcastTitle: json["podcast_title"],
        rjPodcastType: json["rj_podcast_type"],
        liveTime: json["live_time"],
        podcastLink: json["podcast_link"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "podcast_id": podcastId,
        "podcast_title": podcastTitle,
        "rj_podcast_type": rjPodcastType,
        "live_time": liveTime,
        "podcast_link": podcastLink,
        "cover": cover,
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
