// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  String? status;
  List<Recent>? recent;
  List<Album>? album;
  List<Recent>? songs;

  SearchModel({
    this.status,
    this.recent,
    this.album,
    this.songs,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        recent: json["Recent"] == null
            ? []
            : List<Recent>.from(json["Recent"]!.map((x) => Recent.fromJson(x))),
        album: json["Album"] == null
            ? []
            : List<Album>.from(json["Album"]!.map((x) => Album.fromJson(x))),
        songs: json["Songs"] == null
            ? []
            : List<Recent>.from(json["Songs"]!.map((x) => Recent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Recent": recent == null
            ? []
            : List<dynamic>.from(recent!.map((x) => x.toJson())),
        "Album": album == null
            ? []
            : List<dynamic>.from(album!.map((x) => x.toJson())),
        "Songs": songs == null
            ? []
            : List<dynamic>.from(songs!.map((x) => x.toJson())),
      };
}

class Album {
  int? albumId;
  AblumTitle? ablumTitle;
  AlbumType? type;
  String? cover;

  Album({
    this.albumId,
    this.ablumTitle,
    this.type,
    this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["album_id"],
        ablumTitle: ablumTitleValues.map[json["ablum_title"]]!,
        type: albumTypeValues.map[json["type"]]!,
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "ablum_title": ablumTitleValues.reverse[ablumTitle],
        "type": albumTypeValues.reverse[type],
        "cover": cover,
      };
}

enum AblumTitle { JESUS_MY_HERO, SARVANGA_SUNDARA, TALACHUKUNTE_CHALUNAYA }

final ablumTitleValues = EnumValues({
  "Jesus My Hero ": AblumTitle.JESUS_MY_HERO,
  "Sarvanga Sundara ": AblumTitle.SARVANGA_SUNDARA,
  "Talachukunte Chalunaya ": AblumTitle.TALACHUKUNTE_CHALUNAYA
});

enum AlbumType { ALBUM }

final albumTypeValues = EnumValues({"Album": AlbumType.ALBUM});

class Recent {
  int? songId;
  String? songTitle;
  String? songArtist;
  String? ablumId;
  int? artistId;
  RecentType? type;
  String? cover;

  Recent({
    this.songId,
    this.songTitle,
    this.songArtist,
    this.ablumId,
    this.artistId,
    this.type,
    this.cover,
  });

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        ablumId: json["ablum_id"],
        artistId: json["artist_id"],
        type: recentTypeValues.map[json["type"]]!,
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "ablum_id": ablumId,
        "artist_id": artistId,
        "type": recentTypeValues.reverse[type],
        "cover": cover,
      };
}

enum RecentType { SONG }

final recentTypeValues = EnumValues({"Song": RecentType.SONG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
