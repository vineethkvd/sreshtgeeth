import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/view/auth/otp.dart';
import 'package:sreshtgeeth/view/bottomsheet/homepage.dart';
import 'package:sreshtgeeth/view/bottomsheet/model/library.dart';
import 'package:sreshtgeeth/view/bottomsheet/podcast.dart';
import 'package:sreshtgeeth/view/bottomsheet/search.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';

import '../../common/text.dart';
import '../auth/login.dart';
import '../auth/register.dart';
import '../auth/searchArtist.dart';
import '../auth/selectchurch.dart';
import '../homemodule/searchsongs.dart';
import '../music/controller/music_controller.dart';
import 'primium.dart';

enum ThemeStyle {
  Light,
}

class Bottomsheet extends StatefulWidget {
  @override
  _BottomsheetState createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  int _currentIndex = 0;

  MusicCon musiccon = Get.put(MusicCon());
  AudioPlayer audioPlayer = AudioPlayer();
  //ThemeStyle _currentStyle = ThemeStyle.NotificationBadge;
  final pages = [
    const Home(),
    const SearchScreen(),
    const Podcast(),
    const library1(),
    const PrimiumScreen(),
  ];

  void onTap(int index) {
    _currentIndex = index;
    setState(() {});
  }

  // miniPlayer(){
  //   return AnimatedContainer(duration: const Duration(microseconds: 500 ),
  //   decoration: BoxDecoration( color: darkGreyColor,borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))),
  //   //width: mWidth,
  //   //height: 55,
  //   child: Row(
  //     children: [
  //          Padding(
  //            padding: const EdgeInsets.only(left: 0),
  //            child: ClipRRect(
  //                               borderRadius: BorderRadius.circular(10),
  //                               child: Container(
  //                                 height: mHeight / 18,
  //                                // width: mWidth / 9,
  //                                 //color: Colors.amber,
  //                                 child: Image.asset(
  //                                   'assets/livepod.png',
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                               ),
  //                             ),
  //          ),
  //       Column(
  //        // mainAxisAlignment: MainAxisAlignment.center,

  //         children: [
  //         Container(
  //               //color: Colors.amber,
  //               width: mWidth/1.55,
  //               height: mHeight/15,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 8),
  //                     child: Txt(text: '1.Naa-Daguchotu',fsize: 14,weight: FontWeight.w500,color: whiteColor,),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 8),
  //                     child: Txt(text: 'Sidhu Moose Wala, Burna Bo..',fsize: 12,color: whiteColor,),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //       ],),
  //          Padding(
  //            padding: const EdgeInsets.all(8.0),
  //            child: Image.asset('assets/playmusic.png',scale: 8,),
  //          ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Image.asset('assets/forward.png',scale: 8,),
  //             ),
  //     ],
  //   ),

  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better perfomance
      extendBody: true,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('wakkas'),
      // ),
      body: Stack(children: [
        pages[_currentIndex],
        //SizedBox(height: 100),

        ValueListenableBuilder(
            valueListenable: musiccon.musicplay,
            builder: (BuildContext context, bool heart, _) {
              return musiccon.musicplay.value == true
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 52),
                      child: Miniplayer(
                          minHeight: 60,
                          //  controller: ,
                          maxHeight: mHeight / 1,
                          builder: (height, percentage) {
                            return percentage > 0.2
                                ? MusicPlayer(
                                    id: "mini",
                                    types: "",
                                    songid: "",
                                    songtitle: "",
                                    indexx: 0,
                                  )
                                : miniPlayer();
                          }),
                    )
                  : Container(
                      color: Colors.black,
                      height: 0,
                    );
            }),
      ]),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    ThemeStyle.Light;
    return _buildLightDesign();
  }

  Widget miniPlayer() {
    return AnimatedContainer(
        duration: const Duration(microseconds: 500),
        decoration: const BoxDecoration(
            color: darkGreyColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        width: mWidth,
        height: 100,
        child: StreamBuilder<SequenceState?>(
            stream: musiccon.audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state?.sequence.isEmpty ?? true) {
                return Container(
                  color: whiteColor,
                  child: Center(
                    child: Image.asset(
                      "assets/loading.gif",
                      height: 80,
                    ),
                  ),
                );
              }
              final metadata = state?.currentSource?.tag as MediaItem;

              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: mHeight / 18,
                        width: mWidth / 9,
                        //color: Colors.amber,
                        child: Image.network(
                          metadata.artUri.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        //color: Colors.amber,
                        width: mWidth / 2,
                        height: mHeight / 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Txt(
                                text: metadata.title,
                                fsize: 14,
                                weight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Txt(
                                text: metadata.artist.toString(),
                                fsize: 12,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () async {
                        musiccon.audioPlayer.hasPrevious
                            ? await musiccon.audioPlayer.seekToPrevious()
                            : null;
                        await musiccon.songcountapi(
                            metadata.id,
                            musiccon.albumdetaildata?.album[0].albumId
                                    .toString() ??
                                '');
                      },
                      icon: Image.asset(
                        'assets/backward.png',
                        scale: 6,
                      )),
                  StreamBuilder(
                      stream: musiccon.audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        // if(musiccon.audioPlayer.playing){
                        //   musiccon.musicplay.value == true;
                        //   musiccon.isplaying = true;
                        // }
                        if (snapshot.hasData) {
                          final playerState = snapshot.data;
                          final processingState =
                              (playerState! as PlayerState).processingState;

                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering) {
                            return Container(
                              // width: 60,
                              // height: 60,
                              child: CircularProgressIndicator(),
                            );
                          } else if (musiccon.audioPlayer.playing) {
                            return Container(
                              height: 50,
                              width: 45,
                              child: IconButton(
                                onPressed: () {
                                  musiccon.audioPlayer.pause();
                                  // musiccon.musicplay.value = false;
                                },
                                icon: Image.asset(
                                  'assets/pausemusic.png',
                                  scale: 4,
                                ),
                              ),
                            );
                          } else if (processingState !=
                              ProcessingState.completed) {
                            return Container(
                              height: 50,
                              width: 45,
                              child: IconButton(
                                onPressed: () async {
                                  await musiccon.songcountapi(
                                      metadata.id,
                                      musiccon.albumdetaildata?.album[0].albumId
                                              .toString() ??
                                          '');
                                  musiccon.musicplay.value = true;
                                  await musiccon.audioPlayer.play();
                                },
                                icon: Image.asset(
                                  'assets/playmusic.png',
                                  scale: 4,
                                ),
                              ),
                            );
                          } else {
                            return IconButton(
                              onPressed: () => musiccon.audioPlayer.seek(
                                  Duration.zero,
                                  index: musiccon
                                      .audioPlayer.effectiveIndices!.first),
                              icon: Icon(
                                Icons.replay_circle_filled_outlined,
                                color: whiteColor,
                              ),
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),

                  // StreamBuilder(
                  //     stream: musiccon.audioPlayer.playerStateStream,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         final playerState = snapshot.data;
                  //         final processingState =
                  //             (playerState! as PlayerState).processingState;

                  //         if (processingState == ProcessingState.loading ||
                  //             processingState == ProcessingState.buffering) {
                  //           return Container(
                  //             // width: 60,
                  //             // height: 60,
                  //             child: CircularProgressIndicator(),
                  //           );
                  //         } else if (musiccon.audioPlayer.playing) {
                  //           return
                  //           Container(
                  //             height: 40,
                  //             width: 40,
                  //             child: IconButton(
                  //               onPressed: () {
                  //                 musiccon.audioPlayer.pause();
                  //                 // musiccon.musicplay.value = false;
                  //               },
                  //               icon: Image.asset(
                  //                 'assets/pausemusic.png',
                  //                 scale: 6,
                  //               ),
                  //             ),
                  //           );
                  //         } else if (processingState !=
                  //             ProcessingState.completed) {
                  //           return Container(
                  //             height: 40,
                  //             width: 40,
                  //             child: IconButton(
                  //               onPressed: () {
                  //                 musiccon.audioPlayer.play();
                  //                 //musiccon.musicplay.value = true;
                  //               },
                  //               icon: Image.asset(
                  //                 'assets/playmusic.png',
                  //                 scale: 6,
                  //               ),
                  //             ),
                  //           );
                  //         } else {
                  //           return IconButton(
                  //             onPressed: () => musiccon.audioPlayer.seek(
                  //                 Duration.zero,
                  //                 index: musiccon
                  //                     .audioPlayer.effectiveIndices!.first),
                  //             icon: Icon(
                  //               Icons.replay_circle_filled_outlined,
                  //               color: whiteColor,
                  //             ),
                  //           );
                  //         }
                  //       } else {
                  //         return const CircularProgressIndicator();
                  //       }
                  //     }),

                  IconButton(
                      onPressed: () async {
                        musiccon.audioPlayer.hasNext
                            ? await musiccon.audioPlayer.seekToNext()
                            : null;
                        await musiccon.songcountapi(
                            metadata.id,
                            musiccon.albumdetaildata?.album[0].albumId
                                    .toString() ??
                                '');
                      },
                      icon: Image.asset(
                        'assets/forward.png',
                        scale: 6,
                      )),

                  //  Padding(
                  //    padding: const EdgeInsets.all(8.0),
                  //    child: Image.asset('assets/playmusic.png',scale: 8,),
                  //  ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Image.asset('assets/forward.png',scale: 8,),
                  //     ),
                ],
              );
            }));
  }

  Widget _buildLightDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: redcolor,
      strokeColor: Color(0x30040307),
      unSelectedColor: blackColor,
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(
            "Search",
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.mic_none_outlined),
          title: Text(
            "Podcast",
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.library_music_outlined),
          title: Text(
            "Library",
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.star_border),
          title: Text(
            "Premium",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
