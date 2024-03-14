// To parse this JSON data, do
//
//     final addtoplaylist = addtoplaylistFromJson(jsonString);

import 'dart:convert';

Addtoplaylist addtoplaylistFromJson(String str) => Addtoplaylist.fromJson(json.decode(str));

String addtoplaylistToJson(Addtoplaylist data) => json.encode(data.toJson());

class Addtoplaylist {
  bool status;
  String msg;

  Addtoplaylist({
    required this.status,
    required this.msg,
  });

  factory Addtoplaylist.fromJson(Map<String, dynamic> json) => Addtoplaylist(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
