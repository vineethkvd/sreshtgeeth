import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:siri_wave/siri_wave.dart';

import 'controller/music_controller.dart';

class siriWave extends StatefulWidget {
  const siriWave({super.key, required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  State<siriWave> createState() => _siriWaveState();
}

class _siriWaveState extends State<siriWave> {
 MusicCon musiccon = Get.put(MusicCon());
  var isLoop = false.obs;
    Future setAudio()async{
    //repeat song when completed
    
    isLoop.value =! isLoop.value;

    print(isLoop.value);
    if(isLoop.value)
    await widget.audioPlayer.setLoopMode(LoopMode.one);
    else
    await widget.audioPlayer.setLoopMode(LoopMode.off);


    //load audio from url
    await widget.audioPlayer.audioSource;

    //load audio from file
   // final file = File(url);
   // audioPlayer.setSourceDeviceFile(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 15,right: 15),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          
          StreamBuilder(
            stream: widget.audioPlayer.playerStateStream,
            builder: (context, snapshot){
              if(snapshot.hasData){
                final playerState = snapshot.data;
                final processingState = (playerState! as PlayerState).processingState;

                if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                  return Container(
                    // width: 60,
                    // height: 60,
                    child: Container(),
                  );
                } else if(!widget.audioPlayer.playing){
                  return  SizedBox();
  
                } else if(processingState != ProcessingState.completed){
                  
              //musiccon.siriWaveController.setAmplitude(60);
                  return SiriWave(
              controller: musiccon.siriWaveController,
              style: SiriWaveStyle.ios_9,
              options: SiriWaveOptions(
               width: 360.0, // Width of the wave
               height: 60.0, // Height of the wave
              backgroundColor: Colors.black, // Background color
              //points: 4, // Number of points in the wave
              
              ),);
                } else {
                  return  SizedBox();

                }
              } else {
                  return const CircularProgressIndicator();
                }
            }
            ),
             ],
       ),
     );
  }
}
