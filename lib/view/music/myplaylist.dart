import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'controller/music_controller.dart';
import 'dragsong.dart';

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({super.key});

  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLoop = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  MusicCon musiccon = Get.put(MusicCon());
  int _value = 6;  
  String url = 'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'; 
    @override
  void initState() {
    call();
    super.initState();
    
  }

  call()async{
    //listen to states: playing, paused,stopped
    audioPlayer.onPlayerStateChanged.listen((state) { 
      setState(() {
      isPlaying = state == PlayerState.playing;
    });
    });

    //listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration){
     setState(() {
       duration = newDuration;
     });
    });

    //listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });
    
    setState(() {
      
    });
  }
  
//  @override
//  void dispose() {
//    audioPlayer.dispose();
//    super.dispose();
//  }
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
                  Txt(text: formatTime(position),color: whiteColor,fsize: 12,),
                Expanded(
                  child: Slider(  
                                value: position.inSeconds.toDouble(),  
                                min: 0,  
                                max: duration.inSeconds.toDouble() + 1.0,
                                activeColor: whiteColor,  
                                inactiveColor: whiteColor,  
                                //label: '${_value}',  
                                onChanged: (value)async {  
                                    final position = Duration(seconds: value.toInt());
                                    await audioPlayer.seek(position);
                                    await audioPlayer.resume();
                                  },  
                                  // semanticFormatterCallback: (double newValue) {  
                                  //   return '${newValue.round()} dollars';  
                                  // }  
                                ),
                ),
                Txt(text: formatTime(duration - position),color: whiteColor,fsize: 12,),
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
                      if(isPlaying){
                        await audioPlayer.pause();
                      } else {
                        
                        await audioPlayer.play(UrlSource(url));
                      }
                    },
                    child:isPlaying? Image.asset('assets/pausemusic.png',scale: 20.8,):Image.asset('assets/playmusic.png',scale: 3.5,)),
                   Image.asset('assets/forward.png',scale: 3.5,),
                   InkWell(
                    onTap: ()async{
                       await setAudio();
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

  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return[
       if(duration.inHours > 0 ) hours,
       minutes,
       seconds,
    ].join(':');
  }

  Future setAudio()async{
    //repeat song when completed
    
    isLoop =! isLoop;

    print(isLoop);
    if(isLoop)
    await audioPlayer.setReleaseMode(ReleaseMode.loop);
    else
    await audioPlayer.setReleaseMode(ReleaseMode.stop);


    //load audio from url
    await audioPlayer.setSourceUrl(url);

    //load audio from file
   // final file = File(url);
   // audioPlayer.setSourceDeviceFile(file.path);
  }
}