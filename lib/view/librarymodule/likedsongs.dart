import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../music/musicplayer.dart';

class LikedSongs extends StatefulWidget {
  const LikedSongs({super.key});

  @override
  State<LikedSongs> createState() => _LikedSongsState();
}

class _LikedSongsState extends State<LikedSongs> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
                     body:  SingleChildScrollView(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Txt(text: 'Liked Songss',fsize: 18,weight: FontWeight.w500,),
                    ),     
          ],
        ),
                           ListView.builder(  physics: NeverScrollableScrollPhysics(),
                                 scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index){
                               return Row(children: [
                                        Padding(
                            padding: const EdgeInsets.only(top: 12,bottom:12,left: 20,right: 12),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: mHeight / 15,
                                    width: mWidth / 7.65,
                                    //color: Colors.amber,
                                    child: Image.asset(
                                      'assets/livepod.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              
                              ],
                            ),
                                         ),
                                 InkWell(
                                  onTap: (){
                                     //Get.to(() => MusicPlayer());
                                  },
                                   child: Container(
                                    // color: Colors.amber,
                                     width: mWidth/1.7,
                                     height: mHeight/17,
                                     child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Txt(text: '1.Naa-Daguchotu',fsize: 14,weight: FontWeight.w500,),
                                         Txt(text: 'Sidhu Moose Wala, Burna Bo..',fsize: 12,),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Image.asset('assets/islike.png',scale: 3.5,),
                                 IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),
                               ],);
                               }),
                         ],
                       ),
                     ),
                     ));
  }
}