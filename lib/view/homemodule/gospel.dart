import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text3.dart';
import 'package:sreshtgeeth/view/auth/marque_text.dart';
import 'package:sreshtgeeth/view/bottomsheet/controller/home_controller.dart';
import 'package:sreshtgeeth/view/music/song_selection.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'controller/homedetail_controller.dart';

class gospel extends StatefulWidget {
  const gospel({super.key});

  @override
  State<gospel> createState() => _gospelState();
}

class _gospelState extends State<gospel> {
  HomeDetailCon homedetailcon = Get.put(HomeDetailCon());
  call()async{
    await homedetailcon.gospelapi();
    setState(() {
      
    });
  }
  @override
  void initState() {
    call();
    super.initState();

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
                      child: Txt(text: "Gospel Singer",fsize: 18,weight: FontWeight.w500,),
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
                    Txt(text: 'Search music and podcasts',color: darkGreyColor,fsize: 14,),

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
            itemCount: homedetailcon.gospeldata?.gosper.length ?? 0,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(() => SongleSelection(
                                id:homedetailcon.gospeldata?.gosper?[index].rjArtistId??"" ,
                              ));
                            }
                            ,child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: mHeight / 8.9,
                                width: mWidth / 3.5,
                                //color: Colors.amber,
                                child: Image.network(
                                  homedetailcon.gospeldata?.gosper[index].cover??"",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Txt3(
                                text: homedetailcon.gospeldata?.gosper[index].rjArtistName ?? '',
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
