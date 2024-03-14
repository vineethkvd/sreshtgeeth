import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/model/payment_page.dart';
import 'package:sreshtgeeth/model/subscriptionListModel.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../model/state.dart';
import '../view/auth/church.dart';
import '../view/auth/model/addartist_model.dart';
import '../view/auth/model/addlanguage_model.dart';
import '../view/auth/model/artist_model.dart';
import '../view/auth/model/city.dart';
import '../view/auth/model/country.dart';
import '../view/auth/model/district.dart';
import '../view/auth/model/language_model.dart';
import '../view/auth/model/log_in.dart';
import '../view/auth/model/register_model.dart';
import '../view/auth/model/removeartist_model.dart';
import '../view/auth/model/removelanguage_model.dart';
import '../view/auth/model/splash.dart';
import '../view/auth/otp.dart';
import '../view/auth/register.dart';
import '../view/auth/selectlanguage.dart';
import 'init.dart';
import 'package:http/http.dart' as http;

class AuthCon extends GetxController with BaseController {
  // login
  final TextEditingController userNameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController amountCon = TextEditingController();
  var lobs = true.obs;
  var otp = ''.obs;
  var driverid = ''.obs;
  var driverUnique = ''.obs;
  var driverName = ''.obs;
  var driverStatus = ''.obs;
  var details = [].obs;
  var datacaradd;
  var profiledetails;
  var forgot_id = ''.obs;
  var makePhoneCall;
  var driveruniqueId = ''.obs;
  var driveruniqueId1 = ''.obs;
  var driveruniqueId2 = ''.obs;
  var driveruniqueId3 = ''.obs;
  var driveruniqueId4 = ''.obs;
  var storage = GetStorage();
  bool appuser = false;

  //register
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController mailCon = TextEditingController();
  final TextEditingController firstNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController VehicleNumCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final TextEditingController Instructions = TextEditingController();
  final TextEditingController carnumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController districtcon = TextEditingController();
  final TextEditingController statecon = TextEditingController();
  final TextEditingController ReferralIDcon = TextEditingController();
  final TextEditingController addresscon = TextEditingController();
  final TextEditingController DateController = TextEditingController();
  final TextEditingController DatetoController = TextEditingController();
  final TextEditingController promo_code = TextEditingController();
  final form = GlobalKey<FormState>();

  final TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController upload2 = TextEditingController();
  TextEditingController upload3 = TextEditingController();
  TextEditingController upload4 = TextEditingController();
  var selectGender = "Male".obs;

  //token
  String? token;

  //ll

  bool? isLoaded;
  var lat;
  var lon;
  var timeNotifier = ''.obs;

  //background
  //var task ='firstTask';
  //otp
  final TextEditingController otpCon = TextEditingController();

  //change password
  final TextEditingController oldPassCon = TextEditingController();
  final TextEditingController newPassCon = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  RegisterUserModel? registerrdata;

