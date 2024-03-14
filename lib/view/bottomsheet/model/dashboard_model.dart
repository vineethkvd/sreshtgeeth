// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    String status;
    List<Banner> banner;
    List<Album> album;
    List<PlayList> trendingSong;
    List<Banner> adsBanner;
    List<Artist> artist;
    List<Gener> gener;
    List<PlayList> playList;
    List<LivePodcast> livePodcast;
    List<PopularSong> popularSong;
    List<TopArtist> topArtist;
    List<WorkshipSong> workshipSongs;

    DashboardModel({
        required this.status,
        required this.banner,
        required this.album,
        required this.trendingSong,
        required this.adsBanner,
        required this.artist,
        required this.gener,
        required this.playList,
        required this.livePodcast,
        required this.popularSong,
        required this.topArtist,
        required this.workshipSongs
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        banner: List<Banner>.from(json["Banner"].map((x) => Banner.fromJson(x))),
        album: List<Album>.from(json["Album"].map((x) => Album.fromJson(x))),
        trendingSong: List<PlayList>.from(json["Trending_song"].map((x) => PlayList.fromJson(x))),
        adsBanner: List<Banner>.from(json["Ads_banner"].map((x) => Banner.fromJson(x))),
        artist: List<Artist>.from(json["Artist"].map((x) => Artist.fromJson(x))),
        gener: List<Gener>.from(json["Gener"].map((x) => Gener.fromJson(x))),
        playList: List<PlayList>.from(json["PlayList"].map((x) => PlayList.fromJson(x))),
        livePodcast: List<LivePodcast>.from(json["Live_podcast"].map((x) => LivePodcast.fromJson(x))),
        popularSong: List<PopularSong>.from(json["Popular_song"].map((x) => PopularSong.fromJson(x))),
        topArtist: List<TopArtist>.from(json["Top_artist"].map((x) => TopArtist.fromJson(x))),
        workshipSongs: List<WorkshipSong>.from(json["Workship_songs"].map((x) => WorkshipSong.fromJson(x))),  
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "Album": List<dynamic>.from(album.map((x) => x.toJson())),
        "Trending_song": List<dynamic>.from(trendingSong.map((x) => x.toJson())),
        "Ads_banner": List<dynamic>.from(adsBanner.map((x) => x.toJson())),
        "Artist": List<dynamic>.from(artist.map((x) => x.toJson())),
        "Gener": List<dynamic>.from(gener.map((x) => x.toJson())),
        "PlayList": List<dynamic>.from(playList.map((x) => x.toJson())),
        "Live_podcast": List<dynamic>.from(livePodcast.map((x) => x.toJson())),
        "Popular_song": List<dynamic>.from(popularSong.map((x) => x.toJson())),
        "Top_artist": List<dynamic>.from(topArtist.map((x) => x.toJson())),
        "Workship_songs": List<dynamic>.from(workshipSongs.map((x) => x.toJson())),
    };
}

class Banner {
    int bannerId;
    String bannerTitle;
    String banner;

    Banner({
        required this.bannerId,
        required this.bannerTitle,
        required this.banner,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerId: json["banner_id"],
        bannerTitle: json["banner_title"],
        banner: json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_title": bannerTitle,
        "banner": banner,
    };
}
class Album {
    int albumId;
    String ablumTitle;
    String cover;

    Album({
        required this.albumId,
        required this.ablumTitle,
        required this.cover,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
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

class Gener {
    int rjGenersId;
    String rjGenersName;
    String cover;

    Gener({
        required this.rjGenersId,
        required this.rjGenersName,
        required this.cover,
    });

    factory Gener.fromJson(Map<String, dynamic> json) => Gener(
        rjGenersId: json["rj_geners_id"],
        rjGenersName: json["rj_geners_name"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "rj_geners_id": rjGenersId,
        "rj_geners_name": rjGenersName,
        "cover": cover,
    };
}

class LivePodcast {
    dynamic podcastId;
    dynamic podcastTitle;
    String cover;

    LivePodcast({
        required this.podcastId,
        required this.podcastTitle,
        required this.cover,
    });

    factory LivePodcast.fromJson(Map<String, dynamic> json) => LivePodcast(
        podcastId: json["podcast_id"],
        podcastTitle: json["podcast_title"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "podcast_id": podcastId,
        "podcast_title": podcastTitle,
        "cover": cover,
    };
}

class PlayList {
    int songId;
    String songTitle;
    String cover;
    String ablumId;

    PlayList({
        required this.songId,
        required this.songTitle,
        required this.cover,
        required this.ablumId,
    });

    factory PlayList.fromJson(Map<String, dynamic> json) => PlayList(
        songId: json["song_id"],
        songTitle: json["song_title"],
        cover: json["cover"],
        ablumId: json["ablum_id"]
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "cover": cover,
        "album_id": ablumId,
    };
}

class PopularSong {
    int songId;
    String songTitle;
    String cover;
    String ablumId;

    PopularSong({
        required this.songId,
        required this.songTitle,
        required this.cover,
        required this.ablumId,
    });

    factory PopularSong.fromJson(Map<String, dynamic> json) => PopularSong(
        songId: json["song_id"],
        songTitle: json["song_title"],
        cover: json["cover"],
        ablumId: json["ablum_id"]
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "cover": cover,
        "ablum_id": ablumId
    };
}

class TopArtist {
    int rjArtistId;
    String rjArtistName;
    String cover;

    TopArtist({
        required this.rjArtistId,
        required this.rjArtistName,
        required this.cover,
    });

    factory TopArtist.fromJson(Map<String, dynamic> json) => TopArtist(
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

class WorkshipSong {
    int songId;
    String songTitle;
    String songArtist;
    String ablumId;
    int artistId;
    String cover;

    WorkshipSong({
        required this.songId,
        required this.songTitle,
        required this.songArtist,
        required this.ablumId,
        required this.artistId,
        required this.cover,
    });

    factory WorkshipSong.fromJson(Map<String, dynamic> json) => WorkshipSong(
        songId: json["song_id"],
        songTitle: json["song_title"],
        songArtist: json["song_artist"],
        ablumId: json["ablum_id"],
        artistId: json["artist_id"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "song_id": songId,
        "song_title": songTitle,
        "song_artist": songArtist,
        "ablum_id": ablumId,
        "artist_id": artistId,
        "cover": cover,
    };
    }
