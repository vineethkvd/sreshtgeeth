import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sreshtgeeth/view/Artist/artist/atristMobile.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';
import '../artistHomepage.dart';
import '../controller/login_controller.dart';

class artistLogin extends StatefulWidget {
  const artistLogin({super.key});

  @override
  State<artistLogin> createState() => _artistLoginState();
}

class _artistLoginState extends State<artistLogin> {
  @override
  Widget build(BuildContext context) {
    final LoginCon logincon = Get.put(LoginCon());
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold( 
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(text: 'Login',fsize: 18,weight: FontWeight.bold,),
          leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
               SizedBox(height: 20,),
              Image.asset('assets/login1.png',height: mHeight/4.3,),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                        width: mWidth / 1.15,
                        //color: greyColor,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          controller: logincon.mobileCon,
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
                            prefixIcon:  Padding(
                              padding: const EdgeInsets.only(top:13),
                              child: Txt(text:  '  +91 ',fsize: 16,),
                            ),
                          ),
                        ),
                      ),
                      ]),
                      SizedBox(height: 20,),
                      Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                        width: mWidth / 1.15,
                        //color: greyColor,
                        child: TextField(
                          keyboardType: TextInputType.text,
                         
                          controller: logincon.passwordCon,
                          decoration: InputDecoration(
                            //  enabledBorder: OutlineInputBorder(
                            //  borderSide: BorderSide(
                            //  width: 3, color: Colors.transparent), //<-- SEE HERE
                            // ),
                            border: InputBorder.none,
                           // border: OutlineInputBorder(),
                            filled: true, 
                            fillColor: greyColor,
                            hintText: 'Enter your password',
                            prefixIcon:  Icon(Icons.lock_outline_rounded)
                            //Image.asset('assets/password.png',)
                          ),
                        ),
                      ),
                      ]),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 40),
                          child: InkWell(
                            onTap: (){
                             
                                 if(logincon.mobileCon.text.isEmpty || logincon.mobileCon.text.length < 10){                        
                              Fluttertoast.showToast(msg: "Please Valid Mobile Number");}
                              else if(logincon.passwordCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Password");}
                              else {         
                                 logincon.loginapi();
                                 logincon.mobileCon.clear();
                                 logincon.passwordCon.clear();
                                 
                                //  var DoctorID = GetStorage().read('driverId').toString();           
                                //  print('aaaaa'+DoctorID);       ;
                                 }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/1.2,
                              decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Login',fsize: 20,weight: FontWeight.bold,color: whiteColor,)),
                            ),
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 5),
                          child: InkWell(
                            onTap: (){
                             Get.to(() => artistMobile());
                                     
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/1.2,
                              decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Register Now',fsize: 20,weight: FontWeight.bold,color: whiteColor,)),
                            ),
                          ),
                        ),
              ]),
        ),));
  }
}