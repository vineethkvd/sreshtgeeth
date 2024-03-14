import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/Artist/controller/setting_controller.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';

class artistprivacy extends StatefulWidget {
  const artistprivacy({super.key});

  @override
  State<artistprivacy> createState() => _artistprivacyState();
}

class _artistprivacyState extends State<artistprivacy> {
  SettingCon settingcon = Get.put(SettingCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }

  call()async{
   await settingcon.contentapi();
   setState(() {
     
   });
  }

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
                      child: Txt(text: 'Privacy Policy',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Html(data: settingcon.contentdata?.websiteContent[0].privacyPolicy ?? '',)
              ],),
         )
        ],
      ),
    )),);
  }
}