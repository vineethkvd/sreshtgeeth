// To parse this JSON data, do
//
//     final recentPodcast = recentPodcastFromJson(jsonString);

import 'dart:convert';

RecentPodcast recentPodcastFromJson(String str) => RecentPodcast.fromJson(json.decode(str));

String recentPodcastToJson(RecentPodcast data) => json.encode(data.toJson());

class RecentPodcast {
  String status;
  String totalCount;
  List<Album> album;
  List<Song> song;
  List<dynamic> otherAlbum;

  RecentPodcast({
    required this.status,
    required this.totalCount,
    required this.album,
    required this.song,
    required this.otherAlbum,
  });

  factory RecentPodcast.fromJson(Map<String, dynamic> json) => RecentPodcast(
    status: json["status"],
    totalCount: json["total_count"],
    album: List<Album>.from(json["Album"].map((x) => Album.fromJson(x))),
    song: List<Song>.from(json["Song"].map((x) => Song.fromJson(x))),
    otherAlbum: List<dynamic>.from(json["Other_album"].map((x) => x)),
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
  String cover;

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

class Song {
  int songId;
  String songTitle;
  String songArtist;
  String songLink;
  String cover;
  bool likeStatus;

  Song({
    required this.songId,
    required this.songTitle,
    required this.songArtist,
    required this.songLink,
    required this.cover,
    required this.likeStatus,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
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
