import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/view/Artist/artistNotification.dart';
import 'package:sreshtgeeth/view/Artist/controller/home_controller.dart';
import 'package:sreshtgeeth/view/Artist/skeleton/homepage_skeleton.dart';

import '../../api_endpoints.dart';
import 'artistSettings/artistSetting.dart';
import 'artistpodcast/schedulePodcast.dart';
import 'songupload/artistUpload.dart';

class ArtistHome extends StatefulWidget {
  const ArtistHome({super.key});

  @override
  State<ArtistHome> createState() => _ArtistHomeState();
}

class _ArtistHomeState extends State<ArtistHome> {
  HomeCon homecon = Get.put(HomeCon());
  File? _image;
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await homecon.dashboardapi();
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: homecon.dashboarddata?.data.length == []
            ? HomeSkeleton()
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(() => const artistsetting());
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                                onTap: () {
                                  Get.to(() => ArtistNotification());
                                },
                                child: Image.asset(
                                  'assets/Notification.png',
                                  scale: 4,
                                )),
                          )
                        ],
                      ),
                    ),
                    Stack(alignment: Alignment.bottomRight, children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Container(
                          height: mHeight / 6.5,
                          width: mWidth / 3.2,
                          child: Image.network(
                              '${homecon.dashboarddata?.data[0].profile ?? ''}',
                              fit: BoxFit.contain),
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            await imagePicker();
                          },
                          child: Image.asset(
                            'assets/edit.png',
                            scale: 3.5,
                          )),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Txt(
                        text: homecon.dashboarddata?.data[0].artistName ?? '',
                        fsize: 24,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Txt(
                      text: 'Followers :  ${homecon.dashboarddata?.follower}',
                      fsize: 16,
                      weight: FontWeight.w500,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Txt(
                        text:
                            'Promo Code :  ${homecon.dashboarddata?.data[0].artistPromocode ?? ' '}',
                        fsize: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: mHeight / 9,
                      width: mWidth / 1.15,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7.0,
                            spreadRadius: 0.2,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Txt(
                                  text: '${homecon.dashboarddata?.songs ?? ''}',
                                  fsize: 16,
                                  weight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Txt(
                                  text: 'Total Songs',
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Txt(
                                  text:
                                      '₹ ${homecon.dashboarddata?.totalEarning ?? ''}',
                                  fsize: 16,
                                  weight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Txt(
                                  text: 'Total Revenue',
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Txt(
                                  text:
                                      '${homecon.dashboarddata?.totalplaytime ?? ''}',
                                  fsize: 16,
                                  weight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Txt(
                                  text: 'Total Playtime',
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => ArtistUpload());
                            },
                            child: Container(
                              height: mHeight / 21,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: blackColor)),
                              child: const Center(
                                child: Txt(
                                  text: 'Songs',
                                  color: blackColor,
                                  fsize: 16,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ScheduledCast());
                            },
                            child: Container(
                              height: mHeight / 21,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: blackColor)),
                              child: Center(
                                child: Txt(
                                  text: 'Podcast',
                                  color: blackColor,
                                  fsize: 16,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: homecon.dashboarddata?.songList.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: mHeight / 16,
                                              width: mWidth / 8.5,
                                              //color: Colors.amber,
                                              child: Image.network(
                                                '${homecon.dashboarddata?.songList[index].cover ?? ''}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      width: mWidth / 1.55,
                                      height: mHeight / 17,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Txt(
                                            text:
                                                '${homecon.dashboarddata?.songList[index].rjSongTitle ?? ''}',
                                            fsize: 14,
                                            weight: FontWeight.w500,
                                          ),
                                          Txt(
                                            text:
                                                '${homecon.dashboarddata?.songList[index].addDate ?? ''}',
                                            fsize: 12,
                                          ),
                                          Txt(
                                            text:
                                                '${homecon.dashboarddata?.songList[index].status ?? ''}',
                                            fsize: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        //Txt(text: 'Eligible Play Minutes',),
                                        Txt(
                                          text:
                                              '${homecon.dashboarddata?.songList[index].playtime ?? ''}',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: mHeight / 300,
                                child: const Divider(
                                  thickness: 1,
                                  color: bgreyColor,
                                ),
                              ),
                            ],
                          );
                        })
                  ],
                ),
              ),
      ),
    );
  }

  imagePicker() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
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

  void takePicture() async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, imageQuality: 25);
    homecon.storedImage = File(imageFile!.path);
    await cropimage(homecon.storedImage!.path);

    setState(() {
      // init.getimage();
    });
    // imagepicker();
    // init.getimage();
  }

  takecameraPicture() async {
    final imageFile = await homecon.picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, imageQuality: 25);

    homecon.storedImage = File(imageFile!.path);
    await cropimage(homecon.storedImage!.path);

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
    homecon.image = File(croppedFile!.path);
    if (homecon.image != null) {
      await homecon.updateprofileapi();
      await homecon.dashboardapi();
    }

    setState(() {});
  }
}
