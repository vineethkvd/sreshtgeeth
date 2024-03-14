import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';

class contactDetails extends StatefulWidget {
  const contactDetails({super.key});

  @override
  State<contactDetails> createState() => _contactDetailsState();
}

class _contactDetailsState extends State<contactDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Column(
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
                      padding: const EdgeInsets.only(left: 80),
                      child: Txt(text: 'Contact Details',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(children: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Txt(text:'feedback.rejoicemusic@gmail.com',color: RedColor,fsize: 14,),
              )],),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Txt(text: "Address: Flat No 304, Vijaya Sai residency Back Side KKR Cinima hall, Near Chuttugunta Circle, Guntur - 522004",fsize: 13,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Txt(text: "Mobile No: 9966990697",fsize: 14,),
                  ],
                ),
              )

            ],),
          ),
        ],
      ),
    )),);
  }
}