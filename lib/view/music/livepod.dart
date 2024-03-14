import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import 'dragpod.dart';

class Livepod extends StatefulWidget {
  const Livepod({super.key});

  @override
  State<Livepod> createState() => _LivepodState();
}

class _LivepodState extends State<Livepod> {
  @override
  Widget build(BuildContext context) {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

       return SafeArea(child: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/livepod.png",
                ),
                fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.75),
        body: Stack(
          children:[ 
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                      icon: Icon(
                  Icons.arrow_back,size: 30,
                  color: whiteColor,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  Txt(text: 'Livepod',color: whiteColor,fsize: 18,),
                    Image.asset('assets/podcastshare.png',height: 25,)
                    ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 20),
                child: CircleAvatar(backgroundImage: AssetImage('assets/livepod.png'),radius: 170,),
              ),
            
            
               Padding(
                 padding: const EdgeInsets.only(left: 8,right: 8,top: 30),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Image.asset('assets/Heart.png',scale: 2.5,),
                     Image.asset('assets/playmusic.png',scale: 2.8,),
                     Image.asset('assets/download.png',scale: 2.5,),
                   ],
                 ),
               ),
               SizedBox(height: 30),
               Image.asset('assets/frequency.png',scale: 4,),
               
            ],),
             Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.10,
              minChildSize: 0.10,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: draggablePod(),
                );
              },
            ),
          ),
        ])),
    ),);
  }
}