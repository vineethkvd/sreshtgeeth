import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text.dart';

import '../../common/base_colors.dart';
import '../../controller/auth.dart';
import 'otp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     final AuthCon acon = Get.put(AuthCon());
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
              Image.asset('assets/login1.png',height: mHeight/4.3,),
               Padding(
                 padding: const EdgeInsets.all(23.0),
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
                           // border: OutlineInputBorder(),
                            filled: true, 
                            fillColor: greyColor,
                            hintText: 'Continue with mobile number',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Txt(text:  '  +91 ',fsize: 16,),
                            ),
                          ),
                        ),
                      ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: Row(
                          children: [
                            Txt(text: 'We will send you 6 digit code on the given mobile number', fsize: 10,
                            ),
                          ],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 40),
                          child: InkWell(
                            onTap: (){
                             
                                 if(acon.mobileCon.text.isEmpty || acon.mobileCon.text.length < 10){                        
                              Fluttertoast.showToast(msg: "Please Valid Mobile Number");}
                              else{         
                                 Get.to(() => OTP()); 
        
                                 acon.mobileCon.clear();
                                //  var DoctorID = GetStorage().read('driverId').toString();           
                                //  print('aaaaa'+DoctorID);       ;
                                 }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/1.2,
                              decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Get OTP',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                              
                            ),
                          ),
                        ),
              ]),
        ),));
  }
}