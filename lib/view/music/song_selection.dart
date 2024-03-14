import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/homemodule/controller/homedetail_controller.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'controller/music_controller.dart';
import 'musicplayer.dart';

class SongleSelection extends StatefulWidget {
  final id;
  const SongleSelection({super.key, required this.id});

  @override
  State<SongleSelection> createState() => _SongleSelectionState();
}

class _SongleSelectionState extends State<SongleSelection> {
  MusicCon musiccon = Get.put(MusicCon());
  HomeDetailCon homedetailcon = Get.put(HomeDetailCon());
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await musiccon.artistdetailapi(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/arrow.png',
                          height: mHeight / 35,
                        ),
                      )),
                  Txt(
                    text:
                        '${musiccon.artistdetaildata?.artist[0].rjArtistName ?? ''}',
                    fsize: 18,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/Notification.png',
                          scale: 5,
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: mHeight / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '${musiccon.artistdetaildata?.artist[0].cover ?? ''}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                musiccon.artistdetaildata!.artist[0].follow == true
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            //metadata.playable = false;
                            await homedetailcon.unfollowapi(musiccon
                                    .artistdetaildata?.artist[0].rjArtistId ??
                                '');
                            await musiccon.artistdetailapi(widget.id);
                            setState(() {});
                          },
                          child: Image.asset(
                            'assets/islike.png',
                            scale: 3,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            //metadata.playable = true;
                            await homedetailcon.followapi(musiccon
                                    .artistdetaildata?.artist[0].rjArtistId ??
                                '');
                            await musiccon.artistdetailapi(widget.id);
                            setState(() {});
                          },
                          child: Image.asset(
                            'assets/Heart.png',
                            color: blackColor,
                            scale: 3,
                          ),
                        ),
                      ),
                InkWell(
                  onTap: () {
                    Get.to(MusicPlayer(
                      id: musiccon.artistdetaildata?.song[0].ablumId ?? "",
                      types: "song",
                      songid: musiccon.artistdetaildata?.song[0].songId ?? "",
                      songtitle:
                          musiccon.artistdetaildata?.song[0].ablumId ?? "",
                      indexx: 0,
                    ));
                  },
                  child: Image.asset(
                    'assets/play.png',
                    scale: 4,
                  ),
                ),
                Image.asset(
                  'assets/sharemusic.png',
                  scale: 3.5,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: musiccon.artistdetaildata?.song.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to(MusicPlayer(
                              id: musiccon
                                      .artistdetaildata?.song[index].ablumId ??
                                  "",
                              types: "song",
                              songid:
                                  musiccon.artistdetaildata?.song[index].songId,
                              songtitle: musiccon.artistdetaildata?.song[index]
                                      .songTitle ??
                                  "",
                              indexx: index,
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          height: mHeight / 16,
                                          child: Image.network(
                                            '${musiccon.artistdetaildata?.song[index].cover ?? ""}',
                                          ),
                                        )),
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    width: mWidth / 2.02,
                                    height: mHeight / 17,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Txt(
                                            text:
                                                '${musiccon.artistdetaildata?.song[index].songTitle ?? ""}',
                                            fsize: 14,
                                            weight: FontWeight.w500,
                                          ),
                                          Txt(
                                            text:
                                                '${musiccon.artistdetaildata?.song[index].songArtist ?? ""}',
                                            fsize: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_rounded)),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: 'You might also like',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.1,
                    crossAxisSpacing: 6

                    //   mainAxisExtent:
                    ),
                shrinkWrap: true,
                itemCount: musiccon.artistdetaildata?.allAlbum.length ?? 0,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: mHeight / 5.5,
                          width: mWidth / 2.5,
                          color: Colors.amber,
                          child: Image.network(
                            '${musiccon.artistdetaildata?.allAlbum[index].cover ?? ""}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Txt(
                            text:
                                '${musiccon.artistdetaildata?.allAlbum[index].ablumTitle}',
                            fsize: 12,
                            weight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
