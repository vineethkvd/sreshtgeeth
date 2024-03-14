import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:share/share.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/view/music/play_button.dart';
import 'package:sreshtgeeth/view/music/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:sreshtgeeth/view/music/siri_wave.dart';
import 'package:sreshtgeeth/view/music/song_selection.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../viewalbum.dart';
import '../bottomsheet/controller/home_controller.dart';
import '../dynamic_links.dart';
import 'controller/music_controller.dart';
import 'dragsong.dart';

//AudioPlayer audioPlayer = AudioPlayer();
class MusicPlayer extends StatefulWidget {
  final id;
  final types;
  final songid;
  final songtitle;
  int indexx;
  MusicPlayer(
      {super.key,
        required this.id,
        required this.types,
        required this.songid,
        required this.songtitle,
        required this.indexx});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  MusicCon musiccon = Get.put(MusicCon());
  HomesCon homescon = Get.put(HomesCon());
  String? _linkMessage;
  bool _isCreatingLink = false;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  int index1 = 0;


  @override
  void initState() {

    super.initState();
    call();
  }

  Future<void> _createDynamicLink(bool short, String ids,String types,int songid,String songtitle,int indexx) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: kUriPrefix,
      link: Uri.parse(Stringnewuri+kHomepageLink+ids+"&"+types+"&"+songid.toString()+"&"+songtitle+"&"+indexx.toString()),
      androidParameters: const AndroidParameters(
        packageName: 'com.sreshtgeeth.app',
        minimumVersion: 0,
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
      await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
    print(url.toString());

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
    Share.share(url.toString());
  }


  call() async {
    if (widget.id != "mini") {
      print('object');
      if (widget.types == 'album') {
        if (musiccon.audioPlayer.playing &&
            widget.id == musiccon.id &&
            musiccon.songtype == 'album') {
          print('sameid');
        } else {
          if (musiccon.id != 0) musiccon.audioPlayer.dispose();
          musiccon.uriList.clear();
          await musiccon.albumdetailapi(widget.id, widget.types, widget.songid,
              widget.songtitle, widget.indexx);
          await audioPlayer.setAudioSource(ConcatenatingAudioSource(
              children: musiccon.uriList
            // children: [
            //   AudioSource.uri(Uri.parse('${musiccon.albumdetaildata?.song[0].songLink ?? ''}'))]
          ));
          musiccon.audioPlayer = audioPlayer;
          musiccon.id = widget.id;
          musiccon.songtype = 'album';
        }
      }

      if (widget.types == 'song') {
        if (musiccon.audioPlayer.playing &&
            widget.songid == musiccon.idd &&
            musiccon.songtype == 'song') {
          print('sameid');
        } else {
          if (musiccon.idd != 0) musiccon.audioPlayer.dispose();
          musiccon.uriList.clear();
          await musiccon.albumdetailapi(widget.id, widget.types, widget.songid,
              widget.songtitle, widget.indexx);
          await audioPlayer.setAudioSource(ConcatenatingAudioSource(
              children: musiccon.uriList
            // children: [
            //   AudioSource.uri(Uri.parse('${musiccon.albumdetaildata?.song[0].songLink ?? ''}'))]
          ));
          musiccon.audioPlayer = audioPlayer;

          musiccon.idd = widget.songid;
          musiccon.songtype = 'song';
        }
      }
      if (widget.types == 'podcast') {
        if (musiccon.audioPlayer.playing &&
            widget.songid == musiccon.idd &&
            musiccon.songtype == 'podcast') {
          print('sameid');
        } else {
          if (musiccon.idd != 0) musiccon.audioPlayer.dispose();
          musiccon.uriList.clear();
          await musiccon.albumdetailapi(widget.id, widget.types, widget.songid,
              widget.songtitle, widget.indexx);
          await audioPlayer.setAudioSource(ConcatenatingAudioSource(
              children: musiccon.uriList
            // children: [
            //   AudioSource.uri(Uri.parse('${musiccon.albumdetaildata?.song[0].songLink ?? ''}'))]
          ));
          musiccon.audioPlayer = audioPlayer;

          musiccon.idd = widget.songid;
          musiccon.songtype = 'podcast';
        }
      }
      musiccon.audioPlayer.currentIndexStream.listen((index) {
        // Fluttertoast.showToast(msg: index1.toString());
        if (index != null) {
          if (index1 == musiccon.albumdetaildata!.song.length) {
            index1 = 0;
          }
          // your code
          musiccon.songtitle.value =
              musiccon.albumdetaildata!.song[index1].songTitle.toString();
          musiccon.songartist.value =
              musiccon.albumdetaildata!.song[index1].songArtist.toString();
          musiccon.songcover.value =
              musiccon.albumdetaildata!.song[index1].cover.toString();
          //Fluttertoast.showToast(msg: musiccon.albumdetaildata!.song[index1].songLink.toString());
          index1++;
          //Fluttertoast.showToast(msg: index.toString());
        }
      });
      setState(() {});
    }
  }

