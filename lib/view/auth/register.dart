import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/auth/selectlanguage.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../../controller/auth.dart';


final AuthCon acon = Get.put(AuthCon());
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

bool _isChecked = false;
String? gender;
  bool _value = false;
  int val = -1;
  bool _isObscure = true;
  bool _isObscure1 = true;
  
class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _cnt1;
  late SingleValueDropDownController _cnt2;
  late SingleValueDropDownController _cnt3;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    acon.stateList.clear();
    acon.cityList.clear();
    call();
    _cnt = SingleValueDropDownController();
    _cnt1 = SingleValueDropDownController();
    _cnt2 = SingleValueDropDownController();
    _cnt3 = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cnt1.dispose();
    _cnt2.dispose();
    _cnt3.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  call() async {
    await acon.getstate();
    
     if(this.mounted){
       setState(() {
      
    });
     }
   
  }

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/register.png',height: mHeight/3,),
               Padding(
                 padding: const EdgeInsets.all(23.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Txt(text:'Register',fsize: 18,weight: FontWeight.w500,)
                           ],),
               ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset('assets/username.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),],
                        keyboardType: TextInputType.text,
                        controller: acon.userNameCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'User Name',
                          
                          
                        ),
                      ),
                    ),
              
              ]),
                 SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image.asset('assets/email.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                      
                        controller: acon.emailCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Email ID',
                          
                        ),
                      ),
                    ),
              
              ]),
                 SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
              //          Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(bottom: 2),
              //       child: Image.asset('assets/mobilenumber.png',scale: 3,),
              //     ),
              //     SizedBox(width: 15,),
              //      Container(
              //         width: mWidth / 1.3,
              //         //color: greyColor,
              //         child: TextField(
              //           keyboardType: TextInputType.emailAddress,
              //          inputFormatters: <TextInputFormatter>[
              //         FilteringTextInputFormatter.digitsOnly
              //       ],  
              //           controller: acon.mobileCon,
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //            // border: OutlineInputBorder(),
              //           // prefixIcon:
              //             // filled: true, 
              //             // fillColor: greyColor,
              //             hintText: 'Mobile Number',
                          
              //           ),
              //         ),
              //       ),
              
              // ]),
              //                  SizedBox(
              //           height: mHeight / 57,
              //           width: mWidth / 1.14,
              //           child: Divider(thickness: 1, color: blackColor),
              //         ),

                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Image.asset('assets/gender.png',scale: 3,),
                                         ),
                                         Container(
                            width: 110,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Txt(text: "Male"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 0,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value!;
                                  });
                                },
                                activeColor: appColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Txt(text: "Female"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 1,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value!;
                                  });
                                },
                                activeColor: appColor,
                              ),
                            ),
                          ),]),
                       ),
                               Form(
                    key: _formKey,
                    child: Column(
                      children: [
                                        Container(
                                          height: mHeight/15,
                                          width: mWidth/1.135,
                                          child: DropDownTextField(
                                                          // initialValue: "name4",
                                                          controller: _cnt,
                                                          clearOption: true,

                                                          // enableSearch: true,
                                                          // dropdownColor: Colors.green,
                                                          textFieldDecoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: 'State'
                                                          ),
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Required field";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          dropDownItemCount: 6,  
                                                          dropDownList: acon.stateList,
                                                          onChanged: (val) async {
                                                            acon.districtList.clear();
                                                            await acon.getDistrict(_cnt.dropDownValue?.value ?? '');
                                                             setState(() {
                                                               
                                                             });
                                                          },
                                                        ),
                                        ),
                                        SizedBox(
                        height: mHeight / 60,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                        Container(
                                          height: mHeight/16,
                                          width: mWidth/1.135,
                                          child: DropDownTextField(
                                                          // initialValue: "name4",
                                                          controller: _cnt2,
                                                          clearOption: true,
                                                          textFieldDecoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: 'District'
                                                          ),
                                                          // enableSearch: true,
                                                          // dropdownColor: Colors.green,
                                                          
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Required field";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          dropDownItemCount: 6,
                                                          dropDownList: acon.districtList,
                                                          onChanged: (val) async {
                                                            acon.cityList.clear();
                                                            await acon.getCity(_cnt2.dropDownValue?.value ?? '');
                                                            
                                                             setState(() {
                                                               
                                                             });
                                                          },
                                                        ),
                                        ),
                                        SizedBox(
                        height: mHeight / 60,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                                          Container(
                                          height: mHeight/15,
                                          width: mWidth/1.135,
                                          child: DropDownTextField(
                                                          // initialValue: "name4",
                                                          controller: _cnt1,
                                                          clearOption: true,
                                                          textFieldDecoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: 'City'
                                                          ),
                                                          // enableSearch: true,
                                                          // dropdownColor: Colors.green,
                                                          
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Required field";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          dropDownItemCount: 6,
                                                          dropDownList: acon.cityList,
                                                           onChanged: (val) async {
                                                           acon.churchList.clear();
                                                           await acon.getChurch(_cnt.dropDownValue?.value ?? '',_cnt2.dropDownValue?.value ?? '',_cnt1.dropDownValue?.value ?? '');
                                                           setState(() {
                                                             
                                                           });
                                                        },
                                                        ),
                                        ),
                                        SizedBox(
                        height: mHeight / 60,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                                      
                                        Container(
                                          height: mHeight/16,
                                          width: mWidth/1.135,
                                          child: DropDownTextField(
                                                          // initialValue: "name4",
                                                          controller: _cnt3,
                                                          clearOption: true,
                                                          textFieldDecoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            labelText: 'Select Church'
                                                          ),

                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Required field";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          dropDownItemCount: 6,
                                        
                                                          dropDownList: acon.churchList,
                                                          
                                                          onChanged: (val) {},
                                                        ),
                                        ),
                                        SizedBox(
                        height: mHeight / 60,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.qr_code),
                              ),
                              SizedBox(width: 15,),
                              Form(
                                key: acon.form,
                                child: Container(
                                  width: mWidth / 1.3,
                                  //color: greyColor,
                                  child: TextFormField(
                                    validator: (value){
                                      if(!RegExp(r'(^[A-Z]\+[a-z]\+[0-9])').hasMatch(value!)){
                                        return '';
                                      }
                                    },
                                    controller: acon.promo_code,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // border: OutlineInputBorder(),
                                      // prefixIcon:
                                      // filled: true,
                                      // fillColor: greyColor,
                                      hintText: 'Promo_Code',


                                    ),
                                  ),
                                ),
                              ),

                            ]),
                        SizedBox(
                          height: mHeight / 57,
                          width: mWidth / 1.14,
                          child: Divider(thickness: 1, color: blackColor),
                        ),
                      ],
                    )),                  
             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Checkbox(
                    value: _isChecked,
                    onChanged: ((value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    })),
                Text(
                  'When you Register, you agree to our ',
                  style: TextStyle(fontSize: 10),
                ),
                InkWell(
                    child: const Text(
                      'Terms and Conditions ',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 10),
                    ),
                    onTap: () {
                      //Get.to(() => Terms());
                    }),
                Text(
                  'and',
                  style: TextStyle(fontSize: 10),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'acknowledge reading our',
                      style: TextStyle(fontSize: 10),
                    ),
                    InkWell(
                        child: Text(
                          ' User Privacy Notice',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 10),
                        ),
                        onTap: () {
                          //Get.to(() => PrivacyPolicy());
                        }),
                    Text(
                      '.',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
                      
                    
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,top: 40),
                          child: InkWell(
                            onTap: ()async{
                       
                        if(_isChecked){
                              if(acon.mobileCon.text.isEmpty){                        
                              Fluttertoast.showToast(msg: "Please Valid Mobile Number");
                              }
                              else if(acon.userNameCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Your Name");
                              }   else if(acon.emailCon.text.isEmpty){          
                                Fluttertoast.showToast(msg: "Please Enter Email Address");
                              }   else if(val == -1) {
                                Fluttertoast.showToast(msg: "Please Select Gender");
                              } else if(_cnt.dropDownValue?.value == null) {
                                Fluttertoast.showToast(msg: "Select State");
                              } else if(_cnt1.dropDownValue?.value == null) {
                                Fluttertoast.showToast(msg: "Select City");
                              } else if(_cnt2.dropDownValue?.value == null) {
                                Fluttertoast.showToast(msg: "Select District");
                              } else if(_cnt3.dropDownValue?.value == null) {
                                Fluttertoast.showToast(msg: "Select Church");
                              }
                              else{         
                                  if (_validateEmail(acon.emailCon.text)) {
                                  await acon.register(val == 0 ? "Male" : "Female", 
                                  _cnt.dropDownValue?.value ?? '', 
                                  _cnt2.dropDownValue?.value ?? '',
                                   _cnt1.dropDownValue?.value ?? '',
                                   _cnt3.dropDownValue?.value ?? '',
                                  );
                                 acon.mobileCon.clear();
                                 acon.userNameCon.clear();
                                 acon.emailCon.clear();
                                 acon.newPassCon.clear();
                                 acon.confirmPassCon.clear();
                                 acon.promo_code.clear();
                                 val = -1;
                               } else {
                                 Fluttertoast.showToast(
                                  msg: "Please Enter Valid Email Address");
                               }
                                //  var DoctorID = GetStorage().read('driverId').toString();           
                                //  print('aaaaa'+DoctorID);     
                                 }} else {
                                  Fluttertoast.showToast(
                              msg: "Accept terms and conditions");
                                 }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/1.2,
                              decoration: BoxDecoration(  color:_isChecked ? blackColor:appColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                              
                            ),
                          ),
                        ),
              ]),
        ),));
  }
   bool _validateEmail(email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(acon.emailCon.text);
  }
  
}