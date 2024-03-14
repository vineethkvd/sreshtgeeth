import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/base_colors.dart';
import '../../../../common/text.dart';

class artistHelpline extends StatefulWidget {
  const artistHelpline({super.key});

  @override
  State<artistHelpline> createState() => _artistHelplineState();
}

class _artistHelplineState extends State<artistHelpline> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
        child: Scaffold(
     
      backgroundColor: whiteColor,
      body: Column(
        children: [
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
                      padding: const EdgeInsets.only(left: 110),
                      child: Txt(text: 'Helpline',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Group118.png',
                height: mHeight / 2.40,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Txt(
                text: '24*7 Helpline',
                fsize: 25,
                weight: FontWeight.bold,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              SizedBox(
                width: mWidth / 1.10,
                child: Txt(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  iscenter: true,
                  fsize: 15,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              SizedBox(
                width: mWidth / 3,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/contact.png', color: whiteColor,scale: 2,),
                      SizedBox(width: 10,),
                      Text('Call'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    // acon.makePhoneCall();
                  },
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
