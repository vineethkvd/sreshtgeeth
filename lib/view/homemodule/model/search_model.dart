// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  String status;
  RxList<SearchResult> searchResult;
  RxList<Album> album;
  RxList<Artist> artist;

  SearchModel({
    required this.status,
    required this.searchResult,
    required this.album,
    required this.artist,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        searchResult: RxList<SearchResult>.from(
            json["Search_Result"].map((x) => SearchResult.fromJson(x))),
        album: RxList<Album>.from(json["Album"].map((x) => Album.fromJson(x))),
        artist:
            RxList<Artist>.from(json["Artist"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Search_Result":
            List<dynamic>.from(searchResult.map((x) => x.toJson())),
        "Album": List<dynamic>.from(album.map((x) => x.toJson())),
        "Artist": List<dynamic>.from(artist.map((x) => x.toJson())),
      };
}

class Album {
  int albumId;
  String ablumTitle;
  String type;
  String cover;

  Album({
    required this.albumId,
    required this.ablumTitle,
    required this.type,
    required this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["album_id"],
        ablumTitle: json["ablum_title"],
        type: json["type"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "ablum_title": ablumTitle,
        "type": type,
        "cover": cover,
      };
}

class Artist {
  int rjArtistId;
  String rjArtistName;
  String cover;

  Artist({
    required this.rjArtistId,
    required this.rjArtistName,
    required this.cover,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        rjArtistId: json["rj_artist_id"],
        rjArtistName: json["rj_artist_name"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "rj_artist_id": rjArtistId,
        "rj_artist_name": rjArtistName,
        "cover": cover,
      };
}

class SearchResult {
  int songId;
  String songTitle;
  String songArtist;
  String ablumId;
  int artistId;
  String type;
  String cover;

  SearchResult({
    required this.songId,
    required this.songTitle,
    required this.songArtist,
    required this.ablumId,
    required this.artistId,
    required this.type,
    required this.cover,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        ablumId: json["ablum_id"],
        artistId: json["artist_id"],
        type: json["type"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "ablum_id": ablumId,
        "artist_id": artistId,
        "type": type,
        "cover": cover,
      };
}
