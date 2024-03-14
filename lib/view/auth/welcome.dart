import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/Artist/artist/artistLogin.dart';
import 'package:sreshtgeeth/view/auth/register.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              onTap: (){
                Get.to(() => artistLogin());
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Gosper",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_circle_right),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
              ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Image.asset(
                               "assets/logo.png",
                               //width: 230,
                               height: 220,
                               //scale: 1,
                               fit: BoxFit.cover,
                             ),
               ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Txt(text: 'BE ONE OF US!',color: blackColor,fsize: 25,weight: FontWeight.w500,)],),
              ),
                             Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Txt(text:'Continue with mobile number',fsize: 18,weight: FontWeight.w500,)
                 ],),
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
              width: mWidth / 1.15,
              //color: greyColor,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                controller: acon.mobileCon,
                decoration: InputDecoration(
                  //  enabledBorder: OutlineInputBorder(
                  //  borderSide: BorderSide(
                  //  width: 3, color: Colors.transparent), //<-- SEE HERE
                  // ),
                  border: InputBorder.none,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5)
                  // ),
                  filled: true, 
                  //fillColor: Colors.white.withOpacity(0.7),
                  fillColor: Colors.grey[300],
                  hintText: 'Continue with mobile number',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Txt(text:  '  +91 ',fsize: 16,),
                  ),
                ),
              ),
            ),
            ]),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 50,),
              child: Row(
                children: [
                  Txt(text: 'We will send you 6 digit code on the given mobile number', fsize: 10,color: blackColor,
                  ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20,top: 20),
                child: InkWell(
                  onTap: (){
                   
                       if(acon.mobileCon.text.isEmpty || acon.mobileCon.text.length < 10 ){                        
                    Fluttertoast.showToast(msg: "Please Valid Mobile Number");}
                    else{         
                      acon.loginapi();
                       //acon.mobileCon.clear();
                      //  var DoctorID = GetStorage().read('driverId').toString();           
                      //  print('aaaaa'+DoctorID);       ;
                       }
                  },
                  child: Container(
                    height: mHeight/16,
                    width: mWidth/2,
                    decoration: BoxDecoration(  color: appColor,borderRadius: BorderRadius.circular(30)),
                    child: Center(child: Txt(text: 'Get OTP',fsize: 18,weight: FontWeight.bold,color: whiteColor,)),
                    
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Txt(
              //     text: 'Sign In With',
              //     color: whiteColor,
              //     fsize: 20,
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Container(
              //         height: 55,
              //         width: 55,
              //         decoration: BoxDecoration(color: Colors.white,
              //         borderRadius: BorderRadius.circular(30)),
              //         child: Image.asset('assets/facebook.png',color: appColor,scale: 14,)),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child:  Container(
              //         height: 55,
              //         width: 55,
              //         decoration: BoxDecoration(color: Colors.white,
              //         borderRadius: BorderRadius.circular(30)),
              //         child: Image.asset('assets/google.png',color: appColor,scale: 15,)),
              //     ),
              //   ],
              // ),


            //     Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: InkWell(
            //     onTap: (){
            //       Get.to(() => Login());
            //     },
            //     child: Container(
            //       height: mHeight/16,
            //       width: mWidth/1.1,
            //       decoration: BoxDecoration(  color: whiteColor,borderRadius: BorderRadius.circular(8)),
            //       child: Center(child: Txt(text: 'Login',fsize: 16,weight: FontWeight.bold,)),
                  
            //     ),
            //   ),
            // ),
            ]),
        ),
        ),
    );
  }
}