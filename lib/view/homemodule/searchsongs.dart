import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/auth/register.dart';
import 'package:sreshtgeeth/view/homemodule/controller/homedetail_controller.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/auth.dart';
import '../music/musicplayer.dart';
import '../music/song_selection.dart';

class searchSongs extends StatefulWidget {
  const searchSongs({super.key});

  @override
  State<searchSongs> createState() => _searchSongsState();
}

class _searchSongsState extends State<searchSongs> {
  final HomeDetailCon hcon = Get.put(HomeDetailCon());

  @override
  void initState() {
    call();
    super.initState();
  }

  call() async {
    await hcon.searchapi('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(
            text: 'Search',
            fsize: 18,
            weight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child:hcon.searchdata?.searchResult.length==null?Center(child: CircularProgressIndicator(),):Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: mHeight / 16,
                    width: mWidth / 1.1,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/Search.png",
                            scale: 3,
                          ),
                        ),
                        //Txt(text: 'Search music and podcasts',color: darkGreyColor,fsize: 14,),
                        Container(
                          height: mHeight / 1,
                          width: mWidth / 1.3,
                          child: TextField(
                            controller: hcon.searchCon,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search ',
                                hintStyle: TextStyle(
                                    color: darkGreyColor, fontSize: 18)),
                            onChanged: (value) {
                              hcon.searchapi(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GetBuilder<HomeDetailCon>(
                builder: (controller) {
                  return controller.searchdata!.artist.isEmpty &
                          controller.searchdata!.searchResult.isEmpty &
                          controller.searchdata!.album.isEmpty
                      ? Container(
                          height: mHeight / 1.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/searchempty.gif',
                                scale: 4,
                              ),
                              Text(
                                "No Music Found",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            controller.searchdata!.searchResult.length == 0
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Txt(
                                          text: 'Songs',
                                          fsize: 18,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                            controller.searchdata!.searchResult.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                            .searchdata?.searchResult.length ??
                                        0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(MusicPlayer(
                                                    id: controller
                                                            .searchdata
                                                            ?.searchResult[
                                                                index]
                                                            .ablumId ??
                                                        "",
                                                    types: "song",
                                                    songid: controller
                                                        .searchdata
                                                        ?.searchResult[index]
                                                        .songId,
                                                    songtitle: controller
                                                            .searchdata
                                                            ?.searchResult[
                                                                index]
                                                            .songTitle ??
                                                        "",
                                                    indexx: index,
                                                  ));
                                                },
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Container(
                                                              height:
                                                                  mHeight / 15,
                                                              width:
                                                                  mWidth / 7.65,
                                                              //color: Colors.amber,
                                                              child:
                                                                  Image.network(
                                                                '${controller.searchdata?.searchResult[index].cover ?? ''}',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.searchdata?.searchResult[index].songTitle ?? ''}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            '${controller.searchdata?.searchResult[index].songArtist ?? ''}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // IconButton(
                                              //     onPressed: () {},
                                              //     icon: const Icon(Icons.add)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .more_vert_rounded)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                            child: Divider(
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                            controller.searchdata!.album.length == 0
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Txt(
                                          text: 'Album',
                                          fsize: 18,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                            controller.searchdata!.album.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.searchdata?.album.length ??
                                            0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      MusicPlayer(
                                                        id: controller
                                                                .searchdata
                                                                ?.album[index]
                                                                .albumId ??
                                                            "",
                                                        types: "album",
                                                        songid: "",
                                                        songtitle: "",
                                                        indexx: index,
                                                      ),
                                                      transition:
                                                          Transition.upToDown);
                                                },
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Container(
                                                              height:
                                                                  mHeight / 15,
                                                              width:
                                                                  mWidth / 7.65,
                                                              //color: Colors.amber,
                                                              child:
                                                                  Image.network(
                                                                '${controller.searchdata?.album[index].cover ?? ''}',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.searchdata?.album[index].ablumTitle ?? ''}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14),
                                                          ),
                                                          // Text(
                                                          //   '${hcon.searchdata?.album[index]. ?? ''}',
                                                          //   overflow: TextOverflow.ellipsis,
                                                          //   maxLines: 1,
                                                          //   style: TextStyle(fontSize: 12),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // IconButton(
                                              //     onPressed: () {},
                                              //     icon: const Icon(Icons.add)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .more_vert_rounded)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                            child: Divider(
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                            controller.searchdata!.artist.length == 0
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Txt(
                                          text: 'Artist',
                                          fsize: 18,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                            controller.searchdata!.artist.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.searchdata?.artist.length ??
                                            0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() => SongleSelection(
                                                        id: controller
                                                                .searchdata
                                                                ?.artist[index]
                                                                .rjArtistId ??
                                                            '',
                                                      ));
                                                },
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Container(
                                                              height:
                                                                  mHeight / 15,
                                                              width:
                                                                  mWidth / 7.65,
                                                              //color: Colors.amber,
                                                              child:
                                                                  Image.network(
                                                                '${controller.searchdata?.artist[index].cover ?? ''}',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.searchdata?.artist[index].rjArtistName ?? ''}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14),
                                                          ),
                                                          // Text(
                                                          //   '${hcon.searchdata?.searchResult[index].songArtist ?? ''}',
                                                          //   overflow: TextOverflow.ellipsis,
                                                          //   maxLines: 1,
                                                          //   style: TextStyle(fontSize: 12),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // IconButton(
                                              //     onPressed: () {},
                                              //     icon: const Icon(Icons.add)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .more_vert_rounded)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                            child: Divider(
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
