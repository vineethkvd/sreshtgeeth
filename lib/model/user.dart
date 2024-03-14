class LoginStore {
  String? mobileNo;
  String? userID;
  String? name;
  String? email;
  String? location;
  String? tokenPassword;
  String? isSubscribed;
  String? isMobileVerify;
  String? isEmailVerify;
  String? status;
  String? isDeleted;
  String? createdDate;
  String? updatedDate;

  LoginStore(
      {this.mobileNo,
      this.userID,
      this.name,
      this.email,
      this.location,
      this.tokenPassword,
      this.isMobileVerify,
      this.isEmailVerify,
      this.status,
      this.isDeleted,
      this.createdDate,
      this.updatedDate,
      this.isSubscribed});

  factory LoginStore.fromJson(Map<String, dynamic> parsedJson) {
    return LoginStore(
        mobileNo: parsedJson['mobile_no'],
        userID: parsedJson["user_id"],
        name: parsedJson["user_name"],
        email: parsedJson["user_email"],
        location: parsedJson["user_address"],
        tokenPassword: parsedJson["user_token"],
        isMobileVerify: parsedJson["user_is_mobile"],
        isEmailVerify: parsedJson["user_is_email"],
        status: parsedJson["user_status"],
        isDeleted: parsedJson["user_is_delete"],
        isSubscribed: parsedJson["is_subscribed"],
        createdDate: parsedJson["user_created_data"],
        updatedDate: parsedJson["user_updated_date"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "mobile_no": mobileNo,
      "user_id": userID,
      "user_name": name,
      "user_email": email,
      "user_address": location,
      "user_token": tokenPassword,
      "user_is_mobile": isMobileVerify,
      "is_subscribed": isSubscribed,
      "user_is_email": isEmailVerify,
      "user_status": status,
      "user_is_delete": isDeleted,
      "user_created_data": createdDate,
      "user_updated_date": updatedDate
    };
  }
}
