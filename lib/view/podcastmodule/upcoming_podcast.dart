import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../auth/marque_text.dart';
import '../music/musicplayer.dart';
import 'controller/podcastdetail_controller.dart';

class upcomingPodcast extends StatefulWidget {
  const upcomingPodcast({super.key});

  @override
  State<upcomingPodcast> createState() => _upcomingPodcastState();
}

PodcastDetailCon poddetailcon = Get.put(PodcastDetailCon());

class _upcomingPodcastState extends State<upcomingPodcast> {
  @override
  void initState() {
    call();
    super.initState();
  }

  List checklist = poddetailcon.upcomingpodcastdata!.upcomingList ?? [];
  void searchitemto(String query) {
    final suggestions =
        poddetailcon.upcomingpodcastdata!.upcomingList!.where((s) {
      final partname = s.podcastTitle.toString().toLowerCase();
      final input = query.toLowerCase();
      return partname.contains(input);
      //  if(partname.contains(input))
      //  {
      //   return true;
      //  }
      //  return false;
    }).toList();
    setState(() => checklist = suggestions);
    print('as' + checklist.toString());
    print('aaaaaaaaaaaaaaaaaaaaaaaaa' + query);
  }

  call() async {
    await poddetailcon.upcomingpodcastapi();
    checklist = poddetailcon.upcomingpodcastdata!.upcomingList ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
//final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 75),
                  child: Txt(
                    text: "Upcoming",
                    fsize: 18,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              height: mHeight / 16,
              width: mWidth / 1.1,
              decoration: BoxDecoration(
                  color: greyColor, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/Search.png',
                      scale: 3,
                    ),
                  ),
                  //Txt(text: 'Search music and podcasts',color: darkGreyColor,fsize: 14,),
                  Container(
                    height: mHeight / 1,
                    width: mWidth / 1.3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search ',
                          hintStyle:
                              TextStyle(color: darkGreyColor, fontSize: 18)),
                      onChanged: (value) {
                        searchitemto(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: mHeight / 1.2,
              width: mWidth / 1.1,
              //color: Colors.amber,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1 / 1.2
                      //   mainAxisExtent:
                      ),
                  itemCount: checklist.length ?? 0,
                  itemBuilder: (BuildContext ctx, index) {
                    final search = checklist[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.to(MusicPlayer(
                              //   id: checklist[index].albumId ?? "",
                              //   types: "album",
                              //   songid: "",
                              //   songtitle: "",
                              //   indexx: index,
                              // ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: mHeight / 8,
                                width: mWidth / 3.5,
                                //color: Colors.amber,
                                child: Image.network(
                                  '${checklist[index].cover ?? ''}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            checklist[index].podcastTitle ?? '',
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
