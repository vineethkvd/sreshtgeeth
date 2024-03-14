import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:sreshtgeeth/view/Artist/artistHomepage.dart';
import 'package:sreshtgeeth/view/auth/welcome.dart';
import 'package:sreshtgeeth/view/bottomsheet/bottomsheet.dart';
import 'package:sreshtgeeth/view/music/musicplayer.dart';
import 'package:sreshtgeeth/view/music/testmusic.dart';
import 'common/base_colors.dart';
import 'view/auth/splash.dart';

//AudioPlayer audioPlayer = AudioPlayer();

var episode = [];
String? token;
gettoken() async {
  token = await FirebaseMessaging.instance.getToken();
  print('This is Token: ' + token.toString());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: " +
      message.messageId.toString() +
      message.data.toString() +
      message.notification.toString());
}

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  // WidgetsBinding.instance.addObserver(new _Handler());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

// class _Handler extends WidgetsBindingObserver {
//     @override
//     void didChangeAppLifecycleState(AppLifecycleState state) {
//       if (state == AppLifecycleState.resumed) {
//          audioPlayer.stop(); // Audio player is a custom class with resume and pause static methods
//        } else {
//          audioPlayer.pause();
//        }
//      }
//   }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // print('qwertyuiopqwertyuiopqweryuiop0' + GetStorage().read('artidtid').toString());
    //3steps
    //when app is terminited
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("terminated");
      if (message != null) {
        print("terminited app");
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });
    //when app is forground
    FirebaseMessaging.onMessage.listen((message) {
      print("in forground");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);

        // LocalNotificationServices.creatNotification(message);
      }
    });
    //when app is run background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("in background");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);

        // LocalNotificationServices.creatNotification(message);
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return AlertDialog(
        //         title: Text(message.notification!.title!),
        //         content: SingleChildScrollView(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [Text(message.notification!.body!)],
        //           ),
        //         ),
        //       );
        //     });
      }
    });
    gettoken();
    super.initState();
    initDynamicLinks();
  }

  @override
  void dispose() async {
    //qaudioPlayer.stop();
    // await JustAudioBackground.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // This widget is the root of your application.
  bool check = GetStorage().read('Appuser') ?? false;
  var isUser = GetStorage().read('LocalUserId') ?? false;
  var isArtist = GetStorage().read('artidtid') ?? false;
  var isGotrough = GetStorage().read('GoThrough') ?? false;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  bool status = true;

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      print(jsonEncode(queryParams));

      if (queryParams.isNotEmpty) {
        status = false;
        print(dynamicLinkData.link.path);
        print(queryParams.entries);
        print(9786700);

        String? id = queryParams["id"];
        String? types = queryParams["types"];
        String? songid = queryParams["songid"];
        String? songtitle = queryParams["songtitle"];
        String? indexx = queryParams["indexx"];
        //dynamicLinkData.link.path
        if (mounted) {
          Navigator.pushNamed(context, '/MusicPlayer', arguments: {
            "id": "${id}",
            "types": "${types}",
            "songid": "${songid}",
            "songtitle": "${songtitle}",
            "indexx": "${indexx}"
          });
        }
      } else {
        print(145);
        print(dynamicLinkData.link.path);
        Navigator.pushNamed(
          context,
          dynamicLinkData.link.path,
        );
      }
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
    await Future.delayed(const Duration(microseconds: 500));
    PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (data?.link != null) {
      status = false;
      final Uri uri = data!.link;
      final queryParams = uri.queryParameters;
      print(jsonEncode(queryParams));

      if (queryParams.isNotEmpty) {
        print(data.link.path);
        print(queryParams.entries);
        print(9786700);

        // print(queryParams["productId"]);
        String? id = queryParams["id"];
        String? types = queryParams["types"];
        String? songid = queryParams["songid"];
        String? songtitle = queryParams["songtitle"];
        String? indexx = queryParams["indexx"];

        //dynamicLinkData.link.path
        if (mounted) {
          Navigator.pushNamed(context, '/MusicPlayer', arguments: {
            "id": "${id}",
            "types": "${types}",
            "songid": "${songid}",
            "songtitle": "${songtitle}",
            "indexx": "${indexx}"
          });
        }
      }
      print(queryParams["id"]);
      print(data?.link);
    }

    // final Uri deepLink = data!.link;
  }

  // void initState() {
  //   initDynamicLinks();
  //   super.initState();
  //
  // }

  //   @override
  // void dispose() {
  //   audioPlayer.dispose();
  //   print('tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt');
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
        title: 'Sresht Geeth',
        theme: ThemeData(
          fontFamily: "Poppins",
          backgroundColor: whiteColor,
          scaffoldBackgroundColor: whiteColor,
          // primaryColor: colorCustom,
          // primarySwatch: colorCustom,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        // home: TestMusicPlayer(),
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset(
              "assets/applogo.png",
              width: 230,
              height: 170,
              fit: BoxFit.cover,
            ),
            splashIconSize: 350,
            //nextScreen: ArtistHome(),
            nextScreen: (isArtist != false || isUser != false)
                ? check
                    ? Bottomsheet()
                    : ArtistHome()
                : isGotrough != false
                    ? welcome()
                    : splashscreen(),
            //isArtist !=false?ArtistHome(): splashscreen(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: appColor),
        // home: driverID == 'null' ? SplashView() : ChoosePickup(),
        // home: ,
      ),
    );
  }
}
