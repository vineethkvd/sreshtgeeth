import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/settings/Edit%20Profile/editotp.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';

class editNumber extends StatefulWidget {
  const editNumber({super.key});

  @override
  State<editNumber> createState() => _editNumberState();
}

class _editNumberState extends State<editNumber> {
  @override
  Widget build(BuildContext context) {
    final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(body: Column(children: [
        Row(
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () => Get.back(),
                  ),
              ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Txt(text: 'Continue with mobile number',fsize: 18,weight: FontWeight.w500,),
                    ),     
          ],
        ),
           Padding(
             padding: const EdgeInsets.only(top: 30,bottom: 10),
             child: Row(
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
                            prefix: Text('+91  '),
                          ),
                        ),
                      ),
                      ]),
           ),   
             Padding(
                      padding: const EdgeInsets.only(left: 25,),
                      child: Row(
                        children: [
                          Txt(text: 'We will send you 6 digit code on the given mobile number', fsize: 10,
                          ),
                        ],
                      ),
                    ),
                      InkWell(
            onTap: (){
                      if(acon.mobileCon.text.isEmpty || acon.mobileCon.text.length < 10){                        
                            Fluttertoast.showToast(msg: "Please Valid Mobile Number");}
                            else{         
                               Get.to(() => editOTP()); 

                               acon.mobileCon.clear();
                              //  var DoctorID = GetStorage().read('driverId').toString();           
                              //  print('aaaaa'+DoctorID);       ;
                               }
            
            },
             child: Padding(
               padding: const EdgeInsets.only(top: 40),
               child: Container(
                                  height: mHeight/16,
                                  width: mWidth/2,
                                  decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(8)),
                                  child: Center(child: Txt(text: 'Update',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                  
                                ),
             ),
           ),
    ],)),);
  }
}