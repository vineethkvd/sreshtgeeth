import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/base_colors.dart';
import '../../../../common/text.dart';
import '../../controller/setting_controller.dart';

class artistcontactDetails extends StatefulWidget {
  const artistcontactDetails({super.key});

  @override
  State<artistcontactDetails> createState() => _artistcontactDetailsState();
}

class _artistcontactDetailsState extends State<artistcontactDetails> {
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
                      child: Txt(text: 'Contact Details',fsize: 18,weight: FontWeight.w500,),
                    )
          ],
        ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(children: [Txt(text:'Contact No',color: RedColor,fsize: 15,)],),
              Row(
                children: [
                  Txt(text: "${settingcon.contentdata?.websiteContent[0].contactNumber}",fsize: 15,),
                ],
              ),
              
              Row(children: [Txt(text:'Email ID',color: RedColor,fsize: 15,)],),
              Row(
                children: [
                  Txt(text: "${settingcon.contentdata?.websiteContent[0].email}",fsize: 15,),
                ],
              )
            ],),
          
        )
        ],
      ),
    )),);
  }
}