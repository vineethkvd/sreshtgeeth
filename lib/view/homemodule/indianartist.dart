import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text3.dart';
import 'package:sreshtgeeth/view/auth/marque_text.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../music/musicplayer.dart';
import 'controller/homedetail_controller.dart';

class indianArtist extends StatefulWidget {
  const indianArtist({super.key});

  @override
  State<indianArtist> createState() => _indianArtistState();
}
HomeDetailCon homedetailcon = Get.put(HomeDetailCon());
class _indianArtistState extends State<indianArtist> {

  @override
  void initState() {
    call();
    super.initState();
    
  }

  List checklist1 =  homedetailcon.indianartistdata?.indianArtist ?? [];
  void searchitemto(String query) {
    final suggestions = homedetailcon.indianartistdata!.indianArtist.where((s) {
      final partname = s.rjArtistName.toString().toLowerCase();
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
    await homedetailcon.indianartistapi();
    checklist1=homedetailcon.indianartistdata?.indianArtist ?? [];
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
                      child: Txt(text: "Top Indian Artist",fsize: 18,weight: FontWeight.w500,),
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
                    //Txt(text: 'Search music and podcasts',color: darkGreyColor,fsize: 14,),
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
                  ],
                 ),),
                 SizedBox(height: 20,),
            Container(height: mHeight/1.2,
          width: mWidth/1.1,
          //color: Colors.amber,
          child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               childAspectRatio: 1/1.2
            //   mainAxisExtent: 
                ),
            itemCount: checklist1.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              final search = checklist1[index];
              return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              // Get.to(MusicPlayer(
                              //   id: homedetailcon.indianartistdata?.indianArtist?[index].rjArtistId,
                              //   types: "song",
                              //   songid: homedetailcon.indianartistdata?.indianArtist?[index].rjArtistName,
                              //   songtitle: homedetailcon.indianartistdata?.indianArtist?[index].cover,
                              //   indexx: index,
                              // ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: mHeight / 8.9,
                                width: mWidth / 3.5,
                                //color: Colors.amber,
                                child: Image.network(
                                  '${checklist1[index].cover ?? ''}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Txt3(
                                text: checklist1[index].rjArtistName ?? '',
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
