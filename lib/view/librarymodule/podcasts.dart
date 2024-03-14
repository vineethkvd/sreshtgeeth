import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sreshtgeeth/common/text.dart';

import '../../common/base_colors.dart';
import '../../controller/auth.dart';
import 'controller/library_controller.dart';
import 'likedsongs.dart';

class LibraryPodcasts extends StatefulWidget {
  const LibraryPodcasts({super.key});

  @override
  State<LibraryPodcasts> createState() => _LibraryPodcastsState();
}

class _LibraryPodcastsState extends State<LibraryPodcasts> {
    LibraryCon librarycon = Get.put(LibraryCon());
  @override
  void initState() {
    call();
    // TODO: implement initState
    super.initState();
  }

  call()async{
    await librarycon.podcastlibraryapi();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
  final _controllers = PageController();
     final AuthCon acon = Get.put(AuthCon());
    int _current =0;
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return Scaffold(body:
     SingleChildScrollView(
       child: Column(
        children: [
          Padding(
             padding: const EdgeInsets.only(
                        left: 10, right: 8, top: 8),
            child: Row(children: [
              Txt(text: 'Upcoming',fsize: 18,weight: FontWeight.w500,),
            ]),
          ),
           Padding(
                    padding: const EdgeInsets.only(
                        left: 8, bottom: 8, right: 8, top: 8),
                    child: Container(
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      // color: Colors.black,
                      // height: 150,
                      height: mHeight / 4.8,
                      child:PageView.builder(
                          itemCount: 5,
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
                              child: CarouselSlider.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index, int realIndex) {
                                  return Container(
                                    height: 300,
                                    child: Image.asset('assets/ad.png'),
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
                  AnimatedSmoothIndicator(
                    count: 5,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.grey.shade800,
                      dotHeight: 5,
                      dotWidth: 5,
                    ), activeIndex: _current,
                  ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 20),
            child: Row(
              children: [
                Txt(text: 'Recent Played',fsize: 25,weight: FontWeight.w500,),
              ],
            ),
          ),
          ListView.builder(  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
               shrinkWrap: true,
               itemCount: librarycon.podcastlibraryddata?.recentPodcast.length ?? 0,
               itemBuilder: (BuildContext context, int index){
                return Row(children: [
                         Padding(
                            padding: const EdgeInsets.only(top: 12,right: 12,left: 20,bottom: 12),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: mHeight / 14,
                                    width: mWidth / 7,
                                    //color: Colors.amber,
                                    child: Image.network(
                                      '${librarycon.podcastlibraryddata?.recentPodcast[index].podcastCover}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                  InkWell(
                    onTap: (){
                      Get.to(()=> LikedSongs());
                    },
                    child: Container(
                     //color: Colors.amber,
                      width: mWidth/1.5,
                      height: mHeight/17,
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Txt(text: '${librarycon.podcastlibraryddata?.recentPodcast[index].rjPodcastTitle ?? ""}',fsize: 16,weight: FontWeight.w500,),
                          Txt(text: '${librarycon.podcastlibraryddata?.recentPodcast[index].rjPodcastTitle ?? ""}',fsize: 12,color: darkGreyColor,),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/libraryplay.png',scale: 3.5,),
                  //IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),
                ],);
                }),
                 Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Txt(text: 'Downloaded Podcast',fsize: 18,weight: FontWeight.w500,),
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
               itemCount: librarycon.podcastlibraryddata?.downlaodList.length ?? 0,
               itemBuilder: (BuildContext context, int index){
                return Row(children: [
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
                                      '${librarycon.podcastlibraryddata?.downlaodList[index].podcastCover ?? ""}',
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
                        Txt(text: '${librarycon.podcastlibraryddata?.downlaodList[index].rjPodcastTitle ?? ""}',fsize: 14,weight: FontWeight.w500,),
                        Txt(text: '${librarycon.podcastlibraryddata?.downlaodList[index].playDate ?? ""}',fsize: 12,),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),
                ],);
                })),
        ],
         ),
     ));
  }
}