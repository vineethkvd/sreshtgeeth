import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/common/base_colors.dart';
import 'package:sreshtgeeth/view/auth/splash.dart';
import 'package:sreshtgeeth/view/bottomsheet/bottomsheet.dart';

import 'view/Artist/artistHomepage.dart';

class LoadingCheck extends StatefulWidget {
  const LoadingCheck({super.key});

  @override
  State<LoadingCheck> createState() => _LoadingCheckState();
}

class _LoadingCheckState extends State<LoadingCheck> {
  
  bool check = GetStorage().read('Appuser') ?? false;
  var isUser = GetStorage().read('LocalUserId') ?? false;
  var isArtist = GetStorage().read('artidtid') ?? false;
  @override
  void initState() {
    // TODO: implement initState
    print('object' + check.toString());
    //call();
    super.initState();
  }

  call()async{
    await Get.to( splashscreen());
    // GetStorage().read('artidtid') && GetStorage().read('LocalUserId') == null ? Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => const splashscreen()),) : check ? Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => Bottomsheet()),) : Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => ArtistHome()),) ;
    setState(() {
      
    });
    
    // check == null?   Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => const splashscreen()),) :check == false?GetStorage().read('artidtid') == null ? MaterialPageRoute(builder: (context) => const splashscreen())
    //           :MaterialPageRoute(builder: (context) => const  ArtistHome()) :check == true?GetStorage().read('LocalUserId') == null? MaterialPageRoute(builder: (context) => const splashscreen()) :MaterialPageRoute(builder: (context) => Bottomsheet()): MaterialPageRoute(builder: (context) => const splashscreen()) ;
              
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body:AnimatedSplashScreen(
              duration: 2000,
              splash: Image.asset(
                "assets/applogo.png",
                width: 230,
                height: 170,
                fit: BoxFit.cover,
              ),
              splashIconSize: 350,
              //nextScreen: ArtistHome(),
              nextScreen: splashscreen(),
              //check == false ? isArtist == false ? splashscreen() : ArtistHome() : splashscreen()|| check == true ? isUser == false ? splashscreen() :Bottomsheet() : splashscreen(),
               //isArtist == false ? isUser!=false?Bottomsheet():splashscreen() : ArtistHome(),
              //isArtist !=false?ArtistHome(): splashscreen(),
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: appColor),
    );
  }
}