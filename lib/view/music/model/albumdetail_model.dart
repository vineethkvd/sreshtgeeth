// To parse this JSON data, do
//
//     final albumDetailModel = albumDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

AlbumDetailModel albumDetailModelFromJson(String str) =>
    AlbumDetailModel.fromJson(json.decode(str));

String albumDetailModelToJson(AlbumDetailModel data) =>
    json.encode(data.toJson());

class AlbumDetailModel {
  String status;
  String totalCount;
  List<Album> album;
  List<Song1> song;
  List<OtherAlbum> otherAlbum;
  // SequenceState? song2;
  AlbumDetailModel({
    required this.status,
    required this.totalCount,
    required this.album,
    required this.song,
    required this.otherAlbum,
  });

  factory AlbumDetailModel.fromJson(Map<String, dynamic> json) =>
      AlbumDetailModel(
        status: json["status"],
        totalCount: json["total_count"],
        album: List<Album>.from(json["Album"].map((x) => Album.fromJson(x))),
        song: List<Song1>.from(json["Song"].map((x) => Song1.fromJson(x))),
        otherAlbum: List<OtherAlbum>.from(
            json["Other_album"].map((x) => OtherAlbum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_count": totalCount,
        "Album": List<dynamic>.from(album.map((x) => x.toJson())),
        "Song": List<dynamic>.from(song.map((x) => x.toJson())),
        "Other_album": List<dynamic>.from(otherAlbum.map((x) => x)),
      };
}

class Album {
  int albumId;
  String ablumTitle;
  String artistName;
  dynamic cover;

  Album({
    required this.albumId,
    required this.ablumTitle,
    required this.artistName,
    required this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["album_id"],
        ablumTitle: json["ablum_title"],
        artistName: json["artist_name"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "ablum_title": ablumTitle,
        "artist_name": artistName,
        "cover": cover,
      };
}

class Song1 {
  int songId;
  String songTitle;
  String songArtist;
  String songLink;
  String cover;
  bool likeStatus;

  Song1({
    required this.songId,
    required this.songTitle,
    required this.songArtist,
    required this.songLink,
    required this.cover,
    required this.likeStatus,
  });

  factory Song1.fromJson(Map<String, dynamic> json) => Song1(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        songLink: json["song_link"],
        cover: json["cover"],
        likeStatus: json["like_status"],
      );

  Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "song_link": songLink,
        "cover": cover,
        "like_status": likeStatus,
      };
}

class OtherAlbum {
  int? albumId;
  String? ablumTitle;
  String? cover;

  OtherAlbum({
    this.albumId,
    this.ablumTitle,
    this.cover,
  });

  factory OtherAlbum.fromJson(Map<String, dynamic> json) => OtherAlbum(
        albumId: json["album_id"],
        ablumTitle: json["ablum_title"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "ablum_title": ablumTitle,
        "cover": cover,
      };
}
