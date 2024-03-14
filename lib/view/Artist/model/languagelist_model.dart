// To parse this JSON data, do
//
//     final languageListModel = languageListModelFromJson(jsonString);

import 'dart:convert';

LanguageListModel languageListModelFromJson(String str) => LanguageListModel.fromJson(json.decode(str));

String languageListModelToJson(LanguageListModel data) => json.encode(data.toJson());

class LanguageListModel {
    String status;
    List<LanguageList> languageList;

    LanguageListModel({
        required this.status,
        required this.languageList,
    });

    factory LanguageListModel.fromJson(Map<String, dynamic> json) => LanguageListModel(
        status: json["status"],
        languageList: List<LanguageList>.from(json["Language List"].map((x) => LanguageList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Language List": List<dynamic>.from(languageList.map((x) => x.toJson())),
    };
}

class LanguageList {
    int languageId;
    String languageTitle;

    LanguageList({
        required this.languageId,
        required this.languageTitle,
    });

    factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
        languageId: json["language_id"],
        languageTitle: json["language_title"],
    );

    Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "language_title": languageTitle,
    };
}
