import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'controller/music_controller.dart';
import 'musicplayer.dart';

class draggable extends StatefulWidget {
  final id;
  final types;
  final songid;
  final songtitle;
  final indexx;
  draggable(
      {super.key,
      required this.id,
      required this.types,
      required this.songid,
      required this.songtitle,
      required this.indexx});

  @override
  State<draggable> createState() => _draggableState();
}

class _draggableState extends State<draggable> {
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
    return SingleChildScrollView(
      //physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding:EdgeInsets.only(top: 45.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: whiteColor,
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Container(
                height: 10.h,
                width: 120.w,
                decoration: BoxDecoration(
                    color: blackColor, borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    text: 'Suggestions',
                    fsize: 22.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Container(
              height: mHeight / 5.h,
              width: mWidth / 2.5.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  '${musiccon.albumdetaildata?.album[0].cover ?? ""}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
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
              padding:  EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: musiccon.albumdetaildata?.song.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkResponse(
                          onTap: () {
                            try {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return MusicPlayer(
                                  id: widget.id ?? "",
                                  types: "song",
                                  songid: musiccon.albumdetaildata?.song[index]?.songId ?? "",
                                  songtitle: musiccon.albumdetaildata?.song[index]?.songTitle ?? "",
                                  indexx: index,
                                );
                              },));
                              // Get.to();
                            } catch (e) {
                              print('Error navigating to MusicPlayer: $e'); // Error handling
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:EdgeInsets.all(8.0.w),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0.r),
                                        child: Container(
                                          height: mHeight / 16.h,
                                          child: Image.network(
                                            '${musiccon.albumdetaildata?.song[index].cover ?? ""}',
                                          ),
                                        )),
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    width: mWidth / 2.02.w,
                                    height: mHeight / 17.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 4.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${musiccon.albumdetaildata?.song[index].songTitle ?? ""}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                          Txt(
                                            text:
                                                '${musiccon.albumdetaildata?.song[index].songArtist ?? ""}',
                                            fsize: 12.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    print(
                                        'object${musiccon.albumdetaildata?.otherAlbum[index].cover.toString()}');
                                  },
                                  icon: const Icon(Icons.more_vert_rounded)),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(15.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Txt(
                    text: 'You might also like',
                    fsize: 18.sp,
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
                itemCount: musiccon.albumdetaildata?.otherAlbum.length ?? 0,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: mHeight / 5.5.h,
                          width: mWidth / 2.5.w,
                          color: Colors.amber,
                          child: Image.network(
                            musiccon.albumdetaildata?.otherAlbum[index].cover ??
                                "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.w),
                        child: Center(
                          child: Txt(
                            text:
                                '${musiccon.albumdetaildata?.otherAlbum[index].ablumTitle ?? ""}',
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
