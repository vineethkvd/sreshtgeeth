// To parse this JSON data, do
//
//     final paymentPage = paymentPageFromJson(jsonString);

import 'dart:convert';

PaymentPage paymentPageFromJson(String str) => PaymentPage.fromJson(json.decode(str));

String paymentPageToJson(PaymentPage data) => json.encode(data.toJson());

class PaymentPage {
  String status;
  String paymentLink;

  PaymentPage({
    required this.status,
    required this.paymentLink,
  });

  factory PaymentPage.fromJson(Map<String, dynamic> json) => PaymentPage(
    status: json["status"],
    paymentLink: json["payment_link"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "payment_link": paymentLink,
  };
}
