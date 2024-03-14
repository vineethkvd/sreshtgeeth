// To parse this JSON data, do
//
//     final genreListModel = genreListModelFromJson(jsonString);

import 'dart:convert';

GenreListModel genreListModelFromJson(String str) => GenreListModel.fromJson(json.decode(str));

String genreListModelToJson(GenreListModel data) => json.encode(data.toJson());

class GenreListModel {
    String status;
    List<GenersList> genersList;

    GenreListModel({
        required this.status,
        required this.genersList,
    });

    factory GenreListModel.fromJson(Map<String, dynamic> json) => GenreListModel(
        status: json["status"],
        genersList: List<GenersList>.from(json["Geners List"].map((x) => GenersList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Geners List": List<dynamic>.from(genersList.map((x) => x.toJson())),
    };
}

class GenersList {
    int genersId;
    String genersName;
    String genersCover;

    GenersList({
        required this.genersId,
        required this.genersName,
        required this.genersCover,
    });

    factory GenersList.fromJson(Map<String, dynamic> json) => GenersList(
        genersId: json["geners_id"],
        genersName: json["geners_name"],
        genersCover: json["geners_cover"],
    );

    Map<String, dynamic> toJson() => {
        "geners_id": genersId,
        "geners_name": genersName,
        "geners_cover": genersCover,
    };
}
