import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sreshtgeeth/view/music/controller/music_controller.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';
import 'common/base_colors.dart';
import 'common/text.dart';
class viewalbum extends StatefulWidget {
  final id;
  final types;
  final songid;
  final songtitle;
  final indexx;
  viewalbum({super.key,
    required this.id,
    required this.types,
    required this.songid,
    required this.songtitle,
    required this.indexx});

  @override
  State<viewalbum> createState() => _viewalbumState();
}

class _viewalbumState extends State<viewalbum> {

  MusicCon musiccon = Get.put(MusicCon());
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    if (widget.id != "mini") {
      await musiccon.albumdetailapi(widget.id, widget.types, widget.songid,
          widget.songtitle, widget.indexx);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Album',
                        fsize: 22,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    '${musiccon.albumdetaildata?.album[0].cover ?? ""}',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/Heart.png',
                      color: Colors.black,
                      scale: 3,
                    ),
                    Image.asset(
                      'assets/play.png',
                      scale: 4,
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
                          shrinkWrap: true,
                          itemCount: musiccon.albumdetaildata?.song.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('object');
                                    Get.to(MusicPlayer(
                                      id: widget.id ?? "",
                                      types: "song",
                                      songid: musiccon
                                          .albumdetaildata?.song[index].songId,
                                      songtitle: musiccon.albumdetaildata?.song[index]
                                          .songTitle ??
                                          "",
                                      indexx: index,
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Container(
                                              height: mHeight / 16,
                                              child: Image.network(
                                                '${musiccon.albumdetaildata?.song[index].cover ?? ""}',
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
                                              Text(
                                                '${musiccon.albumdetaildata?.song[index].songTitle ?? ""}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                              Txt(
                                                text:
                                                '${musiccon.albumdetaildata?.song[index].songArtist ?? ""}',
                                                fsize: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      print(
                                          'object${musiccon.albumdetaildata?.otherAlbum[index].cover.toString()}');
                                    },
                                    icon: const Icon(Icons.more_vert_rounded)),
                              ],
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
                        text: 'Other Albums',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: musiccon.albumdetaildata?.otherAlbum.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              print('object');
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        height: mHeight / 16,
                                        child: Image.network(
                                          '${musiccon.albumdetaildata?.otherAlbum[index].cover ??""}',
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
                                        Text(
                                          '${'${musiccon.albumdetaildata?.otherAlbum[index].ablumTitle ?? ""}'}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              ]),
          ),
      ),
    );
  }
}
//
//
//