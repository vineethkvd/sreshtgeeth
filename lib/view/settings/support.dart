import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/settings/contact.dart';
import 'package:sreshtgeeth/view/settings/helpline.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      body: Column(children: [
                  Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
                  ),
              ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Txt(text: 'Support',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: mHeight / 19,
                  width: mWidth / 1.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: bgreyColor),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: mHeight / 25,
                      width: mWidth / 1.56,
                      child: TextFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Txt(
                  text: 'General topics',
                  fsize: 16,
                  weight: FontWeight.bold,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
             Get.to(() => contactDetails());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/contact.png',
                          height: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Txt(
                          text: 'Contact Details',
                          fsize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: mHeight / 300,
            child: Divider(
              thickness: 1,
              color: bgreyColor,
            ),
          ),
          InkWell(
            onTap: () {
             Get.to(() => Helpline());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/help.png',
                          height: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Txt(
                          text: 'Helpline',
                          fsize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: mHeight / 300,
            child: Divider(
              thickness: 1,
              color: bgreyColor,
            ),
          ),
      ]),
    ),);
  }
}