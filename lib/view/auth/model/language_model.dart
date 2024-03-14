
// To parse this JSON data, do
//
//     final selectLanguageModel = selectLanguageModelFromJson(jsonString);

import 'dart:convert';

SelectLanguageModel selectLanguageModelFromJson(String str) => SelectLanguageModel.fromJson(json.decode(str));

String selectLanguageModelToJson(SelectLanguageModel data) => json.encode(data.toJson());

class SelectLanguageModel {
    String status;
    List<LanguageList> languageList;

    SelectLanguageModel({
        required this.status,
        required this.languageList,
    });

    factory SelectLanguageModel.fromJson(Map<String, dynamic> json) => SelectLanguageModel(
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
    bool istapped = false;

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




















