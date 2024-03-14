import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/controller/init.dart';
import 'package:sreshtgeeth/view/Artist/controller/addalbum_controller.dart';
import 'package:sreshtgeeth/view/Artist/controller/uploadsong_controller.dart';
import 'package:sreshtgeeth/view/Artist/songupload/trackupload.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';
import '../controller/home_controller.dart';
import 'artistUpload.dart';

class UploadSongsArtist extends StatefulWidget {
  const UploadSongsArtist({super.key});

  @override
  State<UploadSongsArtist> createState() => _UploadSongsArtistState();
}

class _UploadSongsArtistState extends State<UploadSongsArtist> {
  AddAlbumCon addalbumcon = Get.put(AddAlbumCon());
  UploadSongCon uploadsongcon = Get.put(UploadSongCon());
  DateTime selectedDate = DateTime.now();
  HomeCon homecon = Get.put(HomeCon());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _cnt1;
  late SingleValueDropDownController _cnt2;
  late SingleValueDropDownController _cnt3;
  late SingleValueDropDownController _cnt4;
  late SingleValueDropDownController _cnt5;
  late SingleValueDropDownController _cnt6;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    addalbumcon.titlelist.clear();
    uploadsongcon.tracklist.clear();
    uploadsongcon.languagelist.clear();
    uploadsongcon.genrelist.clear();
    call();
    _cnt = SingleValueDropDownController();
    _cnt1 = SingleValueDropDownController();
    _cnt2 = SingleValueDropDownController();
    _cnt3 = SingleValueDropDownController();
    _cnt4 = SingleValueDropDownController();
    _cnt5 = SingleValueDropDownController();
    _cnt6 = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cnt1.dispose();
    _cnt2.dispose();
    _cnt3.dispose();
    _cnt4.dispose();
    _cnt5.dispose();
    _cnt6.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  call() async {
    await addalbumcon.albumlistapi();
    await uploadsongcon.tracklistapi();
    await uploadsongcon.languagelistapi();
    await uploadsongcon.genrelistapi();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    //final InitCon init = Get.put(InitCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;

    bool age = false;

    // Future<void> _selectDates(BuildContext context) async {
    //   final DateTime? picked = await showDatePicker(
    //       initialEntryMode: DatePickerEntryMode.calendarOnly,

    //       context: context,
    //       initialDate: selectedDates,
    //       firstDate: DateTime(2015, 8),
    //       lastDate: DateTime(2101));
    //   if (picked != null && picked != selectedDates) {
    //     setState(() {
    //       selectedDates = picked;
    //     });
    //   }
    // }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(
            text: 'Upload Songs',
            fsize: 18,
            weight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Your OMR Code (Album Title)',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt6,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Track Type*'
                        ),
                        // validator: (value) {
                        //   if (value == null) {
                        //     return "Required field";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        dropDownItemCount: 6,

                        dropDownList: addalbumcon.titlelist,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Track Type*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: 'Track Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 6,

                        dropDownList: uploadsongcon.tracklist,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Instrumental Type*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt1,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          //labelText: 'Instrumental Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 2,

