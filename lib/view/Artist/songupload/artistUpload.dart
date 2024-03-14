import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/Artist/songupload/addAlbum.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../controller/home_controller.dart';
import 'uploadSongs.dart';

class ArtistUpload extends StatefulWidget {
  const ArtistUpload({super.key});

  @override
  State<ArtistUpload> createState() => _ArtistUploadState();
}

class _ArtistUploadState extends State<ArtistUpload> {
  HomeCon homecon = Get.put(HomeCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }
  call()async{
    await homecon.homesongapi();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child:Scaffold(
        persistentFooterButtons: [
Row(
  children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.off(() => addAlbum());
                },
                child: Container(
                                      height: mHeight/16,
                                      width: mWidth/2.3,
                                      decoration: BoxDecoration(  color: pinkColor,borderRadius: BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add,color: whiteColor,),
                                          SizedBox(width: 7,),
                                          Txt(text: 'Add Album',fsize: 18,weight: FontWeight.bold,color: whiteColor,),
                                        ],
                                      ),
                                      
                                    ),
              ),
            ),
      
        InkWell(
    
      onTap: () {
    
        Get.off(() => UploadSongsArtist());
    
      },
    
      child: Container(
    
                            height: mHeight/16,
    
                            width: mWidth/2.3,
    
                            decoration: BoxDecoration(  color: pinkColor,borderRadius: BorderRadius.circular(8)),
    
                            child: Row(
    
                              mainAxisAlignment: MainAxisAlignment.center,
    
                              children: [
    
                                Image.asset('assets/upload.png',scale: 4,),
    
                                SizedBox(width: 7,),
    
                                Txt(text: 'Upload Songs',fsize: 18,weight: FontWeight.bold,color: whiteColor,),
    
                              ],
    
                            ),
    
                            
    
                          ),
    
    ),
         
  ],
),
            
        ],
         appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(text: 'Upload Songs',fsize: 18,weight: FontWeight.bold,),
          leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),),
        body: SingleChildScrollView(
          child: Column(
            children: [
             
        SizedBox(height: 5,),
         ListView.builder(  physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount: homecon.homesongdata?.songList.length ?? 0,
           itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                           Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: mHeight / 16,
                                      width: mWidth / 8.5,
                                      //color: Colors.amber,
                                      child: Image.network(
                                        '${homecon.homesongdata?.songList[index].cover ?? ''}',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Txt(text: '${homecon.homesongdata?.songList[index].rjSongTitle ?? ''}',fsize: 14,weight: FontWeight.w500,),
                          Txt(text: '${homecon.homesongdata?.songList[index].addDate ?? ''}',fsize: 12,),
                          Txt(text: '${homecon.homesongdata?.songList[index].status ?? ''}',fsize: 12,),
                        ],
                      ),
                    ),
                   Column(children: [
                    Column(children: [
                    //Txt(text: 'Eligible Play Minutes',),
                    Txt(text: '${homecon.homesongdata?.songList[index].playtime ?? ''}',),
                   ],)
                   ],)
                  ],),
                ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
              ],
            );
            }),
            
            
            ],
          )
          ),
      ) ,
      );
  }
}