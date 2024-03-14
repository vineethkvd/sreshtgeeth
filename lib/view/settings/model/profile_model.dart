// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String status;
  List<Profile> profile;

  ProfileModel({
    required this.status,
    required this.profile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        profile:
            List<Profile>.from(json["Profile"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Profile": List<dynamic>.from(profile.map((x) => x.toJson())),
      };
}

class Profile {
  int rjCusId;
  String rjCusName;
  String rjCusEmail;
  String rjCusPhone;
  String rjCusGender;

  Profile({
    required this.rjCusId,
    required this.rjCusName,
    required this.rjCusEmail,
    required this.rjCusPhone,
    required this.rjCusGender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        rjCusId: json["rj_cus_id"],
        rjCusName: json["rj_cus_name"],
        rjCusEmail: json["rj_cus_email"],
        rjCusPhone: json["rj_cus_phone"],
        rjCusGender: json["rj_cus_gender"],
      );

  Map<String, dynamic> toJson() => {
        "rj_cus_id": rjCusId,
        "rj_cus_name": rjCusName,
        "rj_cus_email": rjCusEmail,
        "rj_cus_phone": rjCusPhone,
        "rj_cus_gender": rjCusGender,
      };
}
