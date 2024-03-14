import 'package:flutter/material.dart';
import 'package:sreshtgeeth/view/music/seekbar.dart';

import '../common/base_colors.dart';
import '../common/text.dart';

class bottomplayer extends StatefulWidget {
  final songid;
  const bottomplayer({super.key,required this.songid});

  @override
  State<bottomplayer> createState() => _bottomplayerState();
}

class _bottomplayerState extends State<bottomplayer> {

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
                    child: Image.network(
                      "",
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
                        InkWell(
                          onTap: ()async{await musiccon.songlikeapi(widget.songid);},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/islike.png',
                                scale: 4,
                              ),
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
                        ),
                        SizedBox(
                          height: 17,
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
                                width: 20,
                              ),
                              Txt(
                                text: 'Add to Playlist',
                                fsize: 14,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/viewalbum.png',
                              scale: 4,
                            ),
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
                            Image.asset(
                              'assets/viewartist.png',
                              scale: 4,
                            ),
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
                            Image.asset(
                              'assets/report.png',
                              scale: 4,
                            ),
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
                            Image.asset(
                              'assets/viewshare.png',
                              scale: 4,
                            ),
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
    return const Placeholder();
  }
}
