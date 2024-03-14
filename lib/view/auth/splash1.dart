import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/view/auth/welcome.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/auth.dart';

class splashscreen2 extends StatefulWidget {
  const splashscreen2({super.key});

  @override
  State<splashscreen2> createState() => _splashscreen2State();
}

class _splashscreen2State extends State<splashscreen2> {
  bool gothrough = false;
  AuthCon acon = Get.put(AuthCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }

  call() async {
    await acon.splash2();
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
                  "assets/splash2.png",
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
                            Get.offAll(()=> welcome());
                            gothrough = true;
                            GetStorage().write('GoThrough', gothrough);
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