// To parse this JSON data, do
//
//     final contentModel = contentModelFromJson(jsonString);

import 'dart:convert';

ContentModel contentModelFromJson(String str) => ContentModel.fromJson(json.decode(str));

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
    String status;
    List<WebsiteContent> websiteContent;

    ContentModel({
        required this.status,
        required this.websiteContent,
    });

    factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        status: json["status"],
        websiteContent: List<WebsiteContent>.from(json["Website Content"].map((x) => WebsiteContent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Website Content": List<dynamic>.from(websiteContent.map((x) => x.toJson())),
    };
}

class WebsiteContent {
    String aboutUs;
    String privacyPolicy;
    String termAndCondition;
    String contactNumber;
    String email;

    WebsiteContent({
        required this.aboutUs,
        required this.privacyPolicy,
        required this.termAndCondition,
        required this.contactNumber,
        required this.email,
    });

    factory WebsiteContent.fromJson(Map<String, dynamic> json) => WebsiteContent(
        aboutUs: json["about_us"],
        privacyPolicy: json["privacy_policy"],
        termAndCondition: json["term_and_condition"],
        contactNumber: json["contact_number"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "about_us": aboutUs,
        "privacy_policy": privacyPolicy,
        "term_and_condition": termAndCondition,
        "contact_number": contactNumber,
        "email": email,
    };
}
