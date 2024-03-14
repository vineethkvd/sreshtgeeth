// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import '../api_endpoints.dart';
// import '../base_client.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../common/base_colors.dart';
// import '../common/text.dart';
// import '../model/user.dart';
// import 'auth.dart';
// // import '../view/home/HomeTopBarBtns/mycard.dart';

// //main
// LoginStore? loginStore;

// class InitCon extends GetxController with BaseController {
//   // album
//    final AuthCon acon = Get.put(AuthCon());

// bool loading = false;
// //drawer
//   var aboutPage = ''.obs;
//   var privacyPage = ''.obs;
//   var contactPage = ''.obs;
//   var termsPage = ''.obs;
//   var selectedCar = '';

// //homebooking  
//   var booking = [].obs;
//   var bookingId = ''.obs;
//   var pLocation = ''.obs;
//   var dLocation = ''.obs;
//   var bTime = ''.obs;
//   var bDistance = ''.obs;
// //packer
//   late TabController tabController;
//   int pakerIndex = 0;
//   TextEditingController nameCon = TextEditingController();
//   TextEditingController mobileCon = TextEditingController();
//   TextEditingController mailCon = TextEditingController();
//   TextEditingController addressCon = TextEditingController();

//   //location search
//   var currentAddress = ''.obs;

//   get orderStatusTabController => null;

//   var myallcartlist = [];
//   var totalamount;
//   var related = [];
//   var seletecart = [];

//   // checkout
//   TextEditingController checkmobile = TextEditingController();
//   TextEditingController checkname = TextEditingController();
//   TextEditingController checkaddress = TextEditingController();
//   var checkdate = DateTime.now();
//   var checktime = '10:00:00-11:00:00';

//   var myService = [].obs;
//   var carlist = [].obs;
//   var myServiceDetails = [].obs;
//   var bookedService = [].obs;
//   var carImage = [].obs;
//   var notApprovedExtra = [].obs;
//   var approvedExtra = [].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     //getLoginDetails();
//     // selectedcar();
//   }

 

//   scheduledservicelist(catogory) async {
//     var body = {
//       "api_key": API().gapikey,
//       "brand": "Audi",
//       "modal": "A6",
//       "verient": "Petrol",
//       "category": catogory['category'],
//       "sub_category": catogory["sub_category"]
//     };
//     var response = await BaseClient()
//         .post(API().service, json.encode(body))
//         .catchError(handleError);
//     if (response == null) return [];
//     var data = json.decode(response);
//     // Get.to(OTPView());
//     if (data['status'] == "Success") {
//       return data["Service List"] != null && data["Service List"] != ""
//           ? data["Service List"]
//           : [];
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//       return [];
//     }
//   }



 

//   void getLocationList() async {
//     var response =
//         await BaseClient().get(API().locationList).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     if (data['status']) {
//       // propertyTypeList = data["data"];
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void getNotificationList() async {
//     var response =
//         await BaseClient().get(API().notificationList).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     if (data['status']) {
//       // propertyTypeList = data["data"];
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void getSubscriptionContent() async {
//     var response = await BaseClient()
//         .get(API().getSubscriptionContent)
//         .catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     if (data['status']) {
//       // propertyTypeList = data["data"];
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   localProfileUpdate() async {
//    // SharedPreferences prefs = await SharedPreferences.getInstance();
//     loginStore?.name = nameCon.text;
//     loginStore?.email = mailCon.text;
//     loginStore?.mobileNo = mobileCon.text;
//     loginStore?.location = addressCon.text;
//   //  prefs.setString('user', jsonEncode(loginStore));
//   }

//   profileAssign() {
//     nameCon.text = loginStore!.name!;
//     mailCon.text = loginStore!.email!;
//     mobileCon.text = loginStore!.mobileNo!;
//     addressCon.text = loginStore!.location!;
//   }

//   void profileUpdate() async {
//     showLoading();
//     var body = {
//       'customer_id': loginStore?.userID.toString(),
//       'customer_name': nameCon.text,
//       'customer_email': mailCon.text,
//       'customer_mobile': mobileCon.text,
//       'customer_location': addressCon.text
//     };
//     var response = await BaseClient()
//         .post(API().profileupdate, body)
//         .catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);

//     hideLoading();
//     if (data['status']) {
//       await localProfileUpdate();
//       await profileAssign();
//       Fluttertoast.showToast(msg: data['message']);
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void getHomeListDetails() async {
//     var response =
//         await BaseClient().get(API().homeservice).catchError(handleError);
//     if (response == null) return;
//     var data = json.decode(response);
//     if (data['status']) {
//       // propertyTypeList = data["data"];
//     } else {
//       Fluttertoast.showToast(msg: data['message']);
//     }
//   }

//   void getAbout() async {
//     var response = await BaseClient().get(API().about).catchError(handleError);
//     if (response == null) return;

//     var data = json.decode(response);
//     aboutPage.value = data;
//   }

//   void getTerms() async {
//     var response = await BaseClient().get(API().terms).catchError(handleError);
//     if (response == null) return;

//     var data = json.decode(response);
//     termsPage.value = data;
//   }

//   void getContact() async {
//     var response =
//         await BaseClient().get(API().contact).catchError(handleError);
//     if (response == null) return;

//     var data = json.decode(response);
//     contactPage.value = data;
//   }

//   void getPrivacy() async {
//     var response =
//         await BaseClient().get(API().privacy).catchError(handleError);
//     if (response == null) return;

//     var data = json.decode(response);
//     privacyPage.value = data;
//   }




//   // Future<void> makePhoneCall(String phoneNumber) async {
//   //   final Uri launchUri = Uri(
//   //     scheme: 'tel',
//   //     path: "+91 $phoneNumber",
//   //   );
//   //   await launchUrl(launchUri);
//   // }

//   // void copyPad(String textCopy) {
//   //   FlutterClipboard.copy(textCopy.trim()).then(
//   //       (value) => Fluttertoast.showToast(msg: "${textCopy.trim()} copied"));
//   // }

// }
