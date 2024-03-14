// To parse this JSON data, do
//
//     final artistNotificationModel = artistNotificationModelFromJson(jsonString);

import 'dart:convert';

ArtistNotificationModel artistNotificationModelFromJson(String str) => ArtistNotificationModel.fromJson(json.decode(str));

String artistNotificationModelToJson(ArtistNotificationModel data) => json.encode(data.toJson());

class ArtistNotificationModel {
    String status;
    List<NotificationList> notificationList;

    ArtistNotificationModel({
        required this.status,
        required this.notificationList,
    });

    factory ArtistNotificationModel.fromJson(Map<String, dynamic> json) => ArtistNotificationModel(
        status: json["status"],
        notificationList: List<NotificationList>.from(json["Notification List"].map((x) => NotificationList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Notification List": List<dynamic>.from(notificationList.map((x) => x.toJson())),
    };
}

class NotificationList {
    String notificationId;
    String msg;
    String date;
    String time;
    dynamic genersCover;
    String? type;

    NotificationList({
        required this.notificationId,
        required this.msg,
        required this.date,
        required this.time,
        required this.genersCover,
        this.type,
    });

    factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
        notificationId: json["notification_id"],
        msg: json["msg"],
        date: json["date"],
        time: json["time"],
        genersCover: json["geners_cover"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "notification_id": notificationId,
        "msg": msg,
        "date": date,
        "time": time,
        "geners_cover": genersCover,
        "type": type,
    };
}