  Future<void> register(gender, state, city, district, church) async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "name": userNameCon.text,
      "email": emailCon.text,
      "phone": mobileCon.text,
      "gender": gender,
      "state": state,
      "city": city,
      "district": district,
      "church": church,
      "Promo_code": promo_code.text,
    });
    var response =
    await BaseClient().post(API().Register, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    print(response);
    registerrdata = registerUserModelFromJson(response);
    if (registerrdata!.status == true) {
      Get.to(() =>
          selectLanguage(
            s: state,
            c: city,
            d: district,
          ));
      Fluttertoast.showToast(msg: registerrdata!.status.toString());
      GetStorage().write('ccId', registerrdata!.cusId.toString());
      //print('hiiii' + logindata!.data.id.toString());
      // navController.index = 0;

      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
      Fluttertoast.showToast(msg: registerrdata!.status.toString());
    }
  }

  MSplash1? splashdata;

  Future<void> splash1() async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "page": "1",
    });
    var response =
    await BaseClient().post(API().splashapi, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    splashdata = mSplash1FromJson(response);
    if (splashdata!.status == true) {
      //Fluttertoast.showToast(msg: splashdata!.status.toString());
      //box.write('LocalUserId', logindata!.data.id.toString());
      //print('hiiii' + logindata!.data.id.toString());
      // navController.index = 0;

      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
      Fluttertoast.showToast(msg: splashdata!.status.toString());
    }
  }

  Future<void> splash2() async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "page": "2",
    });
    var response =
    await BaseClient().post(API().splashapi, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    splashdata = mSplash1FromJson(response);
    if (splashdata!.status == true) {
      //Fluttertoast.showToast(msg: splashdata!.status.toString());
      //box.write('LocalUserId', logindata!.data.id.toString());
      //print('hiiii' + logindata!.data.id.toString());
      // navController.index = 0;

      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
      Fluttertoast.showToast(msg: splashdata!.status.toString());
    }
  }

  MLogin? logindata;

  Future<void> loginapi() async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "phone": mobileCon.text,
    });
    var response =
    await BaseClient().post(API().logIn, body).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    if (data['status'] == true) {
      logindata = mLoginFromJson(response);
      Fluttertoast.showToast(msg: "OTP send to your register mobile number");
      storage.write('LocalUserId', logindata!.data[0].uniqueId.toString());
      storage.write('cusId', logindata!.data[0].cusId.toString());
      print('hiiii' + logindata!.data[0].uniqueId.toString());
      // navController.index = 0;
      Get.to(() =>
          OTP(
            otp: logindata!.otp.toString(),
          ));
      acon.appuser = true;
      var eee = GetStorage().write('Appuser', acon.appuser);
      //Get.offAll(LoginView());
      // Get.to(OTPVerification());
    } else {
      Get.to(() => Register());
      Fluttertoast.showToast(msg: 'Redirected to Register Page');
    }
  }

  MCountry? countrydata;

  //List<DropDownValueModel> searchD = [];
  Future<void> getCountry() async {
    var body = jsonEncode({
      "api_key": API().gapikey,
    });
    var response =
    await BaseClient().post(API().country, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    countrydata = mCountryFromJson(response);
    if (countrydata!.status == true) {
      Fluttertoast.showToast(msg: countrydata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: countrydata!.status.toString());
    }
  }

  MState? statedata;
  List<DropDownValueModel> stateList = [];

  Future<void> getstate() async {
    var body = jsonEncode({"api_key": API().gapikey, "country_id": "1"});
    var response =
    await BaseClient().post(API().state, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    statedata = mStateFromJson(response);
    if (statedata!.status == 'Success') {
      for (int i = 0; i < statedata!.stateList.length; i++) {
        stateList.add(DropDownValueModel(
            name: '${statedata!.stateList[i].stateName}',
            value: statedata!.stateList[i].stateId));
      }
      print(stateList.toString());
      Fluttertoast.showToast(msg: statedata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: statedata!.status.toString());
    }
  }

  MDistrict? districtdata;
  List<DropDownValueModel> districtList = [];

  Future<void> getDistrict(stateId) async {
    var body = jsonEncode({"api_key": API().gapikey, "state_id": stateId});
    var response =
    await BaseClient().post(API().district, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    districtdata = mDistrictFromJson(response);
    if (districtdata!.status == 'Success') {
      for (int i = 0; i < districtdata!.districtList.length; i++) {
        districtList.add(DropDownValueModel(
            name: '${districtdata!.districtList[i].districtName}',
            value: districtdata!.districtList[i].districtId));
      }
      print(districtList.toString());
      Fluttertoast.showToast(msg: districtdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: districtdata!.status.toString());
    }
  }

  MCity? citydata;
  List<DropDownValueModel> cityList = [];

  Future<void> getCity(districtId) async {
    var body =
    jsonEncode({"api_key": API().gapikey, "district_id": districtId});
    var response =
    await BaseClient().post(API().city, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    citydata = mCityFromJson(response);
    if (citydata!.status == 'Success') {
      for (int i = 0; i < citydata!.cityList.length; i++) {
        cityList.add(DropDownValueModel(
            name: '${citydata!.cityList[i].cityName}',
            value: citydata!.cityList[i].cityId));
      }
      print(stateList.toString());
      Fluttertoast.showToast(msg: citydata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: citydata!.status.toString());
    }
  }

  MChurch? churchdata;
  List<DropDownValueModel> churchList = [];

  Future<void> getChurch(stateId, districtId, cityId) async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "state_id": stateId,
      "district_id": districtId,
      "city_id": cityId
    });
    var response =
    await BaseClient().post(API().church, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    churchdata = mChurchFromJson(response);
    if (churchdata!.status == 'Success') {
      for (int i = 0; i < churchdata!.cityList.length; i++) {
        churchList.add(DropDownValueModel(
            name: '${churchdata!.cityList[i].churchName}',
            value: churchdata!.cityList[i].churchId));
      }
      print(churchList.toString());
      Fluttertoast.showToast(msg: churchdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: churchdata!.status.toString());
    }
  }

  SelectLanguageModel? languagelistdata;
  List<DropDownValueModel> languageList = [];

  Future<void> languagelistapi(stateId, districtId, cityId) async {
    var body = jsonEncode({
      "api_key": API().gapikey,
      "state_id": stateId,
      "district_id": districtId,
      "city_id": cityId
    });
    var response = await BaseClient()
        .post(API().languageList, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    languagelistdata = selectLanguageModelFromJson(response);
    if (languagelistdata!.status == 'Success') {
      for (int i = 0; i < languagelistdata!.languageList.length; i++) {
        languageList.add(DropDownValueModel(
            name: '${languagelistdata!.languageList[i].languageTitle}',
            value: languagelistdata!.languageList[i].languageId));

        //   for (var i = 0; i < acon.languagelistdata!.languageList.length; i++) {
        // list.add(isSwitched);
        //}
      }

      print(languageList.toString());
      Fluttertoast.showToast(msg: languagelistdata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: languagelistdata!.status.toString());
    }
  }

  AddLanguageModel? addlanguagedata;

  Future<void> addlanguageapi(id) async {
    var cus = GetStorage().read('ccId');
    var body = jsonEncode(
        {"api_key": API().gapikey, "cus_id": cus, "language_id": id});
    var response = await BaseClient()
        .post(API().addlanguage, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    addlanguagedata = addLanguageModelFromJson(response);
    if (addlanguagedata!.status == 'Success') {
      Fluttertoast.showToast(msg: addlanguagedata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: addlanguagedata!.status.toString());
    }
  }

  RemoveLanguageModel? removelanguagedata;

  Future<void> removelanguageapi(id) async {
    var cus = GetStorage().read('ccId');
    var body = jsonEncode(
        {"api_key": API().gapikey, "cus_id": cus, "language_id": id});
    var response = await BaseClient()
        .post(API().removelanguage, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    removelanguagedata = removeLanguageModelFromJson(response);
    if (removelanguagedata!.status == 'Success') {
      Fluttertoast.showToast(msg: removelanguagedata!.status.toString());
      //Get.to(() => OTP(otp: logindata!.otp.toString(),));
    } else {
      Fluttertoast.showToast(msg: removelanguagedata!.status.toString());
    }
  }

  ArtistModel? artistdata;
  List<DropDownValueModel> artistList = [];

  Future<void> artistapi() async {
    var cus = GetStorage().read('ccId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    var response =
    await BaseClient().post(API().artistlist, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    artistdata = artistModelFromJson(response);
    if (artistdata!.status == 'Success') {
      for (int i = 0; i < languagelistdata!.languageList.length; i++) {
        Fluttertoast.showToast(msg: artistdata!.status.toString());
        artistList.add(DropDownValueModel(
            name: '${artistdata!.myLanguageList[i].artistName}',
            value: artistdata!.myLanguageList[i].artistId));
      }
    } else {
      Fluttertoast.showToast(msg: artistdata!.status.toString());
    }
  }

  AddArtistModel? addartistdata;

  Future<void> addartistapi(id) async {
    var cus = GetStorage().read('ccId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
      "artist_id": id,
    });
    var response =
    await BaseClient().post(API().addartist, body).catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    addartistdata = addArtistModelFromJson(response);
    if (addartistdata!.status == 'Success') {} else {
      Fluttertoast.showToast(msg: addartistdata!.status.toString());
    }
  }

  RemoveArtistModel? removeartistdata;

  Future<void> removeartistapi(id) async {
    var cus = GetStorage().read('ccId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
      "artist_id": id,
    });
    var response = await BaseClient()
        .post(API().removeartist, body)
        .catchError(handleError);
    if (response == null) return;
    //var data = json.decode(response);
    removeartistdata = removeArtistModelFromJson(response);
    if (removeartistdata!.status == 'Success') {} else {
      Fluttertoast.showToast(msg: removeartistdata!.status.toString());
    }
  }


  SubscriptionList? ssubscription;

  Future<void> scbscriptionapi() async {
    var cus = GetStorage().read('cusId');
    var body = jsonEncode({
      "api_key": API().gapikey,
      "cus_id": cus,
    });
    print(123);
    var response1 = await BaseClient().post(API().subs, body).catchError(
        handleError);
    print(response1);
    ssubscription = subscriptionListFromJson(response1);
  }
  PaymentPage? pay1;
  Future paymentpage2(String plann) async {
    var
    cus = GetStorage().read('cusId');
    //var plan = GetStorage().read('planid');
    var body = jsonEncode({
      "api_key":API().gapikey,
      "cus_id":cus,
      "plan_id":plann,
    });
    print(123);
    var response1 = await BaseClient().post(API().paymentendpoint, body).catchError(handleError);
    print(response1);
    pay1 = paymentPageFromJson(response1);
  }
}