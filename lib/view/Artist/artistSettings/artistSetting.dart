import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/view/Artist/controller/setting_controller.dart';
import 'package:sreshtgeeth/view/auth/welcome.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../auth/splash.dart';
import 'artistAboutus.dart';
import 'artistEditProfile/artistEditing.dart';
import 'artistPrivacy.dart';
import 'artistSupport.dart';
import 'artistTerm.dart';

class artistsetting extends StatefulWidget {
  const artistsetting({super.key});

  @override
  State<artistsetting> createState() => _artistsettingState();
}

class _artistsettingState extends State<artistsetting> {
  SettingCon settingcon = Get.put(SettingCon());
  @override
  void initState() {
    call();
    super.initState();
    
  }

  call()async{
   await settingcon.settingapi();
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: 
    Scaffold(
      backgroundColor: greyColor,
       appBar: AppBar(
          backgroundColor: greyColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(text: 'Settings',fsize: 18,weight: FontWeight.bold,),
          leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),),
      body: Column(children: [
        
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Txt(text: 'Referral Bonus',fsize: 20,weight: FontWeight.w500,),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                Container(
                decoration: BoxDecoration(color:whiteColor,borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Txt(text: '${settingcon.settingdata?.totalSubsciption ?? ''}',fsize: 20,weight: FontWeight.w500,),
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Txt(text: 'People',fsize: 16,weight: FontWeight.w400,),
                    Txt(text: 'Subscribed',fsize: 16,weight: FontWeight.w400,),
                  ],
                ),
              )
              ],
            ),
             Column(
              children: [
                Container(
                decoration: BoxDecoration(color:whiteColor,borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Txt(text: '${settingcon.settingdata?.totalEarning ?? ''}',fsize: 20,weight: FontWeight.w500,),
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Txt(text: 'Promo',fsize: 16,weight: FontWeight.w400,),
                    Txt(text: 'Earnings',fsize: 16,weight: FontWeight.w400,),
                  ],
                ),
              )
              ],
            )
          ]),
        ),
        Container(
          height: mHeight/9,
          width: mWidth,
          color: whiteColor,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/man.png',scale: 3.5,),
            ),
            SizedBox(
              //color: Colors.amber,
              width: mWidth/1.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Txt(text: '${settingcon.settingdata?.data[0].artistName ?? ''}',fsize: 20,),
                Txt(text: 'View Profile',fsize: 13,),
              ],),
            ),
            IconButton(onPressed: (){
              Get.to(() => const artistname());
            }, icon: const Icon(Icons.arrow_forward_ios))

          ]),),
          const SizedBox(height: 30,),
          Container(
            // height: mHeight/2.9,
          width: mWidth,
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/about.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'About Us',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                       Get.to(() => const artistAboutUs());
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  )]),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/support.png',
                                        height: 25,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Txt(
                                        text: 'Support',
                                        fsize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                               InkWell(
                    onTap: (){
                       Get.to(() => const artistsupport());
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  )]),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          InkWell(
              onTap: () {
                Get.to(() => const artistprivacy());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/privacy.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Privacy Policy',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          InkWell(
              onTap: () {
                Get.to(() => const artistTerms());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/terms.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Terms & Conditions',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
                          InkWell(
              onTap: () {
                 showDialog(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, setState) {
                        return AlertDialog(
                          title: Container(
                            // width: 130,
                            decoration: const BoxDecoration(
                                // border: Border(
                                //   bottom: BorderSide(
                                //     //                    <--- top side
                                //     color: greenn,
                                //     width: 1.2,
                                //   ),
                                // ),
                                ),
                            child: Column(
                              children: const [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Are you sure,",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "you want to logout ?",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                           
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: blackColor,
                                  ),
                                  child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                     backgroundColor: RedColor, foregroundColor: whiteColor),
                                    //color: Color.fromARGB(255, 2, 228, 119),
                                    child: const Txt(
                                      text: 'Cancel',
                                      color: whiteColor,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: blackColor,
                                  ),
                                  child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: RedColor, foregroundColor: whiteColor),
                                    child: const Txt(                                   
                                      text: 'Logout',
                                      color: whiteColor,
                                    ),
                                    onPressed: () async {
                                      GetStorage().remove('artidtid');
                                      Get.offAll(()=> welcome());
                                  
                                      // SharedPreferences pref =
                                      //     await SharedPreferences.getInstance();
                                      // pref.clear();
                                      // Navigator.of(context)
                                      //     .pushAndRemoveUntil(
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 Login()),
                                      //         (Route<dynamic> route) =>
                                      //             false);
                                    },
                                  ),
                                  
                                ),
                               
                              ],
                            ),
                             const SizedBox(height: 20,)
                          ],
                        );
                      })
                      );
                //Get.to(() => contactUs());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/logout.png',
                            height: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Txt(
                            text: 'Logout',
                            fsize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      )
                    ],
                  )]),
            ),
            
            ]
                ),
          ))]),));
  }
}