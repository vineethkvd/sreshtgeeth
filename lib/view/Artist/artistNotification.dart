import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/auth.dart';
import 'controller/home_controller.dart';

class ArtistNotification extends StatefulWidget {
  const ArtistNotification({super.key});

  @override
  State<ArtistNotification> createState() => _ArtistNotificationState();
}

class _ArtistNotificationState extends State<ArtistNotification> {
  HomeCon homecon = Get.put(HomeCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }
  call()async{
    await homecon.artistnotificationapi();
    if(this.mounted){
      setState(() {
      
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: greyColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
             Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,),
                  child:   IconButton(
                    icon: Icon(
                Icons.arrow_back,
                color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                      Txt(text: 'Notification',fsize: 18,weight: FontWeight.w500,),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,size: 30,)),
                      ),
                       ],
                     ),
             ),
                 Container(height: mHeight/1.1,width: mWidth/1.1,
            child: ListView.builder(  physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
         shrinkWrap: true,
         itemCount: homecon.artistnotificationdata?.notificationList.length ?? 0,
         itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  height: mHeight/8,
                  width: mWidth/3.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                     color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Image.asset('assets/dot.png',scale: 2.5,),
                        Txt(text: '${homecon.artistnotificationdata?.notificationList[index].time}',color: darkGreyColor,)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Image.asset('assets/notifications.png',scale: 3,),
                        Column(children: [
                          Container(
                            width: mWidth/1.5,
                            child: Text('${homecon.artistnotificationdata?.notificationList[index].msg}',textAlign: TextAlign.center,maxLines: 2,style: TextStyle(fontWeight:  FontWeight.w500,fontSize: 13,))),
                        ],)
                      ],),
                    ),
                    
                  ]),
                ),
          );
         }), 
            ),
             
        ]),
      ),
    ));
  }
}