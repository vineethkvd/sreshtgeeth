import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/Txt2.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../homemodule/notification.dart';
import '../homemodule/searchsongs.dart';
import '../music/musicplayer.dart';
import '../music/song_selection.dart';
import '../searchmodule/controller/search_controller.dart';
import '../settings/settings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchPageCon searchcon = Get.put(SearchPageCon());
  @override
  void initState() {
    // TODO: implement initState
    call();
    super.initState();
  }

  call() async {
    await searchcon.searchpageapi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => Setting());
                      },
                      icon: const Icon(Icons.menu)),
                  Txt(
                    text: 'Music App',
                    fsize: 18,
                    weight: FontWeight.bold,
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
            InkWell(
              onTap: () {
                Get.to(searchSongs());
              },
              child: Container(
                height: mHeight / 18,
                width: mWidth / 1.15,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/Search.png',
                        scale: 5,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Txt(
                      text: 'Search Music and Podcast',
                      color: darkGreyColor,
                      fsize: 14,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: 'Search History',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: mHeight / 15,
                // width: mWidth / 2,
                // color: Colors.amber,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: searchcon.searchdata?.recent?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Get.to(() => searchArtist());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: mHeight / 18,
                            // width: mWidth / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(width: 1)),
                            child: Center(
                                child: Txt(
                              text: searchcon
                                      .searchdata?.recent?[index].songTitle ??
                                  '',
                              fsize: 14,
                              weight: FontWeight.bold,
                              color: blackColor,
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: 'Recents',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: mHeight / 5,
                // width: mWidth / 2,
                // color: Colors.amber,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: searchcon.searchdata?.recent?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          //Get.to(SongleSelection());
                          Get.to(MusicPlayer(
                            id: searchcon.searchdata?.recent?[index].ablumId ?? "",
                            types: "song",
                            songid: searchcon.searchdata?.recent?[index].songId ?? "",
                            songtitle: searchcon.searchdata?.recent?[index].songTitle ?? "",
                            indexx: index,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  color: Colors.amber,
                                  child: Image.network(
                                    '${searchcon.searchdata?.recent?[index].cover ?? ""}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Txt2(
                                    text: searchcon.searchdata?.recent?[index].songTitle?? "",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: 'Songs you may like',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: mHeight / 5,
                // width: mWidth / 2,
                // color: Colors.amber,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: searchcon.searchdata?.songs?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          //Get.to(SongleSelection());
                          Get.to(MusicPlayer(
                            id: searchcon.searchdata?.songs?[index].ablumId ?? "",
                            types: "song",
                            songid: searchcon.searchdata?.songs?[index].songId ?? "",
                            songtitle: searchcon.searchdata?.songs?[index].songTitle ?? "",
                            indexx: index,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: mHeight / 7,
                                  width: mWidth / 5,
                                  color: Colors.amber,
                                  child: Image.network(
                                    '${searchcon.searchdata?.songs?[index].cover ?? ''}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Txt2(
                                    text: searchcon.searchdata?.songs?[index]
                                            .songTitle ??
                                        '',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Txt(
                    text: 'Playlist you may like',
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1 / 1.73,
                  //   mainAxisExtent:
                ),
                itemCount: searchcon.searchdata?.album?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(
                          MusicPlayer(
                            id: searchcon.searchdata?.album?[index].albumId,
                            types: "album",
                            songid: "",
                            songtitle: "",
                            indexx: index,
                          ),
                          transition: Transition.upToDown);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: mHeight / 7,
                              width: mWidth / 5,
                              color: Colors.amber,
                              child: Image.network(
                                '${searchcon.searchdata?.album?[index].cover}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Txt2(
                                text:
                                    '${searchcon.searchdata?.album?[index].ablumTitle}',
                                fsize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