                        dropDownList: const [
                          DropDownValueModel(name: 'Yes', value: "value1"),
                          DropDownValueModel(
                              name: 'No',
                              value: "value2",
                              toolTipMsg:
                                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        ],
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Title*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.title,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Title',
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Primary Artist*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.artist,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Primary Artist',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Featuring',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.featuring,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Featuring',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Lyricist',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.lyricist,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Lyricist',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Composition*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.composition,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Composition',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Music*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.music,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Music',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Production Year*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt2,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          //labelText: 'Instrumental Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 6,

                        dropDownList: const [
                          DropDownValueModel(
                              name: '2018 - 2019', value: "value1"),
                          DropDownValueModel(
                            name: '2019 - 2020',
                            value: "value2",
                          ),
                          DropDownValueModel(
                            name: '2020 - 2021',
                            value: "value3",
                          ),
                          DropDownValueModel(
                            name: '2021 - 2022',
                            value: "value4",
                          ),
                          DropDownValueModel(
                            name: '2022 - 2023',
                            value: "value5",
                          ),
                          DropDownValueModel(
                            name: '2023 - 2024',
                            value: "value5",
                          ),
                        ],
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'ISRC Code*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.isrc,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'ISRC Code',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Genre*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt3,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          //labelText: 'Instrumental Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 2,

                        dropDownList: uploadsongcon.genrelist,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Parental Advisory*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt4,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          //labelText: 'Instrumental Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 2,

                        dropDownList: const [
                          DropDownValueModel(name: 'Yes', value: "value1"),
                          DropDownValueModel(
                              name: 'No',
                              value: "value2",
                              toolTipMsg:
                                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        ],
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Lyrics Language*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  //color: AppColors.grey_,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Center(
                      child: DropDownTextField(
                        // initialValue: "name4",
                        controller: _cnt5,
                        clearOption: true,

                        // enableSearch: true,
                        // dropdownColor: Colors.green,
                        textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          //labelText: 'Instrumental Type*'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 2,

                        dropDownList: uploadsongcon.languagelist,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, top: 8, left: 25),
                      child: Txt(
                        text: 'Label Name*',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: uploadsongcon.label,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.black), //<-- SEE HERE
                      ),
                      //border: InputBorder.none,
                      //  border: OutlineInputBorder(

                      //  borderRadius: BorderRadius.circular(5)
                      // ),
                      // border: OutlineInputBorder(),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: 'Label Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 5),
                  child: Row(
                    children: [
                      Txt(
                        text: 'Date of Production',
                        fsize: 18,
                        weight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                Container(
                  height: mHeight / 14,
                  width: mWidth / 1.15,
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Txt(text:"${selectedDate.toLocal()}".split(' ')[0],fsize: 18,color: Appcolor,),
                          Txt(
                            text:
                                "${selectedDate.day.toString()}-${selectedDate.month.toString()}-${selectedDate.year.toString()}"
                                    .split(' ')[0],
                            fsize: 16,
                            color: blackColor,
                          ),
                          InkWell(
                              onTap: () {
                                _selectDate(context);
                                setState(() {});
                              },
                              child: Icon(Icons.calendar_month))
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Once ypu upload every detail above, click on submit release button and keep ypur mobile aside for 5-7 minutes, it takes few minutes to get your tracks details uploaded. Once your track gets uploaded, you will be redirected to the profile page.",
                    textAlign: TextAlign.justify,
                  ),
                ),
                //Image.asset('assets/songupload.png',scale: 3,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Obx(
                    () => InkWell(
                      onTap: () async {
                        if (_cnt6.dropDownValue?.name == null) {
                          Fluttertoast.showToast(msg: 'Select Album Title');
                        } else if (_cnt.dropDownValue?.name == null) {
                          Fluttertoast.showToast(msg: 'Select Track Type');
                        } else if (_cnt1.dropDownValue?.name == null) {
                          Fluttertoast.showToast(
                              msg: 'Select Instrumental Type');
                        } else if (uploadsongcon.title.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Title');
                        } else if (uploadsongcon.artist.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Primary Artist');
                        } else if (uploadsongcon.featuring.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Featuring');
                        } else if (uploadsongcon.lyricist.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Lyricist');
                        } else if (uploadsongcon.composition.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Composition');
                        } else if (uploadsongcon.music.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Music');
                        } else if (_cnt2.dropDownValue?.name == null) {
                          Fluttertoast.showToast(msg: 'Select Production Year');
                        } else if (uploadsongcon.isrc.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter ISRC Code');
                        } else if (_cnt3.dropDownValue?.name == null) {
                          Fluttertoast.showToast(msg: 'Select Genre');
                        } else if (_cnt4.dropDownValue?.name == null) {
                          Fluttertoast.showToast(
                              msg: 'Select Parental Advisory');
                        } else if (_cnt5.dropDownValue?.name == null) {
                          Fluttertoast.showToast(msg: 'Select Lyrics Language');
                        } else if (uploadsongcon.label.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Enter Label Name');
                        } else {
                          await uploadsongcon.uploadapi(
                              _cnt6.dropDownValue?.value ?? '',
                              _cnt.dropDownValue?.name ?? '',
                              _cnt1.dropDownValue?.name ?? '',
                              _cnt2.dropDownValue?.name ?? '',
                              _cnt3.dropDownValue?.name ?? '',
                              _cnt4.dropDownValue?.name ?? '',
                              _cnt5.dropDownValue?.name ?? '',
                              "${selectedDate.day.toString()}-${selectedDate.month.toString()}-${selectedDate.year.toString()}"
                                  .split(' ')[0]);
                        }
                      },
                      child: Container(
                        height: mHeight / 16,
                        width: mWidth / 1.1,
                        decoration: BoxDecoration(
                            color: pinkColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Image.asset('assets/upload.png',scale: 4,),
                            SizedBox(
                              width: 7,
                            ),
                            uploadsongcon.load.value == true
                                ? CupertinoActivityIndicator(
                                    color: whiteColor,
                                  )
                                : Txt(
                                    text: 'Submit',
                                    fsize: 18,
                                    weight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: mHeight / 16,
                    width: mWidth / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset('assets/upload.png',scale: 4,),
                        SizedBox(
                          width: 7,
                        ),
                        Txt(
                          text: 'Cancel',
                          fsize: 18,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
