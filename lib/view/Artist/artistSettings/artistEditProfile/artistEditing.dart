import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/base_colors.dart';
import '../../../../common/text.dart';
import '../../controller/setting_controller.dart';
import 'artisteditNumber.dart';

class artistname extends StatefulWidget {
  const artistname({super.key});

  @override
  State<artistname> createState() => _artistnameState();
}

class _artistnameState extends State<artistname> {
  SettingCon settingcon = Get.put(SettingCon());
  @override
  void initState() {
    //call();
    super.initState();
    
  }

  call()async{
   await settingcon.settingapi();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                      const Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Txt(text: 'Edit Profile',fsize: 18,weight: FontWeight.w500,),
                      ),      
            ],
          ),
          //  Padding(
          //    padding: const EdgeInsets.all(30.0),
          //    child: Image.asset('assets/man.png',scale: 2,),
          //  ),
           ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: mHeight / 16,
                                      width: mWidth / 8.5,
                                      //color: Colors.amber,
                                      child: Image.network(
                                        settingcon.settingdata?.data[0].profile ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                     height: mHeight/15,
                     width: mWidth/1.2,
                     decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                        children: [
                         
                          Txt(text: '${settingcon.settingdata?.data[0].artistEmail ?? ''}',color: blackColor,fsize: 18,),
                          
                        ],
                       ),
                     ),),
            ),
                      Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                     height: mHeight/15,
                     width: mWidth/1.2,
                     decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          Txt(text: '${settingcon.settingdata?.data[0].artistName ?? ''}',color: blackColor,fsize: 18,),
                          InkWell(
                            onTap: (){
                             
                            },
                            child: Txt(text: 'Edit',color: darkGreyColor,fsize: 18,)),
                          
                          
                        ],
                       ),
                     ),),
            ),
                 Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                     height: mHeight/15,
                     width: mWidth/1.2,
                     decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(text: '+91 ${settingcon.settingdata?.data[0].artistPhone ?? ''}',color: blackColor,fsize: 18,),
                          InkWell(
                            onTap: (){
                               Get.to(() => ArtistEditNumber());
                            },
                            child: Txt(text: 'Edit',color: darkGreyColor,fsize: 18,)),
                        ],
                       ),
                     ),),
            ),
            //    Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container( 
            //          height: mHeight/15,
            //          width: mWidth/1.2,
            //          decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(10)),
            //          child: Padding(
            //            padding: const EdgeInsets.all(12.0),
            //            child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
                         
            //               Txt(text: 'Age',color: blackColor,fsize: 18,),
            //               Txt(text: 'Edit',color: darkGreyColor,fsize: 18,),
                          
                          
            //             ],
            //            ),
            //          ),),
            // ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                     height: mHeight/15,
                     width: mWidth/1.2,
                     decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(text: '${settingcon.settingdata?.data[0].artistGender ?? ''}',color: blackColor,fsize: 18,),
                          Txt(text: 'Edit',color: darkGreyColor,fsize: 18,),
                        ],
                       ),
                     ),),
            ),
        ]),
      ),
    ));
  }
}