import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/Txt2.dart';
import 'package:sreshtgeeth/common/text3.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../auth/marque_text.dart';
import '../music/controller/music_controller.dart';
import 'controller/homedetail_controller.dart';

class popular extends StatefulWidget {
  const popular({super.key});

  @override
  State<popular> createState() => _popularState();
}
HomeDetailCon homedetailcon = Get.put(HomeDetailCon());
class _popularState extends State<popular> {

  MusicCon musiccon = Get.put(MusicCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }



  call()async{
    await homedetailcon.popularapi();
    checklist1 = homedetailcon.populardata?.popularSong ?? [];
    setState(() {
      
    });
  }

  List checklist1 = homedetailcon.populardata?.popularSong ?? [];
  void searchitemto(String query) {
    final suggestions = homedetailcon.populardata!.popularSong.where((s) {
      final partname = s.songTitle.toString().toLowerCase();
      final input = query.toLowerCase();
      return partname.contains(input);
      //  if(partname.contains(input))
      //  {
      //   return true;
      //  }
      //  return false;
    }).toList();
    setState(() => checklist1 = suggestions);
    print('as' + checklist1.toString());
    print('aaaaaaaaaaaaaaaaaaaaaaaaa' + query);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
            Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
                  ),
              ),
                    const Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Txt(text: "Popular Song",fsize: 18,weight: FontWeight.w500,),
                    ),     
          ],
        ),
         Container( 
                 height: mHeight/16,
                 width: mWidth/1.1,
                 decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(20)),
                 child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/Search.png',scale: 3,),
                    ),
                    Container(
                      height: mHeight / 1,
                      width: mWidth / 1.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search music and podcasts',
                            hintStyle:
                            TextStyle(color: darkGreyColor, fontSize: 18)),
                        onChanged: (value) {
                          searchitemto(value);
                        },
                      ),
                    ),
                    //Txt(text: 'Search music and podcasts',color: darkGreyColor,fsize: 14,),
                  ],
                 ),),
                 SizedBox(height: 20,),
            Container(
              height: mHeight/1.2,
              width: mWidth/1.1,
              child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.2
                  ),
            itemCount: checklist1.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              final search = checklist1[index];
              return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Get.to(MusicPlayer(
                              id:  checklist1[index].ablumId,
                              types: "song",
                              songid:  checklist1[index].songId??"",
                              songtitle:  checklist1[index].songTitle??"",
                              indexx: index,
                            ));},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: mHeight / 8.9,
                                width: mWidth / 3.5,
                                //color: Colors.amber,
                                child: Image.network(
                                  '${ checklist1[index].cover ?? ''}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Txt3(
                                text:  checklist1[index].songTitle ?? '',
                              ),
                            ),
                          )
                        ],
                      ),
                    );
            }),),
        ],) 
        ),
    ),);
  }
}
