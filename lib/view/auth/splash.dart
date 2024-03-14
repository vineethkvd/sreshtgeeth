import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/controller/auth.dart';
import 'package:sreshtgeeth/view/auth/splash1.dart';

import '../../common/base_colors.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  AuthCon acon = Get.put(AuthCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }

  call() async {
    await acon.splash1();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return Container( decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/splash1.png",
                ),
                fit: BoxFit.cover)),
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Txt(text: acon.splashdata?.splashList[0].heading ?? '',color: whiteColor,fsize: 24,weight: FontWeight.bold,)],),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
                              children: [Text(acon.splashdata?.splashList[0].content ?? '',style: TextStyle(color: whiteColor,),textAlign: TextAlign.justify,)]),
                          ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: InkWell(
                          onTap: (){
                            Get.to(() => splashscreen2());
                          },
                          child: Container(
                            height: mHeight/16,
                            width: mWidth/1.1,
                            decoration: BoxDecoration(  color: whiteColor,borderRadius: BorderRadius.circular(8)),
                            child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,)),
                            
                          ),
                        ),
                      )]),
                    ),
                ));
  }
}