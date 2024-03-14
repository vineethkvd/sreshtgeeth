import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sreshtgeeth/common/text3.dart';
import 'package:sreshtgeeth/controller/auth.dart';
import 'package:sreshtgeeth/view/auth/register.dart';
import 'package:sreshtgeeth/view/homemodule/category.dart';
import 'package:sreshtgeeth/view/homemodule/gospel.dart';
import 'package:sreshtgeeth/view/homemodule/indianartist.dart';
import 'package:sreshtgeeth/view/homemodule/notification.dart';
import 'package:sreshtgeeth/view/homemodule/playlist.dart';
import 'package:sreshtgeeth/view/homemodule/popular.dart';
import 'package:sreshtgeeth/view/homemodule/searchsongs.dart';
import 'package:sreshtgeeth/view/homemodule/seemore.dart';
import 'package:sreshtgeeth/view/homemodule/trending.dart';
import 'package:sreshtgeeth/view/music/controller/music_controller.dart';
import 'package:sreshtgeeth/view/music/livepod.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';
import 'package:sreshtgeeth/view/music/myplaylist.dart';
import 'package:sreshtgeeth/view/settings/settings.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../music/song_selection.dart';
import 'controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomesCon homescon = Get.put(HomesCon());
  MusicCon musiccon = Get.put(MusicCon());
  AuthCon acon1 = Get.put(AuthCon());
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final _controller = PageController();
  final _controllers = PageController();
  int _current =0;
  bool status=true;

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      print(jsonEncode(queryParams));

      if (queryParams.isNotEmpty) {
        status=false;
        print(dynamicLinkData.link.path);
        print(queryParams.entries);
        print(9786700);

        String? id = queryParams["id"];
        String? types = queryParams["types"];
        String? songid = queryParams["songid"];
        String? songtitle = queryParams["songtitle"];
        String? indexx = queryParams["indexx"];
        //dynamicLinkData.link.path
        if(mounted){
          Navigator.pushNamed(context, '/MusicPlayer',
              arguments: {
                "id": "${id}",
                "types":"${types}",
                "songid":"${songid}",
                "songtitle":"${songtitle}",
                "indexx":"${indexx}"
              }
          );
        }
      } else {
        print(145);
        print(dynamicLinkData.link.path);
        Navigator.pushNamed(
          context,
          dynamicLinkData.link.path,
        );
      }
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
    await Future.delayed(const Duration(microseconds: 500));
    PendingDynamicLinkData? data =await FirebaseDynamicLinks.instance.getInitialLink();
    if(data?.link !=null){
      status=false;
      final Uri uri = data!.link;
      final queryParams = uri.queryParameters;
      print(jsonEncode(queryParams));

      if (queryParams.isNotEmpty) {
        print(data.link.path);
        print(queryParams.entries);
        print(9786700);



        // print(queryParams["productId"]);
        String? id = queryParams["id"];
        String? types = queryParams["types"];
        String? songid = queryParams["songid"];
        String? songtitle = queryParams["songtitle"];
        String? indexx = queryParams["indexx"];



        //dynamicLinkData.link.path
        if(mounted){
          if(acon.logindata!.status== true) {
            Get.to(MusicPlayer(
                id: "${id}",
                types: "${types}",
                songid: int.parse(songid!),
                songtitle: "${songtitle}",
                indexx: int.parse(indexx!)));
          }
        }
      }
      print(queryParams["id"]);
      print(data?.link);
    }

    // final Uri deepLink = data!.link;

  }
  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await homescon.dashboardapi();
    initDynamicLinks();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
        child: Scaffold(
      //bottomNavigationBar:  miniPlayer(),
      body: Stack(children: [
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => const Setting());
                        },
                        icon: const Icon(Icons.menu)),
                    InkWell(
                      onTap: () {
                        Get.to(searchSongs());
                      },
                      child: Container(
                        height: mHeight / 20,
                        width: mWidth / 1.37,
                        decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/Search.png',
                                scale: 3,
                              ),
                            ),
                            Txt(
                              text: 'Music,Artist,Podcast',
                              color: darkGreyColor,
                              fsize: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(() => notification());
                          },
                          child: Image.asset(
                            'assets/Notification.png',
                            scale: 5,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, bottom: 8, right: 8, top: 8),
                child: Container(
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  // color: Colors.black,
                  // height: 150,
                  height: mHeight / 4.8,
                  child: PageView.builder(
                    itemCount: homescon.dashboarddata?.banner.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    controller: _controllers,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Container(
                        height: 10,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CarouselSlider.builder(
                            itemCount: homescon.dashboarddata?.banner.length ?? 0,
                            itemBuilder: (BuildContext context, int index, int realIndex) {
                              return Container(
                                height: 200,
                                child: Image.network('${homescon.dashboarddata?.banner[index].banner ?? ''}'),
                              );
                            }, options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 15/7,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                              },
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedSmoothIndicator(
                count: homescon.dashboarddata?.banner.length ?? 0,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                  dotHeight: 5,
                  dotWidth: 5,
                ), activeIndex:_current,
              ),
              homescon.dashboarddata?.album.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),

              homescon.dashboarddata?.album.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'New Album',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => seeMore());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
              homescon.dashboarddata?.album.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 6.35,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: homescon.dashboarddata?.album.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: mHeight / 10,
                              width: mWidth / 3.8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                                InkWell(
                                    onTap: () {
                                      Get.to(
                                          MusicPlayer(
                                            id: homescon.dashboarddata
                                                    ?.album[index].albumId ??
                                                "",
                                            types: "album",
                                            songid: "",
                                            songtitle: "",
                                            indexx: index,
                                          ),
                                          transition: Transition.upToDown);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${homescon.dashboarddata?.album[index].cover ?? ""}'),
                                      radius: 45,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Txt3(
                                   text: homescon.dashboarddata?.album[index]
                                            .ablumTitle ??
                                        "",
                                  ),
                                )
                              ]),
                            );
                          }),
                    ),
              homescon.dashboarddata?.trendingSong.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.trendingSong.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'Trending',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => trending());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

              homescon.dashboarddata?.trendingSong.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 6.35,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              homescon.dashboarddata?.trendingSong.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {

                                Get.to(MusicPlayer(
                                  id: homescon.dashboarddata
                                          ?.trendingSong[index].ablumId ??
                                      "",
                                  types: "song",
                                  songid: homescon.dashboarddata
                                      ?.trendingSong[index].songId,
                                  songtitle: homescon.dashboarddata
                                          ?.trendingSong[index].songTitle ??
                                      "",
                                  indexx: index,
                                ));
                                print('object');
                              },
                              child: Container(
                                height: mHeight / 10,
                                width: mWidth / 3.8,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '${homescon.dashboarddata?.trendingSong[index].cover ?? ""}'),
                                    radius: 45,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Txt3(
                                        text: homescon
                                            .dashboarddata
                                            ?.trendingSong[index]
                                            .songTitle ??
                                            "",
                                      )),
                                ]),
                              ),
                            );
                          }),
                    ),
              homescon.dashboarddata?.adsBanner.length == 0
                  ? SizedBox()
                  : const SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.adsBanner.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 8, bottom: 8, right: 8, top: 8),
                      child: Container(
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        // color: Colors.black,
                        // height: 150,
                        height: mHeight / 4.8,
                        child: PageView.builder(
                          itemCount:
                              homescon.dashboarddata?.adsBanner.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Container(
                              height: 10,
                              width: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CarouselSlider.builder(
                                  itemCount: homescon.dashboarddata?.adsBanner.length ?? 0,
                                  itemBuilder: (BuildContext context, int index, int realIndex) {
                                    return Container(
                                      height: 200,
                                      child: Image.network('${homescon.dashboarddata?.adsBanner[index].banner ?? ""}'),
                                    );
                                  }, options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 15/7,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              homescon.dashboarddata?.adsBanner.length == 0
                  ? SizedBox()
                  : AnimatedSmoothIndicator(
                      count: homescon.dashboarddata?.adsBanner.length ?? 0,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.shade800,
                        dotHeight: 5,
                        dotWidth: 5,
                      ), activeIndex: _current,
                    ),
              homescon.dashboarddata?.artist.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.artist.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'Gospel Singer',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => gospel());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
              homescon.dashboarddata?.artist.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 6.35,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: homescon.dashboarddata?.artist.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                GetStorage().write("artistidkeyy11", homescon.dashboarddata?.artist[index]
                                    .rjArtistId ??
                                    '',);
                                Get.to(() => SongleSelection(
                                      id: homescon.dashboarddata?.artist[index]
                                              .rjArtistId ??
                                          '',
                                    ));
                              },
                              child: Container(
                                height: mHeight / 10,
                                width: mWidth / 3.8,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '${homescon.dashboarddata?.artist[index].cover ?? ""}'),
                                    radius: 45,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Txt3(
                                       text: homescon.dashboarddata?.artist[index]
                                                .rjArtistName ??
                                            "",
                                       ),
                                  )
                                ]),
                              ),
                            );
                          }),
                    ),
              homescon.dashboarddata?.gener.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.gener.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'Categories',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => category());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
              homescon.dashboarddata?.gener.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 6.35,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: homescon.dashboarddata?.gener.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: mHeight / 10,
                              width: mWidth / 3.8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                                InkWell(
                                    onTap: () {
                                      // Get.to(() => MusicPlayer());
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${homescon.dashboarddata?.gener[index].cover ?? ""}'),
                                      radius: 45,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Txt3(
                                     text: homescon.dashboarddata?.gener[index]
                                              .rjGenersName ??
                                          "",
                                      ),
                                )
                              ]),
                            );
                          }),
                    ),
              homescon.dashboarddata?.playList.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.playList.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'My Playlist',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => playlist());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

              homescon.dashboarddata?.playList.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 6.35,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              homescon.dashboarddata?.playList.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: mHeight / 10,
                              width: mWidth / 3.8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                                InkWell(
                                    onTap: () {
                                      Get.to(MusicPlayer(
                                        id: homescon.dashboarddata?.playList[index].ablumId,
                                        types: "song",
                                        songid: homescon.dashboarddata?.playList[index].songId,
                                        songtitle: homescon.dashboarddata?.playList[index].songTitle,
                                        indexx: index,
                                      ));
                                      print('object');
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${homescon.dashboarddata?.playList[index].cover ?? ''}'),
                                      radius: 45,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Txt3(
                                     text: homescon.dashboarddata?.playList[index]
                                              .songTitle ??
                                          '',
                                    ),
                                )
                              ]),
                            );
                          }),
                    ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [Image.asset('assets/ad.png',scale: 4,)],),
              homescon.dashboarddata?.livePodcast.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),

              homescon.dashboarddata?.livePodcast.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text: 'Live Podcast',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => seeMore());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

              homescon.dashboarddata?.livePodcast.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 4.6,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              homescon.dashboarddata?.livePodcast.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Livepod());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: mHeight / 6.2,
                                        width: mWidth / 3.3,
                                        //color: Colors.amber,
                                        child: Image.network(
                                          '${homescon.dashboarddata?.livePodcast[index].cover ?? ""}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Center(
                                      child: Txt(
                                        text: homescon
                                                .dashboarddata
                                                ?.livePodcast[index]
                                                .podcastTitle ??
                                            "",
                                        fsize: 14,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
              homescon.dashboarddata?.popularSong.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text: 'Popular Songs',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => popular());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
              homescon.dashboarddata?.popularSong.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 4,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:
                              homescon.dashboarddata?.popularSong.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(MusicPlayer(
                                  id: homescon.dashboarddata?.popularSong[index]
                                          .ablumId ??
                                      "",
                                  types: "song",
                                  songid: homescon
                                      .dashboarddata?.popularSong[index].songId,
                                  songtitle: homescon.dashboarddata
                                          ?.popularSong[index].songTitle ??
                                      "",
                                  indexx: index,
                                ));
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: mHeight / 15,
                                            width: mWidth / 7.65,
                                            //color: Colors.amber,
                                            child: Image.network(
                                              '${homescon.dashboarddata?.popularSong[index].cover ?? ''}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    width: mWidth / 2.03,
                                    height: mHeight / 17,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${homescon.dashboarddata?.popularSong[index].songTitle ?? ''}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '${homescon.dashboarddata?.popularSong[index].songTitle ?? ''}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.more_vert_rounded)),
                                ],
                              ),
                            );
                          })),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      text: 'Top Indian Artist',
                      fsize: 18,
                      weight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => indianArtist());
                      },
                      child: Container(
                        height: mHeight / 30,
                        width: mWidth / 4,
                        decoration: BoxDecoration(
                            color: redcolor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                            child: Txt(
                          text: 'See More',
                          fsize: 12,
                          weight: FontWeight.bold,
                          color: whiteColor,
                        )),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: mHeight / 6.35,
                width: mWidth / 1.1,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: homescon.dashboarddata?.topArtist.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: mHeight / 10,
                        width: mWidth / 3.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(children: [
                          InkWell(
                              onTap: () {
                                Get.to(() => SongleSelection(
                                      id: homescon.dashboarddata
                                              ?.topArtist[index].rjArtistId ??
                                          '',
                                    ));
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${homescon.dashboarddata?.topArtist[index].cover ?? ''}'),
                                radius: 45,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Txt3(
                               text: '${homescon.dashboarddata?.topArtist[index].rjArtistName ?? ''}',
                                ),
                          )
                        ]),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ad.png',
                    scale: 4,
                  )
                ],
              ),
              homescon.dashboarddata?.workshipSongs.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 10,
                    ),
              homescon.dashboarddata?.workshipSongs.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text: 'Workship Songs',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => seeMore());
                            },
                            child: Container(
                              height: mHeight / 30,
                              width: mWidth / 4,
                              decoration: BoxDecoration(
                                  color: redcolor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Txt(
                                text: 'See More',
                                fsize: 12,
                                weight: FontWeight.bold,
                                color: whiteColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

              homescon.dashboarddata?.workshipSongs.length == 0
                  ? SizedBox()
                  : Container(
                      height: mHeight / 4.6,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              homescon.dashboarddata?.workshipSongs.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(MusicPlayer(
                                  id: homescon.dashboarddata
                                          ?.workshipSongs[index].ablumId ??
                                      "",
                                  types: "song",
                                  songid: homescon.dashboarddata
                                      ?.workshipSongs[index].songId,
                                  songtitle: homescon.dashboarddata
                                          ?.workshipSongs[index].songTitle ??
                                      "",
                                  indexx: index,
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: mHeight / 6.2,
                                        width: mWidth / 3.1,
                                        //color: Colors.amber,
                                        child: Image.network(
                                          '${homescon.dashboarddata?.workshipSongs[index].cover ?? ''}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Txt(
                                          text:
                                              '${homescon.dashboarddata?.workshipSongs[index].songTitle ?? ''}',
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
              //     Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //     Txt(text: 'Contemporary Workship',fsize: 18,weight: FontWeight.w500,),
              //       InkWell(
              //   onTap: (){
              //    Get.to(() => seeMore());
              //   },
              //    child: Container(
              //                       height: mHeight/30,
              //                       width: mWidth/4,
              //                       decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
              //                       child: Center(child: Txt(text: 'See More',fsize: 12,weight: FontWeight.bold,color: whiteColor,)),

              //                     ),
              //            ),
              //   ],),
              // ),

              //       Container(height: mHeight/4.6,width: mWidth/1.1,
              //     child: ListView.builder(  physics: AlwaysScrollableScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //  shrinkWrap: true,
              //  itemCount: 10,
              //  itemBuilder: (BuildContext context, int index){
              //   return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 children: [
              //                   InkWell(
              //                     onTap: (){
              //                        Get.to(()=> SongleSelection());
              //                     },
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(10),
              //                       child: Container(
              //                         height: mHeight / 6.2,
              //                         width: mWidth / 3.1,
              //                         //color: Colors.amber,
              //                         child: Image.asset(
              //                           'assets/livepod.png',
              //                           fit: BoxFit.cover,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(top: 8.0),
              //                     child: Center(
              //                       child: Txt(
              //                         text: 'Workship song',
              //                         weight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             );
              //  }),
              //     ),
            ],
          ),
        ),
      ]),
    ));
  }
}
//