  @override
  void dispose() {
    // if(musiccon.id != 0)
    // audioPlayer.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          musiccon.audioPlayer.positionStream,
          musiccon.audioPlayer.durationStream, (
          Duration position,
          Duration? duration,
          ) {
        return SeekBarData(position, duration ?? Duration.zero);
      });

  //   final Stream<String> _titletext = (() {
  //   MusicCon musiccon = Get.put(MusicCon());
  //   late final StreamController<String> controller;
  //   controller = StreamController<String>(
  //     onListen: () async {

  //       for (int i = 0; i < musiccon.albumdetaildata!.song.length; i++) {
  //         await Future<void>.delayed(const Duration(seconds: 3));
  //       controller.add(musiccon.albumdetaildata!.song[i].songTitle);
  //     }
  //     },
  //   );
  //   return controller.stream;
  // })();


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
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
                    height: 80.h,
                  ),
                ),
              );
            }
            final metadata = state?.currentSource?.tag as MediaItem;

            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        metadata.artUri.toString(),
                      ),
                      fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.75),
                body: Stack(children: [
                  Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  'assets/arrowdown.png',
                                  scale: 4.5,
                                )),
                            Column(
                              children: [
                                Txt(
                                  text:
                                  '${musiccon.albumdetaildata?.album[0].ablumTitle ?? ""}',
                                  color: whiteColor,
                                  fsize: 18.sp,
                                ),
                                Txt(
                                  text:
                                  '${musiccon.albumdetaildata?.album[0].artistName ?? ""}',
                                  color: whiteColor,
                                  fsize: 18.sp,
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () async{
                                  showModalBottomSheet(
                                    // enableDrag: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      // final AuthCon auth = Get.put(AuthCon());
                                      return SafeArea(
                                        child: SingleChildScrollView(
                                          child: Container(
                                            padding: EdgeInsets.only(top: 20.w),
                                            height:double.infinity,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 30.h,
                                                ),
                                                CircleAvatar(
                                                  radius:60.r,
                                                  backgroundImage: NetworkImage(
                                                    metadata.artUri.toString(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Txt(
                                                  text: '${musiccon.albumdetaildata?.album[0].ablumTitle ?? ""}',
                                                  fsize: 14.sp,
                                                  weight: FontWeight.bold,
                                                ),
                                                Txt(
                                                  text: '${musiccon.albumdetaildata?.album[0].artistName ?? ""}',
                                                ),
                                                SizedBox(
                                                  height: 20.sp,
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.all(8.0.w),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: ()async{await musiccon.songlikeapi(widget.songid);},
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/islike.png',
                                                              scale: 4,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'Like',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      ),
                                                      // Row(
                                                      //   children: [
                                                      //     Image.asset(
                                                      //       'assets/queue.png',
                                                      //       scale: 4,
                                                      //     ),
                                                      //     SizedBox(
                                                      //       width: 20,
                                                      //     ),
                                                      //     Txt(
                                                      //       text: 'Add to queue',
                                                      //       fsize: 14,
                                                      //       weight: FontWeight.bold,
                                                      //     )
                                                      //   ],
                                                      // ),
                                                      // SizedBox(
                                                      //   height: 17,
                                                      // ),
                                                      InkWell(
                                                        onTap: ()async{await musiccon.playlisttoadd(widget.songid);},
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/playlist.png',
                                                              scale: 4,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'Add to Playlist',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          Get.to(viewalbum(
                                                            id: widget.id,
                                                            types: widget.types,
                                                            songid: widget.songid,
                                                            songtitle: widget.songtitle,
                                                            indexx: widget.indexx,)
                                                          );

                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/viewalbum.png',
                                                              scale: 4,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'View Album',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      ),
                                                      InkWell(
                                                        onTap: ()async{
                                                          await musiccon.download12(widget.songid);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/download.png',
                                                              scale: 4,color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'Download',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      ),
                                                      InkWell(
                                                        onTap: ()async{
                                                          String? encodeQueryParameters(Map<String, String> params) {
                                                            return params.entries
                                                                .map((MapEntry<String, String> e) =>
                                                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                                .join('&');
                                                          }
                                                          final Uri emailUri = Uri(
                                                            scheme: 'mailto',
                                                            path: 'report@sreshthgeeth.com',
                                                            query: encodeQueryParameters({
                                                              "subject":"Reports regarding..Artist ${musiccon.albumdetaildata?.album[0].artistName ?? ""} ",
                                                              "body":"Hi "
                                                            }),
                                                          );
                                                          if(await canLaunchUrl(emailUri)){
                                                            launchUrl(emailUri);
                                                          }else{
                                                            throw Exception("could not lauch $emailUri");
                                                          }
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/report.png',
                                                              scale: 4,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'Report',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 17.h,
                                                      ),
                                                      InkWell(
                                                        onTap:  !_isCreatingLink
                                                            ? () => _createDynamicLink(false,widget.id,widget.types,widget.songid,widget.songtitle,widget.indexx)
                                                            : null,
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/viewshare.png',
                                                              scale: 4,
                                                            ),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Txt(
                                                              text: 'Share',
                                                              fsize: 14.sp,
                                                              weight: FontWeight.bold,
                                                            )
                                                          ],
                                                        ),
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

                                },
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: whiteColor,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: CircleAvatar(
                          backgroundImage:
                          NetworkImage(metadata.artUri.toString()),
                          radius: 130.r,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/plays.png',
                              scale: 3,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Txt(
                              text:
                              '${musiccon.albumdetaildata?.totalCount ?? ""}',
                              color: whiteColor,
                              fsize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Row(
                          children: [
                            SizedBox(
                              //color: Colors.amber,
                              width: mWidth / 1.38.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Txt(text: '${musiccon.albumdetaildata?.song[0].songTitle}',color: whiteColor,fsize: 16,),
                                  Txt(
                                    text: metadata.title,
                                    color: whiteColor,
                                    fsize: 16.sp,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Txt(
                                    text: metadata.artist.toString(),
                                    color: whiteColor,
                                    fsize: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: ()async{
                                await musiccon.download12(widget.songid);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Image.asset(
                                  'assets/download.png',
                                  scale: 3,
                                ),
                              ),
                            ),
                            metadata.playable == true
                                ? Padding(
                              padding:EdgeInsets.all(8.0.w),
                              child: InkWell(
                                onTap: () async {
                                  //metadata.playable = false;
                                  await musiccon
                                      .songunlikeapi(widget.songid);
                                },
                                child: Image.asset(
                                  'assets/islike.png',
                                  scale: 3,
                                ),
                              ),
                            )
                                : Padding(
                              padding:  EdgeInsets.all(8.0.w),
                              child: InkWell(
                                onTap: () async {
                                  //metadata.playable = true;
                                  await musiccon
                                      .songlikeapi(widget.songid);
                                },
                                child: Image.asset(
                                  'assets/Heart.png',
                                  scale: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      //  StreamBuilder<SequenceState?>(
                      // stream: audioPlayer.sequenceStateStream,
                      // builder: (context, snapshot){
                      //   final state = snapshot.data;
                      //         if (state?.sequence.isEmpty ?? true) {
                      //           return const SizedBox();
                      //         }
                      //         final metadata = state!.currentSource!.tag as MediaItem;
                      //   return Text(metadata.title);}
                      // ),
                      // Image.asset('assets/frequency.png',scale: 4,),
                      siriWave(audioPlayer: musiccon.audioPlayer),

                      StreamBuilder<SeekBarData>(
                          stream: _seekBarDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return Column(
                              children: [
                                SeekBar(
                                  position:
                                  positionData?.position ?? Duration.zero,
                                  duration:
                                  positionData?.duration ?? Duration.zero,
                                  onChangedEnd: musiccon.audioPlayer.seek,
                                ),
                              ],
                            );
                          }),
                      PlayerButton(
                        songid: metadata.id,
                        albumid: musiccon.albumdetaildata?.album[0].albumId
                            .toString() ??
                            '',
                      ),
                      // PlayerButton(audioPlayer: musiccon.audioPlayer),
                      Padding(
                        padding:EdgeInsets.all(12.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/wave.png',
                              scale: 3.5,
                            ),
                             SizedBox(
                              width: 5.w,
                            ),
                            Txt(
                              text: 'Audio Quality: High',
                              color: whiteColor,
                              fsize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.10,
                      minChildSize: 0.10,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: draggable(
                              id: widget.id,
                              types: widget.types,
                              songid: widget.songid,
                              songtitle: widget.songtitle,
                              indexx: widget.indexx),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
