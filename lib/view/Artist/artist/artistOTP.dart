import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';
import '../controller/otp_controller.dart';
import 'artistRegister.dart';

class ArtistOTP extends StatefulWidget {
  final otp;
  const ArtistOTP({this.otp,super.key});

  @override
  State<ArtistOTP> createState() => _ArtistOTPState();
}

class _ArtistOTPState extends State<ArtistOTP> {
  @override
  Widget build(BuildContext context) {
    final OtpCon otpcon = Get.put(OtpCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold( 
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                  onPressed: () => Get.back(),
                  ),
                ],),
            ),
              Image.asset('assets/otp.png',height: mHeight/3,),
               Padding(
                 padding: const EdgeInsets.all(23.0),
                 child: Row(
                  children: [
                  Txt(text:'Enter Your Code',fsize: 18,weight: FontWeight.w500,)
                           ],),
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                        width: mWidth / 1.2,
                        //color: greyColor,
                        child: Pinput(
                        controller: otpcon.otp,
                        length: 6,
                        toolbarEnabled: false,
                        inputFormatters: [],
                       )
                      ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Txt(text: 'We Have sent OTP to Your Mobile', 
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 10),
                          child: InkWell(
                            onTap: (){
                              //Get.to(() => Login());
                            if(otpcon.otp.text.isEmpty || otpcon.otp.text.length < 6){                        
                            Fluttertoast.showToast(msg: "Please Valid OTP");
                            } else if(otpcon.otp.text != widget.otp.toString()){
                              Fluttertoast.showToast(msg: "Please Valid OTP");
                            }else{         
                              Get.to(() => ArtistRegister()); 
                              otpcon.otp.clear();
                              //  var DoctorID = GetStorage().read('driverId').toString();           
                              //  print('aaaaa'+DoctorID);       
                               }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/2,
                              decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                              
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/resend.png',height: mHeight/38,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Txt(text: 'Resend SMS',),
                              )
                          ],),
                        ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/editphone.png',height: mHeight/38,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Txt(text: 'Edit Phone Number',),
                                )
                                ],),
                            ),
                          )
              ]),
        ),));
  }
}