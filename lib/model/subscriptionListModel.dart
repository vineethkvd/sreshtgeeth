// To parse this JSON data, do
//
//     final subscriptionList = subscriptionListFromJson(jsonString);

import 'dart:convert';

SubscriptionList subscriptionListFromJson(String str) => SubscriptionList.fromJson(json.decode(str));

String subscriptionListToJson(SubscriptionList data) => json.encode(data.toJson());

class SubscriptionList {
  String status;
  String buyMsg;
  List<Plan> activePlan;
  List<Plan> subscriptionPlan;

  SubscriptionList({
    required this.status,
    required this.buyMsg,
    required this.activePlan,
    required this.subscriptionPlan,
  });

  factory SubscriptionList.fromJson(Map<String, dynamic> json) => SubscriptionList(
    status: json["status"],
    buyMsg: json["buy_msg"],
    activePlan: List<Plan>.from(json["active_plan"].map((x) => Plan.fromJson(x))),
    subscriptionPlan: List<Plan>.from(json["Subscription_plan"].map((x) => Plan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "buy_msg": buyMsg,
    "active_plan": List<dynamic>.from(activePlan.map((x) => x.toJson())),
    "Subscription_plan": List<dynamic>.from(subscriptionPlan.map((x) => x.toJson())),
  };
}

class Plan {
  int planId;
  String title;
  String heading1;
  String heading2;
  String heading3;
  String heading4;
  String backgroundColor;
  int validityInDays;
  int amount;
  int validityInMonth;
  String? expiry;

  Plan({
    required this.planId,
    required this.title,
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.backgroundColor,
    required this.validityInDays,
    required this.amount,
    required this.validityInMonth,
    this.expiry,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    planId: json["plan_id"],
    title: json["title"],
    heading1: json["heading_1"],
    heading2: json["heading_2"],
    heading3: json["heading_3"],
    heading4: json["heading_4"],
    backgroundColor: json["background_color"],
    validityInDays: json["validity_in_days"],
    amount: json["amount"],
    validityInMonth: json["validity_in_month"],
    expiry: json["expiry"],
  );

  Map<String, dynamic> toJson() => {
    "plan_id": planId,
    "title": title,
    "heading_1": heading1,
    "heading_2": heading2,
    "heading_3": heading3,
    "heading_4": heading4,
    "background_color": backgroundColor,
    "validity_in_days": validityInDays,
    "amount": amount,
    "validity_in_month": validityInMonth,
    "expiry": expiry,
  };
}
