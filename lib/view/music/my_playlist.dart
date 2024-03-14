
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'controller/music_controller.dart';

class playSongs extends StatefulWidget {
  const playSongs({super.key});

  @override
  State<playSongs> createState() => _playSongsState();
}

class _playSongsState extends State<playSongs> {
  MusicCon musiccon = Get.put(MusicCon());
  AudioPlayer audioPlayer = AudioPlayer();
    @override
  void initState() {
    call();
    super.initState();
    
  }

  call()async{
    
  }
  
 @override
 void dispose() {
   super.dispose();
 }
  void bottomsheet() {
    showModalBottomSheet(
      // enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        // final AuthCon auth = Get.put(AuthCon());
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              height: 510,
              child: Column(
                children: [
                  Container(
                    height: mHeight / 5.5,
                    child: Image.asset(
                      'assets/song.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Txt(
                    text: 'Workship Songs',
                    fsize: 14,
                    weight: FontWeight.bold,
                  ),
                  Txt(
                    text: 'Sidhui moose wala,Burno bo..',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/islike.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'Like',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/queue.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'Add to queue',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/playlist.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'Add to Playlist',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/viewalbum.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'View Album',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/viewartist.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'View Artist',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                          Row(
                          children: [
                            Image.asset('assets/report.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'Report',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/viewshare.png',scale: 4,),
                            SizedBox(
                              width: 20,
                            ),
                            Txt(
                              text: 'Share',
                              fsize: 14,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;


    return SafeArea(child: Container(
         decoration: BoxDecoration(
            // image: 
            // DecorationImage(
            //     image: NetworkImage(
            //       "${musiccon.albumdetaildata?.album[0].cover ?? ""}",
            //     ),
            //     fit: BoxFit.cover)
                ),
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
                Image.asset('assets/arrowdown.png',scale: 4.5,),
                Column(children: [
                  Txt(text: '${musiccon.albumdetaildata?.album[0].ablumTitle ?? ""}',color: whiteColor,fsize: 18,),
                  Txt(text: '${musiccon.albumdetaildata?.album[0].artistName ?? ""}',color: whiteColor,fsize: 18,)
                  ],),
                  IconButton(
                    onPressed: (){
                      bottomsheet();
                    }, 
                    icon: Icon(
                      Icons.more_vert_rounded,color: whiteColor,
                    ))
                  ],),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(backgroundImage: NetworkImage('${musiccon.albumdetaildata?.album[0].cover ?? ""}'),radius: 130,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/plays.png',scale: 3,),
                  SizedBox(width: 5,),
                  Txt(text: 'asdfghjhgfds',color: whiteColor,fsize: 14,),
              ],),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Container(
                    //color: Colors.amber,
                    width: mWidth/1.38,
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Txt(text: 'sdfghgfds',color: whiteColor,fsize: 16,),
                         SizedBox(height: 5,),
                         Txt(text: 'dfghjkjhgfds',color: whiteColor,fsize: 12,),
                       ],
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/download.png',scale: 3,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/Heart.png',scale: 3,),
                    ),
                 ],
               ),
             ),
             SizedBox(height: 25),
             Image.asset('assets/frequency.png',scale: 4,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(children: [
                  Txt(text: '00',color: whiteColor,fsize: 12,),
                Expanded(
                  child: Slider(  
                                value:8,
                                min: 0,  
                                max: 8,
                                activeColor: whiteColor,  
                                inactiveColor: whiteColor,  
                                //label: '${_value}',  
                                onChanged: (value)async {
                                  },  
                                  // semanticFormatterCallback: (double newValue) {  
                                  //   return '${newValue.round()} dollars';  
                                  // }  
                                ),
                ),
                Txt(text: '60',color: whiteColor,fsize: 12,),
               ],),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 8,right: 8),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset('assets/shuffle.png',scale: 3.5,),
                   Image.asset('assets/backward.png',scale: 3.5,),
                   InkWell(
                    onTap: () async{
                      
                    },
                    child:Image.asset('assets/playmusic.png',scale: 3.5,)),
                   Image.asset('assets/forward.png',scale: 3.5,),
                   InkWell(
                    onTap: ()async{
                       },
                    child: Image.asset('assets/replay.png',scale: 3.5,)),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/wave.png',scale: 3.5,),
                   SizedBox(width: 5,),
                   Txt(text: 'Audio Quality: High',color: whiteColor,fsize: 12,),
                 ],
               ),
             ),
          ],),
          // Container(
          //   child: DraggableScrollableSheet(
          //     initialChildSize: 0.10,
          //     minChildSize: 0.10,
          //     builder: (BuildContext context, ScrollController scrollController) {
          //       return SingleChildScrollView(
          //         controller: scrollController,
          //         child: draggable(id:),
          //       );
          //     },
          //   ),
          // ),
        ]),
        ),
    ),);
  }

  // String formatTime(Duration duration){
  //   String twoDigits(int n) => n.toString().padLeft(2,'0');
  //   final hours = twoDigits(duration.inHours);
  //   final minutes = twoDigits(duration.inMinutes.remainder(60));
  //   final seconds = twoDigits(duration.inSeconds.remainder(60));
  //   return[
  //      if(duration.inHours > 0 ) hours,
  //      minutes,
  //      seconds,
  //   ].join(':');
  //}


}