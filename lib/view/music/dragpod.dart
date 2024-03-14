import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/auth.dart';

class draggablePod extends StatefulWidget {
  const draggablePod({super.key});

  @override
  State<draggablePod> createState() => _draggablePodState();
}

class _draggablePodState extends State<draggablePod> {
   
  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return  SingleChildScrollView(
      //physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: whiteColor,),
        child: Column(
          children: [
             Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: 10,width: 120,
                    decoration: BoxDecoration(color: blackColor,borderRadius: BorderRadius.circular(10)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Txt(
                          text: 'Other Station',
                          fsize: 22,
                          weight: FontWeight.bold,
                        ),
                       
                      ],
                    ),
                  ),
            GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       childAspectRatio: 1/1
                    //   mainAxisExtent: 
                        ),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      // Get.to(() => Livepod());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: mHeight / 6,
                                        width: mWidth / 3.1,
                                        //color: Colors.amber,
                                        child: Image.asset(
                                          'assets/livepod.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Center(
                                      child: Txt(
                                        text: 'Live Podcast',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                    }),
          ],
        ),
      ),
    );
  }
}