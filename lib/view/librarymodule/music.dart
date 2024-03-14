import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/view/librarymodule/controller/library_controller.dart';
import 'package:sreshtgeeth/view/librarymodule/likedsongs.dart';

import '../../common/base_colors.dart';
import '../../controller/auth.dart';
import '../music/musicplayer.dart';

class LibraryMusic extends StatefulWidget {
  const LibraryMusic({super.key});

  @override
  State<LibraryMusic> createState() => _LibraryMusicState();
}

class _LibraryMusicState extends State<LibraryMusic> {
  LibraryCon librarycon = Get.put(LibraryCon());
  @override
  void initState() {
    call();
    // TODO: implement initState
    super.initState();
  }

  call()async{
    await librarycon.musiclibraryapi();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 8,left: 20),
          //   child: Row(
          //     children: [
          //       Txt(text: 'Recent',fsize: 25,weight: FontWeight.w500,),
          //     ],
          //   ),
          // ),
          // ListView.builder(  physics: AlwaysScrollableScrollPhysics(),
          //         scrollDirection: Axis.vertical,
          //      shrinkWrap: true,
          //      itemCount: 3,
          //      itemBuilder: (BuildContext context, int index){
          //       return Row(children: [
          //                Padding(
          //                   padding: const EdgeInsets.only(top: 12,right: 12,left: 20,bottom: 12),
          //                   child: Column(
          //                     children: [
          //                       ClipRRect(
          //                         borderRadius: BorderRadius.circular(10),
          //                         child: Container(
          //                           height: mHeight / 14,
          //                           width: mWidth / 7,
          //                           //color: Colors.amber,
          //                           child: Image.asset(
          //                             'assets/livepod.png',
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                       ),
                              
          //                     ],
          //                   ),
          //                 ),
          //         InkWell(
          //           onTap: (){
          //             Get.to(()=> LikedSongs());
          //           },
          //           child: Container(
          //            //color: Colors.amber,
          //             width: mWidth/1.5,
          //             height: mHeight/17,
          //             child: Column(
          //              // mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Txt(text: 'Liked Songs',fsize: 16,weight: FontWeight.w500,),
          //                 Txt(text: '05-07-2023',fsize: 12,color: darkGreyColor,),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Image.asset('assets/libraryplay.png',scale: 3.5,),
          //         //IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),
          //       ],);
          //       }),
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Txt(text: 'Singers Followed',fsize: 18,weight: FontWeight.w500,),
                      InkWell(
                  onTap: (){
                   // Get.to(() => seeMore());
                  },
                   child: Container(
                                      height: mHeight/30,
                                      width: mWidth/4,
                                      decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
                                      child: const Center(child: Txt(text: 'See More',fsize: 12,weight: FontWeight.bold,color: whiteColor,)),
                                      
                                    ),
                           ),
                
                  ],),
                ),
                Container(height: mHeight/6.5,width:mWidth/1.1,
                child: ListView.builder(  physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                             shrinkWrap: true,
                             itemCount: librarycon.musiclibraryddata?.artistList.length ?? 0,
                             itemBuilder: (BuildContext context, int index){
                              return Container(
                    height: mHeight/10,
                    width: mWidth/3.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      InkWell(
                        onTap: (){
                          //Get.to(() => MusicPlayer());
                        },
                        child: CircleAvatar(backgroundImage: NetworkImage('${librarycon.musiclibraryddata?.artistList[index].artistCover ?? ""}'),radius: 45,)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Txt(text: '${librarycon.musiclibraryddata?.artistList[index].artistName ?? ""}',weight: FontWeight.bold),
                      )
                    ]),
                  );
                             }),
                ),
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Txt(text: 'Songs Liked',fsize: 18,weight: FontWeight.w500,),
                      InkWell(
                  onTap: (){
                   Get.to(() => LikedSongs());
                  },
                   child: Container(
                                      height: mHeight/30,
                                      width: mWidth/4,
                                      decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
                                      child: const Center(child: Txt(text: 'See More',fsize: 12,weight: FontWeight.bold,color: whiteColor,)),
                                      
                                    ),
                           ),
                  ],),
                ),
                  Container(height: mHeight/4,width: mWidth/1.1,
                child: ListView.builder(  physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
             shrinkWrap: true,
             itemCount: librarycon.musiclibraryddata?.songList.length ?? 0,
             itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: () {
                  Get.to(MusicPlayer(
                    id:librarycon.musiclibraryddata?.songList[index].ablumId ,
                    types: librarycon.musiclibraryddata?.songList[index].type,
                    songid: librarycon.musiclibraryddata?.songList[index].songId,
                    songtitle: librarycon.musiclibraryddata?.songList[index].songTitle,
                    indexx: index,
                  ));
                  print('object');
                },
                child: Row(children: [
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: mHeight / 15,
                                    width: mWidth / 7.65,
                                    //color: Colors.amber,
                                    child: Image.network(
                                      '${librarycon.musiclibraryddata?.songList[index].cover ?? ""}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                  Container(
                   // color: Colors.amber,
                    width: mWidth/2.03,
                    height: mHeight/17,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(text: '${librarycon.musiclibraryddata?.songList[index].songTitle ?? ""}',fsize: 14,weight: FontWeight.w500,),
                        Txt(text: '${librarycon.musiclibraryddata?.songList[index].songArtist ?? ""}',fsize: 12,),
                      ],
                    ),
                  ),
                ],),
              );
              })),
          Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Txt(text: 'My Playlist',fsize: 18,weight: FontWeight.w500,),
                      InkWell(
                  onTap: (){
                   //Get.to(() => seeMore());
                  },
                   child: Container(
                                      height: mHeight/30,
                                      width: mWidth/4,
                                      decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
                                      child: const Center(child: Txt(text: 'See More',fsize: 12,weight: FontWeight.bold,color: whiteColor,)),
                                      
                                    ),
                           ),
                  ],),
                ),

          librarycon.musiclibraryddata?.playList.length==null
              ?SizedBox() :Container(height: mHeight/6.5,width: mWidth/1.1,
                child: ListView.builder(  physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
             shrinkWrap: true,
             itemCount: librarycon.musiclibraryddata?.playList.length ?? 0,
             itemBuilder: (BuildContext context, int index){
              return Container(
                    height: mHeight/10,
                    width: mWidth/3.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      InkWell(
                        onTap: (){
                         // Get.to(() => MusicPlayer());
                        },
                        child: CircleAvatar(backgroundImage: NetworkImage('${librarycon.musiclibraryddata?.playList[index].cover ?? ""}'),radius: 45,)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Txt(text: '${librarycon.musiclibraryddata?.playList[index].songTitle ?? ""}',weight: FontWeight.bold,),
                      )
                    ]),
                  );
             }), 
                ),
             Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Txt(text: 'Downloaded Songs',fsize: 18,weight: FontWeight.w500,),
                      InkWell(
                  onTap: (){
                  // Get.to(() => seeMore());
                  },
                   child: Container(
                                      height: mHeight/30,
                                      width: mWidth/4,
                                      decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
                                      child: const Center(child: Txt(text: 'See More',fsize: 12,weight: FontWeight.bold,color: whiteColor,)),
                                      
                                    ),
                           ),
                  ],),
                ),

          librarycon.musiclibraryddata?.downlaodList.length==null?SizedBox():Container(height: mHeight/6.5,width: mWidth/1.1,
                child: ListView.builder(  physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
             shrinkWrap: true,
             itemCount: librarycon.musiclibraryddata?.downlaodList.length ?? 0,
             itemBuilder: (BuildContext context, int index){
              return Container(
                    height: mHeight/10,
                    width: mWidth/3.8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      InkWell(
                        onTap: (){
                         // Get.to(() => MusicPlayer());
                        },
                        child: CircleAvatar(backgroundImage: NetworkImage('${librarycon.musiclibraryddata?.downlaodList[index].cover ?? ""}'),radius: 45,)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Txt(text: '${librarycon.musiclibraryddata?.downlaodList[index].songTitle ?? ""}',weight: FontWeight.bold,),
                      )
                    ]),
                  );
             }), 
                ),
        ],
      ),
    ));
  }
}