import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sreshtgeeth/view/Artist/ZegoAudio/home_page.dart';
import 'package:sreshtgeeth/view/Artist/ZegoAudio/live_page.dart';
import 'package:sreshtgeeth/view/Artist/controller/podcast_controller.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';
import '../../music/livepod.dart';
import '../ZegoAudio/startlive.dart';
import 'livestream.dart';

class ScheduledCast extends StatefulWidget {
  const ScheduledCast({super.key});

  @override
  State<ScheduledCast> createState() => _ScheduledCastState();
}

class _ScheduledCastState extends State<ScheduledCast> {
  final PodcastCon podcastcon = Get.put(PodcastCon());
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _cnt1;
  late SingleValueDropDownController _cnt2;
  late SingleValueDropDownController _cnt3;
  late SingleValueDropDownController _cnt4;
  late SingleValueDropDownController _cnt5;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    podcastcon.categorylist = [];
    podcastcon.storedImage = null;
    call();
    _cnt = SingleValueDropDownController();
    _cnt1 = SingleValueDropDownController();
    _cnt2 = SingleValueDropDownController();
    _cnt3 = SingleValueDropDownController();
    _cnt4 = SingleValueDropDownController();
    _cnt5 = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  call() async {
    await podcastcon.podcastcategoryapi();
    await podcastcon.dashboardapi();
    setState(() {});
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cnt1.dispose();
    _cnt2.dispose();
    _cnt3.dispose();
    _cnt4.dispose();
    _cnt5.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.center,
        // persistentFooterButtons: [
        //            Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: InkWell(
        //           onTap: () {
        //             //Get.off(() => UploadSongsArtist());
        //             bottomsheet();
        //           },
        //           child: Container(
        //                                 height: mHeight/16,
        //                                 width: mWidth/2,
        //                                 decoration: BoxDecoration(  color: pinkColor,borderRadius: BorderRadius.circular(8)),
        //                                 child: Row(
        //                                   mainAxisAlignment: MainAxisAlignment.center,
        //                                   children: [
        //                                     Txt(text: 'Scheduled Podcast',fsize: 18,weight: FontWeight.bold,color: whiteColor,),
        //                                   ],
        //                                 ),
        //                               ),
        //         ),
        //       ),
        // ],

        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: blackColor,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 105),
                      child: Txt(
                        text: 'Podcast',
                        fsize: 20,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Upcoming Podcast',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: mHeight / 3.8,
                  width: mWidth / 1.1,
                  child: podcastcon.podcastdashboarddata?.upcomingList.length ==
                          []
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: podcastcon
                                  .podcastdashboarddata?.upcomingList.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Get.to(()=> Livepod());
                                      bottomsheet(podcastcon
                                          .podcastdashboarddata
                                          ?.upcomingList[index]
                                          .podcastId);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: mHeight / 6.2,
                                        width: mWidth / 3.1,
                                        //color: Colors.amber,
                                        child: Image.network(
                                          '${podcastcon.podcastdashboarddata?.upcomingList[index].cover ?? ''}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Txt(
                                          text:
                                              '${podcastcon.podcastdashboarddata?.upcomingList[index].podcastTitle ?? ''}',
                                          weight: FontWeight.bold,
                                        ),
                                        Txt(
                                          text:
                                              'date: ${podcastcon.podcastdashboarddata?.upcomingList[index].scheduledDate ?? ''}',
                                          weight: FontWeight.bold,
                                        ),
                                        Txt(
                                          text:
                                              'time: ${podcastcon.podcastdashboarddata?.upcomingList[index].scheduledTime ?? ''}',
                                          weight: FontWeight.bold,
                                        ),
                                        Txt(
                                          text:
                                              '${podcastcon.podcastdashboarddata?.upcomingList[index].rjPodcastType ?? ''}',
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Podcast Title',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: mWidth / 1.15,
                  //color: greyColor,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: podcastcon.title,
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
                      //hintText: 'Featuring',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Podcast Category',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
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
                          // labelText: 'Select Category'
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 6,

                        dropDownList: podcastcon.categorylist,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Podcast Type',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
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
                          // labelText: 'Select Category'
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
                          DropDownValueModel(name: 'Audio', value: 1),
                          //DropDownValueModel(name: 'Video', value: 2),
                        ],
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Schedule Date',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
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
                                "${podcastcon.selectedDate.day.toString()}-${podcastcon.selectedDate.month.toString()}-${podcastcon.selectedDate.year.toString()}"
                                    .split(' ')[0],
                            fsize: 16,
                            color: blackColor,
                          ),
                          InkWell(
                              onTap: () => _selectDate(context),
                              child: Icon(Icons.calendar_month))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Schedule Time',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
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
                                '${podcastcon.selectedTime?.hour ?? DateTime.now().hour}:${podcastcon.selectedTime?.minute ?? DateTime.now().minute}',
                            fsize: 16,
                            color: blackColor,
                          ),
                          InkWell(
                              onTap: () async {
                                final TimeOfDay? time = await showTimePicker(
                                  context: context,
                                  initialTime: podcastcon.selectedTime ??
                                      TimeOfDay.now(),
                                  initialEntryMode: entryMode,
                                  //orientation: orientation,
                                );
                                setState(() {
                                  podcastcon.selectedTime = time;
                                });
                              },
                              child: Icon(Icons.timer))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Cover Image',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                podcastcon.storedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: mHeight / 6.5,
                          width: mWidth / 3.2,
                          //color: Colors.amber,
                          child: Image.file(
                            podcastcon.storedImage as File,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          imagePicker();
                        },
                        child: Container(
                            height: 150,
                            child: Image.asset('assets/songupload.png')),
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      if (podcastcon.storedImage == null) {
                        Fluttertoast.showToast(msg: 'Select Cover Image');
                      } else if (podcastcon.title.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Podcast Title');
                      } else if (_cnt.dropDownValue!.value == null) {
                        Fluttertoast.showToast(msg: 'Select Podcast Category');
                      } else if (_cnt1.dropDownValue!.value == null) {
                        Fluttertoast.showToast(msg: 'Select Podcast Type');
                      } else {
                        await podcastcon.scheculepodcastapi(
                            _cnt.dropDownValue?.value ?? '',
                            _cnt1.dropDownValue?.value ?? '');
                        _cnt.clearDropDown();
                        _cnt1.clearDropDown();
                        await call();

                        setState(() {});
                      }
                      //Get.off(() => UploadSongsArtist());
                      //bottomsheet();
                    },
                    child: Container(
                      height: mHeight / 16,
                      width: mWidth / 2,
                      decoration: BoxDecoration(
                          color: pinkColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Txt(
                            text: 'Schedule Podcast',
                            weight: FontWeight.bold,
                            fsize: 18,
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount:
                      podcastcon.podcastdashboarddata?.podcastList.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Txt(
                                text:
                                    '${podcastcon.podcastdashboarddata?.podcastList[index].heading}',
                                fsize: 18,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: mHeight / 4.6,
                          width: mWidth / 1.1,
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: podcastcon.podcastdashboarddata
                                      ?.podcastList[index].podcastList.length ??
                                  0,
                              itemBuilder: (BuildContext context, int indexx) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Get.to(()=> Livepod());
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Container(
                                            height: mHeight / 6.2,
                                            width: mWidth / 3.1,
                                            //color: Colors.amber,
                                            child: Image.network(
                                              '${podcastcon.podcastdashboarddata?.podcastList[index].podcastList[indexx].cover}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Txt(
                                          text:
                                              '${podcastcon.podcastdashboarddata?.podcastList[index].podcastList[indexx].podcastTitle}',
                                          weight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }

  void bottomsheet(podcastid) {
    showModalBottomSheet(
      // enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        // final AuthCon auth = Get.put(AuthCon());
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 8),
              height: 200,
              //color: blueColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Txt(
                          text: 'Scheduled Podcast',
                          fsize: 20,
                          weight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Txt(
                                text: 'Scheduled Date',
                                fsize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Txt(
                                text: '28/04/2023',
                                fsize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Txt(
                                text: 'Scheduled Time',
                                fsize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Txt(
                                text: '10:00 am',
                                fsize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: greenColor,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greenColor,
                              foregroundColor: whiteColor),
                          child: const Txt(
                            text: 'Start',
                            fsize: 14,
                            color: whiteColor,
                          ),
                          onPressed: () async {
                            // acon.storage.remove('driverId');
                            //Get.off(()=>const LiveStream());
                            //Get.to(HomePage());
                            await podcastcon.startpodcastdapi(podcastid);
                            await podcastcon.initialcallapi(podcastid);
                            Get.to(LivePage(
                              roomID: podcastid.toString(),
                              taskId: podcastcon.initialcalldata!.data!.taskId
                                  .toString(),
                            ));
                            // Navigator.of(context)
                            //     .pushAndRemoveUntil(
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 Login()),
                            //         (Route<dynamic> route) =>
                            //             false);
                            // SharedPreferences pref =
                            //     await SharedPreferences.getInstance();
                            // pref.clear();
                            // Navigator.of(context)
                            //     .pushAndRemoveUntil(
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 Login()),
                            //         (Route<dynamic> route) =>
                            //             false);
                          },
                        ),
                      ),
                      // Container(
                      //   height: 30,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: redcolor,
                      //   ),
                      //   child: ElevatedButton(
                      //    style: ElevatedButton.styleFrom(
                      //      backgroundColor: redcolor, foregroundColor: whiteColor),
                      //     child: const Txt(
                      //       text: 'End',
                      //       fsize: 14,
                      //       color: whiteColor,
                      //     ),
                      //     onPressed: () async {
                      //      // acon.storage.remove('driverId');
                      //       Get.back();

                      //       // SharedPreferences pref =
                      //       //     await SharedPreferences.getInstance();
                      //       // pref.clear();
                      //       // Navigator.of(context)
                      //       //     .pushAndRemoveUntil(
                      //       //         MaterialPageRoute(
                      //       //             builder: (context) =>
                      //       //                 Login()),
                      //       //         (Route<dynamic> route) =>
                      //       //             false);
                      //     },
                      //   ),

                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: podcastcon.selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050, 8));
    if (picked != null && picked != podcastcon.selectedDate) {
      setState(() {
        podcastcon.selectedDate = picked;
      });
    }
  }

  imagePicker() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        padding: EdgeInsets.only(left: 90, top: 12, bottom: 12, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
                takePicture();
                // galaryPickerSource(id, type, extra);
              },
              icon: Icon(
                Icons.image_outlined,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.back();
                takecameraPicture();
                //    cameraPickerSource(id, type, extra);
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  takePicture() async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, imageQuality: 25);

    podcastcon.storedImage = File(imageFile!.path);
    await cropimage(podcastcon.storedImage!.path);
    setState(() {
      // init.getimage();
    });
    // imagepicker();
    // init.getimage();
  }

  takecameraPicture() async {
    final imageFile = await podcastcon.picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, imageQuality: 25);

    podcastcon.storedImage = File(imageFile!.path);
    await cropimage(podcastcon.storedImage!.path);
    setState(() {
      // init.getimage();
    });
    // imagepicker();
    // init.getimage();
  }

  Future<Null> cropimage(String? source) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: source.toString(),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    podcastcon.image = File(croppedFile!.path);

    setState(() {});
  }
}
