import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/settings/Edit%20Profile/editmobile.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/profile_controller.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  final ProfileCon pcon = Get.put(ProfileCon());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                padding: EdgeInsets.only(left: 80),
                child: Txt(
                  text: 'Edit Profile',
                  fsize: 18,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              'assets/man.png',
              scale: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mHeight / 15,
              width: mWidth / 1.2,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Txt(
                      text: pcon.profiledata?.profile[0].rjCusEmail ?? '',
                      color: blackColor,
                      fsize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mHeight / 15,
              width: mWidth / 1.2,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      text: pcon.profiledata?.profile[0].rjCusName ?? '',
                      color: blackColor,
                      fsize: 18,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Txt(
                          text: 'Edit',
                          color: darkGreyColor,
                          fsize: 18,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mHeight / 15,
              width: mWidth / 1.2,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      text: pcon.profiledata?.profile[0].rjCusPhone ?? '',
                      color: blackColor,
                      fsize: 18,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => editNumber());
                        },
                        child: Txt(
                          text: 'Edit',
                          color: darkGreyColor,
                          fsize: 18,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mHeight / 15,
              width: mWidth / 1.2,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      text: 'Age',
                      color: blackColor,
                      fsize: 18,
                    ),
                    Txt(
                      text: 'Edit',
                      color: darkGreyColor,
                      fsize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mHeight / 15,
              width: mWidth / 1.2,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      text: pcon.profiledata?.profile[0].rjCusGender ?? '',
                      color: blackColor,
                      fsize: 18,
                    ),
                    Txt(
                      text: 'Edit',
                      color: darkGreyColor,
                      fsize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
