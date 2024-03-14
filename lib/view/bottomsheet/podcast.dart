import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sreshtgeeth/view/joinpodcast/join_podcast.dart';
import 'package:sreshtgeeth/view/music/seekbar.dart';
import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../music/musicplayer.dart';
import '../podcastmodule/controller/podcastdetail_controller.dart';
import '../podcastmodule/upcoming_podcast.dart';
import 'controller/podcastuser_controller.dart';

class Podcast extends StatefulWidget {
  const Podcast({super.key});

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  final _controller = PageController();
  PodcastUserCon podcon = Get.put(PodcastUserCon());
  PodcastDetailCon poddetailcon = Get.put(PodcastDetailCon());

  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await podcon.podcastdashboardapi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child:   IconButton(
                    // icon: Icon(
                    //   Icons.arrow_back,
                    //   color: blackColor,
                    // ),
                    // onPressed: () => Get.back(),
                    //     ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Txt(
                        text: 'Podcast',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, bottom: 8, right: 8, top: 8),
                  child: Container(
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    // color: Colors.black,
                    // height: 150,
                    height: mHeight / 4.8,
                    child: PageView.builder(
                      itemCount:
                          podcon.podcastuserdashboarddata?.banner?.length ?? 0,
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
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '${podcon.podcastuserdashboarddata?.banner?[index].banner ?? ''}',
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: podcon.podcastuserdashboarddata?.banner?.length ?? 0,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.grey.shade800,
                    dotHeight: 5,
                    dotWidth: 5,
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Txt(
                            text: 'Upcoming',
                            fsize: 18,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () async {
                              // Get.to(() => seeMore());
                              Get.to(upcomingPodcast());
                              // await poddetailcon.upcomingpodcastapi();
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
                      height: mHeight / 4.6,
                      width: mWidth / 1.1,
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: podcon.podcastuserdashboarddata
                                  ?.upcomingList?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      podcon
                                                  .podcastuserdashboarddata
                                                  ?.upcomingList?[index]
                                                  .podStatus ==
                                              "Completed"
                                          ? Fluttertoast.showToast(
                                              msg: 'The podcast is completed')
                                          : podcon
                                                      .podcastuserdashboarddata
                                                      ?.upcomingList?[index]
                                                      .podStatus ==
                                                  "Going To Starts"
                                              ? Fluttertoast.showToast(
                                                  msg:
                                                      'The podcast is going to start')
                                              : podcon
                                                          .podcastuserdashboarddata
                                                          ?.upcomingList?[index]
                                                          .podStatus ==
                                                      "Upcoming"
                                                  ? Fluttertoast.showToast(
                                                      msg:
                                                          'The podcast is completed')
                                                  : podcon
                                                              .podcastuserdashboarddata
                                                              ?.upcomingList?[
                                                                  index]
                                                              .podStatus ==
                                                          "Live"
                                                      ? Get.to(JoinPocast(
                                                          roomID: podcon
                                                              .podcastuserdashboarddata!
                                                              .upcomingList![
                                                                  index]
                                                              .podcastId
                                                              .toString()))
                                                      : Fluttertoast.showToast(
                                                          msg:
                                                              'Something went wrong');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: mHeight / 6.2,
                                        width: mWidth / 2.1,
                                        //color: Colors.amber,
                                        child: Image.network(
                                          '${podcon.podcastuserdashboarddata?.upcomingList?[index].cover}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Txt(
                                      text:
                                          '${podcon.podcastuserdashboarddata?.upcomingList?[index].podcastTitle}',
                                      weight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Top Followed',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     // Get.to(() => seeMore());
                      //   },
                      //   child: Container(
                      //     height: mHeight / 30,
                      //     width: mWidth / 4,
                      //     decoration: BoxDecoration(
                      //         color: redcolor,
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: const Center(
                      //         child: Txt(
                      //       text: 'See More',
                      //       fsize: 12,
                      //       weight: FontWeight.bold,
                      //       color: whiteColor,
                      //     )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: mHeight / 5.8,
                  width: mWidth / 1.1,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:
                          podcon.podcastuserdashboarddata?.follow?.length ?? 0,
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
                                  // Get.to(() => Livepod());
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      '${podcon.podcastuserdashboarddata?.follow?[index].artistCover}'),
                                  radius: 45,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Txt(
                                  text:
                                      '${podcon.podcastuserdashboarddata?.follow?[index].artistName}',
                                  weight: FontWeight.bold),
                            )
                          ]),
                        );
                      }),
                ),
                podcon.podcastuserdashboarddata?.recentPodcast?.length == 0 ? SizedBox()
                    : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Recent Streaming',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     // Get.to(() => seeMore());
                      //   },
                      //   child: Container(
                      //     height: mHeight / 30,
                      //     width: mWidth / 4,
                      //     decoration: BoxDecoration(
                      //         color: redcolor,
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: const Center(
                      //         child: Txt(
                      //       text: 'See More',
                      //       fsize: 12,
                      //       weight: FontWeight.bold,
                      //       color: whiteColor,
                      //     )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: mHeight / 4.6,
                  width: mWidth / 1.1,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: podcon.podcastuserdashboarddata?.recentPodcast
                          ?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(
                                      MusicPlayer(
                                        id: "",
                                        types: "podcast",
                                        songid: podcon.podcastuserdashboarddata?.recentPodcast?[index].podcastId,
                                        songtitle: podcon.podcastuserdashboarddata?.recentPodcast?[index].podcastTitle,
                                        indexx: index,
                                      ),
                                      transition: Transition.upToDown);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: mHeight / 6.2,
                                    width: mWidth / 2.1,
                                    //color: Colors.amber,
                                    child: Image.network(
                                      '${podcon.podcastuserdashboarddata?.recentPodcast?[index].cover??""}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Txt(
                                  text: podcon.podcastuserdashboarddata?.recentPodcast?[index].podcastTitle??"",
                                  weight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Txt(
                        text: 'Categories',
                        fsize: 18,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        podcon.podcastuserdashboarddata?.podcastList?.length ??
                            0,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text:
                                      '${podcon.podcastuserdashboarddata?.podcastList?[index].heading ?? ''}',
                                  fsize: 18,
                                  weight: FontWeight.w500,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     // Get.to(() => seeMore());
                                //   },
                                //   child: Container(
                                //     height: mHeight / 30,
                                //     width: mWidth / 4,
                                //     decoration: BoxDecoration(
                                //         color: redcolor,
                                //         borderRadius:
                                //             BorderRadius.circular(25)),
                                //     child: const Center(
                                //         child: Txt(
                                //       text: 'See More',
                                //       fsize: 12,
                                //       weight: FontWeight.bold,
                                //       color: whiteColor,
                                //     )),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Container(
                            height: mHeight / 4.6,
                            width: mWidth / 1.1,
                            child: ListView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: podcon
                                        .podcastuserdashboarddata
                                        ?.podcastList?[index]
                                        .podcastList
                                        ?.length ??
                                    0,
                                itemBuilder:
                                    (BuildContext context, int indexx) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            //    Get.to(() => JoinPocast(roomID: ));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Container(
                                              height: mHeight / 6.2,
                                              width: mWidth / 3.1,
                                              //color: Colors.amber,
                                              child: Image.network(
                                                '${podcon.podcastuserdashboarddata?.podcastList?[index].podcastList?[indexx].cover}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Txt(
                                            text:
                                                '${podcon.podcastuserdashboarddata?.podcastList?[index].podcastList?[indexx].podcastTitle}',
                                            weight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
