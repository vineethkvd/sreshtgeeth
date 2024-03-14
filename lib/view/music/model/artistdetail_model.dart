// To parse this JSON data, do
//
//     final artistDetailModel = artistDetailModelFromJson(jsonString);

import 'dart:convert';

ArtistDetailModel artistDetailModelFromJson(String str) =>
    ArtistDetailModel.fromJson(json.decode(str));

String artistDetailModelToJson(ArtistDetailModel data) =>
    json.encode(data.toJson());

class ArtistDetailModel {
  String status;
  String totalCount;
  List<Artist> artist;
  List<Song> song;
  List<AllAlbum> allAlbum;

  ArtistDetailModel({
    required this.status,
    required this.totalCount,
    required this.artist,
    required this.song,
    required this.allAlbum,
  });

  factory ArtistDetailModel.fromJson(Map<String, dynamic> json) =>
      ArtistDetailModel(
        status: json["status"],
        totalCount: json["total_count"],
        artist:
            List<Artist>.from(json["Artist"].map((x) => Artist.fromJson(x))),
        song: List<Song>.from(json["Song"].map((x) => Song.fromJson(x))),
        allAlbum: List<AllAlbum>.from(
            json["All_Album"].map((x) => AllAlbum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_count": totalCount,
        "Artist": List<dynamic>.from(artist.map((x) => x.toJson())),
        "Song": List<dynamic>.from(song.map((x) => x.toJson())),
        "All_Album": List<dynamic>.from(allAlbum.map((x) => x.toJson())),
      };
}

class AllAlbum {
  int albumId;
  String ablumTitle;
  String cover;

  AllAlbum({
    required this.albumId,
    required this.ablumTitle,
    required this.cover,
  });

  factory AllAlbum.fromJson(Map<String, dynamic> json) => AllAlbum(
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

class Artist {
  int rjArtistId;
  dynamic rjArtistName;
  dynamic cover;
  int? follower;
  bool? follow;

  Artist({
    required this.rjArtistId,
    required this.rjArtistName,
    required this.cover,
    required this.follower,
    required this.follow,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        rjArtistId: json["rj_artist_id"],
        rjArtistName: json["rj_artist_name"],
        cover: json["cover"],
        follower: json["follower"],
        follow: json["follow"],
      );

  Map<String, dynamic> toJson() => {
        "rj_artist_id": rjArtistId,
        "rj_artist_name": rjArtistName,
        "cover": cover,
        "follower": follower,
        "follow": follow,
      };
}

class Song {
  int songId;
  String songTitle;
  String songArtist;
  String ablumId;
  int artistId;
  String songLink;
  String? cover;

  Song({
    required this.songId,
    required this.songTitle,
    required this.songArtist,
    required this.ablumId,
    required this.artistId,
    required this.songLink,
    required this.cover,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        ablumId: json["ablum_id"],
        artistId: json["artist_id"],
        songLink: json["song_link"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "ablum_id": ablumId,
        "artist_id": artistId,
        "song_link": songLink,
        "cover": cover,
      };
}
