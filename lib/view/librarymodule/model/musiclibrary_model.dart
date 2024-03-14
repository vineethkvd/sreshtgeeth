// To parse this JSON data, do
//
//     final musicLibraryModel = musicLibraryModelFromJson(jsonString);

import 'dart:convert';

MusicLibraryModel musicLibraryModelFromJson(String str) => MusicLibraryModel.fromJson(json.decode(str));

String musicLibraryModelToJson(MusicLibraryModel data) => json.encode(data.toJson());

class MusicLibraryModel {
    String status;
    List<ArtistList> artistList;
    List<SongList> songList;
    List<SongList> playList;
    List<SongList> downlaodList;

    MusicLibraryModel({
        required this.status,
        required this.artistList,
        required this.songList,
        required this.playList,
        required this.downlaodList,
    });

    factory MusicLibraryModel.fromJson(Map<String, dynamic> json) => MusicLibraryModel(
        status: json["status"],
        artistList: List<ArtistList>.from(json["Artist_List"].map((x) => ArtistList.fromJson(x))),
        songList: List<SongList>.from(json["SongList"].map((x) => SongList.fromJson(x))),
        playList: List<SongList>.from(json["PlayList"].map((x) => SongList.fromJson(x))),
        downlaodList: List<SongList>.from(json["DownlaodList"].map((x) => SongList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Artist_List": List<dynamic>.from(artistList.map((x) => x.toJson())),
        "SongList": List<dynamic>.from(songList.map((x) => x.toJson())),
        "PlayList": List<dynamic>.from(playList.map((x) => x.toJson())),
        "DownlaodList": List<dynamic>.from(downlaodList.map((x) => x.toJson())),
    };
}

class ArtistList {
    int artistId;
    String artistName;
    String artistCover;

    ArtistList({
        required this.artistId,
        required this.artistName,
        required this.artistCover,
    });

    factory ArtistList.fromJson(Map<String, dynamic> json) => ArtistList(
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        artistCover: json["artist_cover"],
    );

    Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist_name": artistName,
        "artist_cover": artistCover,
    };
}

class DownlaodListElement {
    String songId;
    String songTitle;
    String cover;

    DownlaodListElement({
        required this.songId,
        required this.songTitle,
        required this.cover,
    });

    factory DownlaodListElement.fromJson(Map<String, dynamic> json) => DownlaodListElement(
        songId: json["song_id"],
        songTitle: json["song_title"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "cover": cover,
    };
}

class SongList {
    int songId;
    String songTitle;
    String songArtist;
    String ablumId;
    int artistId;
    String type;
    String cover;

    SongList({
        required this.songId,
        required this.songTitle,
        required this.songArtist,
        required this.ablumId,
        required this.artistId,
        required this.type,
        required this.cover,
    });

    factory SongList.fromJson(Map<String, dynamic> json) => SongList(
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
