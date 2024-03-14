// To parse this JSON data, do
//
//     final downloadSong = downloadSongFromJson(jsonString);

import 'dart:convert';

DownloadSong downloadSongFromJson(String str) => DownloadSong.fromJson(json.decode(str));

String downloadSongToJson(DownloadSong data) => json.encode(data.toJson());

class DownloadSong {
  bool status;
  String msg;

  DownloadSong({
    required this.status,
    required this.msg,
  });

  factory DownloadSong.fromJson(Map<String, dynamic> json) => DownloadSong(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
