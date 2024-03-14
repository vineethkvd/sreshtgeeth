import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/Artist/artistSettings/artistEditProfile/artistEditing.dart';
import 'package:sreshtgeeth/view/Artist/artistpodcast/dragLive.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../artistHomepage.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({super.key});

  @override
  State<LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  @override
  Widget build(BuildContext context) {
    final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

       return SafeArea(child: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/livepod.png",
                ),
                fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.75),
        body: Stack(
          children:[ 
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                      icon: Icon(
                  Icons.arrow_back,size: 30,
                  color: whiteColor,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  Txt(text: 'Live Podcast',color: whiteColor,fsize: 18,),
                    Image.asset('assets/podcastshare.png',height: 25,)
                    ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 20),
                child: CircleAvatar(backgroundImage: AssetImage('assets/livepod.png'),radius: 170,),
              ),
            
            
               Padding(
                 padding: const EdgeInsets.only(left: 8,right: 8,top: 30),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Image.asset('assets/Heart.png',scale: 2.5,),
                     Image.asset('assets/livestream.png',scale: 4,),
                     Image.asset('assets/download.png',scale: 2.5,),
                   ],
                 ),
               ),
               SizedBox(height: 30),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 50),
                     child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: redcolor,
                                        ),
                                        child: ElevatedButton(
                                         style: ElevatedButton.styleFrom(
                                           backgroundColor: redcolor, foregroundColor: whiteColor),
                                          child: const Txt(
                                            text: 'End',
                                            fsize: 14,
                                            color: whiteColor,
                                          ),
                                          onPressed: () async {
                                           // acon.storage.remove('driverId');
                                            Get.offAll(ArtistHome());
                                        
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
                   ),
                 ],
               ),
               
            ],),
             Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.10,
              minChildSize: 0.10,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: draggableLive(),
                );
              },
            ),
          ),
        ])),
    ),);
  
  }
}