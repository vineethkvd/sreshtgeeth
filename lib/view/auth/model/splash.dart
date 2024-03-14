// To parse this JSON data, do
//
//     final mSplash1 = mSplash1FromJson(jsonString);

import 'dart:convert';

MSplash1 mSplash1FromJson(String str) => MSplash1.fromJson(json.decode(str));

String mSplash1ToJson(MSplash1 data) => json.encode(data.toJson());

class MSplash1 {
    String status;
    List<SplashList> splashList;

    MSplash1({
        required this.status,
        required this.splashList,
    });

    factory MSplash1.fromJson(Map<String, dynamic> json) => MSplash1(
        status: json["status"],
        splashList: List<SplashList>.from(json["Splash List"].map((x) => SplashList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Splash List": List<dynamic>.from(splashList.map((x) => x.toJson())),
    };
}

class SplashList {
    String heading;
    String content;

    SplashList({
        required this.heading,
        required this.content,
    });

    factory SplashList.fromJson(Map<String, dynamic> json) => SplashList(
        heading: json["heading"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "heading": heading,
        "content": content,
    };
}
