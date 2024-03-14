import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/controller/utils.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

import '../controller/podcast_controller.dart';
import 'constants.dart';

class LivePage extends StatefulWidget {
  final String roomID;
  final String taskId;
  final bool isHost;

  const LivePage(
      {Key? key,
      required this.roomID,
      required this.taskId,
      this.isHost = true})
      : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final PodcastCon podcastcon = Get.put(PodcastCon());

  @override
  void dispose() {
    call();
    super.dispose();
  }

  call() async {
    await podcastcon.stoppodcastapi(widget.roomID, widget.taskId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: ZegoUIKitPrebuiltLiveAudioRoom(
            appID: Utils
                .appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign: Utils
                .appSignIn, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: 'Host_01',
            userName: 'Mathangi',
            roomID: widget.roomID,
            config: ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              ..background = background()
              ..layoutConfig = getLayoutConfig()
              ..seatConfig = getSeatConfig()

            //..audioEffectConfig = getAudioEffect() as ZegoAudioEffectConfig
            ),
      ),
    );
  }

  ZegoLiveAudioRoomLayoutConfig getLayoutConfig() {
    final config = ZegoLiveAudioRoomLayoutConfig();
    config.rowConfigs = [
      ZegoLiveAudioRoomLayoutRowConfig(
        count: 1,
        alignment: ZegoLiveAudioRoomLayoutAlignment.center,
      ),
    ];
    return config;
  }

  Widget background() {
    /// how to replace background view
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset('assets/livepod.png').image,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.75),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Live Podcast',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 170,
              //backgroundColor: blackColor,
              backgroundImage: Image.asset(
                "assets/livepod.png",
              ).image,
            )
          ],
        ),
        Positioned(
          top: 10 + 20,
          left: 10,
          child: Text(
            'ID: ${widget.roomID}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff606060),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  ZegoLiveAudioRoomSeatConfig getSeatConfig() {
    return ZegoLiveAudioRoomSeatConfig(
        avatarBuilder: avatarBuilder,
        // closeIcon: Image.asset('assets/end.png'),
        // openIcon: Image.asset('assets/end.png'),
        showSoundWaveInAudioMode: true);
  }

  ZegoLiveAudioRoomSeatConfig getAudioEffect() {
    return ZegoLiveAudioRoomSeatConfig(
      avatarBuilder: (context, size, user, extraInfo) {
        return CircleAvatar(
          radius: 50,
        );
      },
    );
  }

  Widget avatarBuilder(
    BuildContext context,
    Size size,
    ZegoUIKitUser? user,
    Map<String, dynamic> extraInfo,
  ) {
    return CircleAvatar(
      maxRadius: size.width,
      //backgroundColor: blackColor,
      backgroundImage: Image.asset(
        "assets/podcast.png",
      ).image,
    );
  }
}
