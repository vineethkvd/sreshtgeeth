import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/view/Artist/artist/artistLogin.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/auth.dart';
import '../controller/register_controller.dart';

class ArtistRegister extends StatefulWidget {
  const ArtistRegister({super.key});

  @override
  State<ArtistRegister> createState() => _ArtistRegisterState();
}

class _ArtistRegisterState extends State<ArtistRegister> {
  bool _isChecked = false;
  String? gender;
  bool _value = false;
  int val = -1;
  bool _isObscure = true;
  bool _isObscure1 = true;
  final RegisterCon registercon = Get.put(RegisterCon());
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
    await registercon.getstate();
    
     if(this.mounted){
       setState(() {
      
    });
     }
   
  }

  
  @override
  Widget build(BuildContext context) {
final formkey = GlobalKey<FormState>();
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
                  Txt(text:'Register',fsize: 20,weight: FontWeight.bold,)
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
                        controller: registercon.userNameCon,
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
                      
                        controller: registercon.emailCon,
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
              //           keyboardType: TextInputType.number,
              //          inputFormatters: <TextInputFormatter>[
              //         FilteringTextInputFormatter.digitsOnly
              //       ],  
              //           controller: registercon.mobileCon,
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
                          ),
                                         
                             //              RadioListTile(
                             //     title: Text("Male"),
                             //     value: "male", 
                             //     groupValue: gender, 
                             //     onChanged: (value){
                             //       setState(() {
                             //           gender = value.toString();
                             //       });
                             //     },
                             // ),
                       
                             // RadioListTile(
                             //     title: Text("Female"),
                             //     value: "female", 
                             //     groupValue: gender, 
                             //     onChanged: (value){
                             //       setState(() {
                             //           gender = value.toString();
                             //       });
                             //     },
                             // ),
                       
                                     
                                     ]),
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
                                                          dropDownList: registercon.stateList,
                                                          onChanged: (val) async {
                                                            registercon.districtList.clear();
                                                            await registercon.getDistrict(_cnt.dropDownValue?.value ?? '');
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
                                                          dropDownList: registercon.districtList,
                                                          onChanged: (val) async {
                                                            registercon.cityList.clear();
                                                            await registercon.getCity(_cnt2.dropDownValue?.value ?? '');
                                                            
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
                                                          dropDownList: registercon.cityList,
                                                           onChanged: (val) async {
                                                           registercon.churchList.clear();
                                                           await registercon.getChurch(_cnt.dropDownValue?.value ?? '',_cnt2.dropDownValue?.value ?? '',_cnt1.dropDownValue?.value ?? '');
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
                                        
                                                          dropDownList: registercon.churchList,
                                                          onChanged: (val) {
                                                            print('oooooooooooooooooooooooooo' + _cnt3.dropDownValue?.value ?? '');
                                                          },
                                                        ),
                                        ),
                                        SizedBox(
                        height: mHeight / 60,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                      ],
                    )),
                     
                       Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image.asset('assets/password.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _isObscure,
                        controller: registercon.newPassCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'New Password',
                           suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
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
                    child: Image.asset('assets/password.png',scale: 3,),
                  ),
                  SizedBox(width: 15,),
                   Container(
                      width: mWidth / 1.3,
                      //color: greyColor,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: _isObscure1,
                        controller: registercon.confirmPassCon,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                         // border: OutlineInputBorder(),
                        // prefixIcon:
                          // filled: true, 
                          // fillColor: greyColor,
                          hintText: 'Confirm Password',
                           suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          }),
                          
                        ),
                      ),
                    ),
              
              ]),
                               SizedBox(
                        height: mHeight / 57,
                        width: mWidth / 1.14,
                        child: Divider(thickness: 1, color: blackColor),
                      ),
                    
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
                               if(registercon.userNameCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Your Name");
                              }   else if(registercon.emailCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Email Address");
                              }   else if(registercon.newPassCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter New Password");
                              }   else if(registercon.newPassCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Confirm Password");
                              }    else if(registercon.newPassCon.text.isEmpty){
                                Fluttertoast.showToast(msg: "Please Enter Your Name");
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
                              } else if( registercon.newPassCon.text != registercon.confirmPassCon.text){
                            Fluttertoast.showToast(
                              msg: "Entered password should be same.");
                             }  else{         
                                  if (_validateEmail(registercon.emailCon.text)) {
                                await registercon.registerapi(val == 0 ? 'Male' : 'Female',_cnt.dropDownValue?.value ?? '',_cnt2.dropDownValue?.value ?? '',_cnt1.dropDownValue?.value ?? '',_cnt3.dropDownValue?.value ?? '');  
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      Text(
                                        textAlign: TextAlign.start,
                                        "Awaiting for Admin Approvel   ",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Txt(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',),
                                    ],
                                  ),
                                ),
                                Image.asset('assets/admin.png',scale: 4,),
                              ],
                            ),
                          ),
                          
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: blackColor,
                                  ),
                                  child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: blueColor, foregroundColor: whiteColor),
                                    child: const Txt(
                                      text: 'Ok',
                                      fsize: 20,
                                      color: whiteColor,
                                    ),
                                    onPressed: () async {
                                     // acon.storage.remove('driverId');
                                      Get.off(()=>const artistLogin());
                                  
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
                                 
                                 registercon.mobileCon.clear();
                                 registercon.userNameCon.clear();
                                 registercon.emailCon.clear();
                                 registercon.newPassCon.clear();
                                 registercon.confirmPassCon.clear();
                                 val = -1;
                        }
                        //  else if( registercon.mobileCon.text.length > 10){
                        //     Fluttertoast.showToast(
                        //       msg: "Only 10 digits should be entered");
                        // }
                          else {
                          Fluttertoast.showToast(
                              msg: "Please Enter Valid Email Address");
                        }
                               
                                //  var DoctorID = GetStorage().read('driverId').toString();           
                                //  print('aaaaa'+DoctorID);       ;
                                 }} else {
                                   Fluttertoast.showToast(
                              msg: "Accept terms and conditions");
                                 }
                            },
                            child: Container(
                              height: mHeight/16,
                              width: mWidth/1.6,
                              decoration: BoxDecoration(color:_isChecked ? blackColor:appColor,borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Txt(text: 'Next',fsize: 20,weight: FontWeight.bold,color: whiteColor,)),
                              
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
    return regex.hasMatch(registercon.emailCon.text);
  }

  
  
}