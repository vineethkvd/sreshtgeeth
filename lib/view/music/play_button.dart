import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

import '../../common/base_colors.dart';
import 'controller/music_controller.dart';

class PlayerButton extends StatefulWidget {
  // final artistid;
  final songid;
  final albumid;
  PlayerButton({super.key, this.songid, this.albumid});

  // final AudioPlayer audioPlayer;

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  MusicCon musiccon = Get.put(MusicCon());
  var isLoop = false.obs;
  Future setAudio() async {
    //repeat song when completed

    isLoop.value = !isLoop.value;

    print(isLoop.value);
    if (isLoop.value)
      await musiccon.audioPlayer.setLoopMode(LoopMode.one);
    else
      await musiccon.audioPlayer.setLoopMode(LoopMode.off);

    //load audio from url
    await musiccon.audioPlayer.audioSource;

    //load audio from file
    // final file = File(url);
    // audioPlayer.setSourceDeviceFile(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/shuffle.png',
            scale: 3.5,
          ),
          StreamBuilder(
              stream: musiccon.audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                return IconButton(
                    onPressed: () async {
                      String? times;
                      Stream<Duration> position =
                          musiccon.audioPlayer.positionStream;
                      position.listen((event) {
                        //  print('groijgnion');
                        times =
                            '${event.inMinutes.toString().padLeft(2, '0')}:${event.inSeconds.remainder(60).toString().padLeft(2, '0')} ';
                        //   print(event.inSeconds);
                      });
                      await Future.delayed(Duration(milliseconds: 10), () {
                        musiccon.updatetimeapi(
                            widget.songid, widget.albumid, times.toString());
                      });

                      musiccon.audioPlayer.hasPrevious
                          ? await musiccon.audioPlayer.seekToPrevious()
                          : null;
                      await musiccon.songcountapi(
                          widget.songid, widget.albumid);
                    },
                    icon: Image.asset(
                      'assets/backward.png',
                      scale: 3.5,
                    ));
              }),
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
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () async {
                          String? times;
                          Stream<Duration> position =
                              musiccon.audioPlayer.positionStream;
                          position.listen((event) {
                            //  print('groijgnion');
                            times =
                                '${event.inMinutes.toString().padLeft(2, '0')}:${event.inSeconds.remainder(60).toString().padLeft(2, '0')} ';
                            //   print(event.inSeconds);
                          });
                          await Future.delayed(Duration(milliseconds: 10), () {
                            musiccon.updatetimeapi(widget.songid,
                                widget.albumid, times.toString());
                          });

                          await musiccon.audioPlayer.pause();
                          // musiccon.musicplay.value = false;
                        },
                        icon: Image.asset(
                          'assets/pausemusic.png',
                          scale: 3.5,
                        ),
                      ),
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return Container(
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () async {
                          await musiccon.songcountapi(
                              widget.songid, widget.albumid);
                          musiccon.musicplay.value = true;
                          await musiccon.audioPlayer.play();
                        },
                        icon: Image.asset(
                          'assets/playmusic.png',
                          scale: 3.5,
                        ),
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () => musiccon.audioPlayer.seek(Duration.zero,
                          index: musiccon.audioPlayer.effectiveIndices!.first),
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
          StreamBuilder(
              stream: musiccon.audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                return IconButton(
                    onPressed: () async {
                      String? times;
                      Stream<Duration> position =
                          musiccon.audioPlayer.positionStream;
                      position.listen((event) {
                        //  print('groijgnion');
                        times =
                            '${event.inMinutes.toString().padLeft(2, '0')}:${event.inSeconds.remainder(60).toString().padLeft(2, '0')} ';
                        //   print(event.inSeconds);
                      });
                      await Future.delayed(Duration(milliseconds: 10), () {
                        musiccon.updatetimeapi(
                            widget.songid, widget.albumid, times.toString());
                      });

                      musiccon.audioPlayer.hasNext
                          ? await musiccon.audioPlayer.seekToNext()
                          : null;
                      await musiccon.songcountapi(
                          widget.songid, widget.albumid);
                      print(musiccon.audioPlayer.positionStream);
                    },
                    icon: Image.asset(
                      'assets/forward.png',
                      scale: 3.5,
                    ));
              }),
          Obx(() => InkWell(
              onTap: () async {
                await setAudio();
              },
              child: Image.asset(
                'assets/replay.png',
                scale: 3.5,
                color: isLoop.value ? Colors.blue : whiteColor,
              ))),
        ],
      ),
    );
  }
}
