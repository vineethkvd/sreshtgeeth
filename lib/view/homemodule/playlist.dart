import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/auth/marque_text.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../music/musicplayer.dart';
import 'controller/homedetail_controller.dart';

class playlist extends StatefulWidget {
  const playlist({super.key});

  @override
  State<playlist> createState() => _playlistState();
}
HomeDetailCon homedetailcon = Get.put(HomeDetailCon());
class _playlistState extends State<playlist> {

  @override
  void initState() {
    call();
    super.initState();
    
  }
  List checklist1 = homedetailcon.playlistdata?.playList ?? [];
  void searchitemto(String query) {
    final suggestions = homedetailcon.playlistdata!.playList.where((s) {
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

  call()async{
    await homedetailcon.playlistapi();
    checklist1= homedetailcon.playlistdata?.playList ?? [];
    setState(() {
      
    });
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
                      child: Txt(text: "My Playlist",fsize: 18,weight: FontWeight.w500,),
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
                            hintText: 'Search ',
                            hintStyle:
                            TextStyle(color: darkGreyColor, fontSize: 18)),
                        onChanged: (value) {
                          searchitemto(value);
                        },
                      ),
                    ),
                    
                  ],
                 ),),
                 SizedBox(height: 40,),
            Container(height: mHeight/1.2,
          width: mWidth/1.1,
          //color: Colors.amber,
          child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               childAspectRatio: 1/1.2
            //   mainAxisExtent: 
                ),
            itemCount:  checklist1.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              final search = checklist1[index];
              return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(
                                  MusicPlayer(
                                    id:"",
                                    types: "song",
                                    songid: checklist1[index].songId,
                                    songtitle: checklist1[index].songTitle,
                                    indexx: index,
                                  ),
                                  transition: Transition.upToDown);
                            }
                            ,child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: mHeight / 9,
                                width: mWidth / 4,
                                //color: Colors.amber,
                                child: Image.network(
                                  '${checklist1[index].cover ?? ''}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,width: 100
                              ,child: Marquetext(mtext: checklist1[index].songTitle ?? ''))
                       
                        ],
                      ),
                    );
            }),),
        ],) 
        ),
    ),);
  }
}
