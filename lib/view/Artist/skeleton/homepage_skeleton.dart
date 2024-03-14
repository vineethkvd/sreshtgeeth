import 'package:flutter/material.dart';
import 'package:sreshtgeeth/common/text.dart';

import '../../../common/base_colors.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  @override
  Widget build(BuildContext context) {
  size = MediaQuery.of(context).size;
  mHeight = size.height;
  mWidth = size.width;

    return Column(
      children: [
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu,color: bgreyColor,size: 40,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/Notification.png',color:bgreyColor,scale: 4,),
                      )
                ],),
              ),
              ClipRRect(borderRadius: BorderRadius.circular(70),
                                child: Container(
                                  color: bgreyColor,
                                  height: mHeight / 6.5,
                                  width: mWidth / 3.2,),),
                                  Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(color: bgreyColor,child: Txt(text: "                   ",),)
               ),
                Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(color: bgreyColor,child: Txt(text: "                   ",),)
               ),
               Container(
                 height: mHeight/9,
                 width: mWidth/1.15,
                 decoration: BoxDecoration(   color:bgreyColor,
                borderRadius: BorderRadius.circular(10),
                 ),
                 ),
               SizedBox(height: 25,),
                Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container( 
                   height: mHeight/21,
                   width: mWidth/4,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: bgreyColor,border: Border.all(color: bgreyColor)),
                   child: Center(
                    child:
                      Txt(text: '          ',fsize: 16,weight: FontWeight.bold,),
                   ),),
                   SizedBox(width: 25),
                     Container( 
                                      height: mHeight/21,
                                      width: mWidth/4,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: bgreyColor,border: Border.all(color: bgreyColor)),
                                      child: Center(
                                       child:
                      Txt(text: '       ',color: blackColor,fsize: 16,weight: FontWeight.bold,),
                                      ),),
                  ],
                 ),
               ),
                ListView.builder(  physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount: 4,
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
                                      color: bgreyColor,
                                     
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                    Container(
                     // color: Colors.amber,
                      width: mWidth/1.55,
                      height: mHeight/17,
                     // color: bgreyColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(color: bgreyColor,child: Txt(text: '                             ',fsize: 14,weight: FontWeight.w500,)),
                          SizedBox(height: 1,),
                          Container(color: bgreyColor,child: Txt(text: '                  ',fsize: 12,)),
                          SizedBox(height: 1,),
                          Container(color: bgreyColor,child: Txt(text: '                      ',fsize: 12,)),
                        ],
                      ),
                    ),
                  
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
            })

                
               
      ],
    );
  }
}