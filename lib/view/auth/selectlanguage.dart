import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/text.dart';
import 'package:sreshtgeeth/view/auth/selectchurch.dart';

import '../../common/base_colors.dart';
import '../../controller/auth.dart';
import 'searchArtist.dart';

class selectLanguage extends StatefulWidget {
  final s;
  final d;
  final c;
  const selectLanguage( {required this.s,required this.d,required this.c,super.key});

  @override
  State<selectLanguage> createState() => _selectLanguageState();
}

class _selectLanguageState extends State<selectLanguage> {
  AuthCon acon = Get.put(AuthCon());
  @override
  void initState() {
     call();
    super.initState();
  }

  call()async{
    await acon.languagelistapi(widget.s, widget.d, widget.c);
    setState(() {
      
    });
  }
  bool isSwitched = false;  
  var textValue = 'Switch is OFF';  
  var list = [];
  var switchs = -1;
  int switchindex = -1;
  void toggleSwitch(bool value,int index) { 

    acon.languagelistdata?.languageList[index].istapped  =!acon.languagelistdata!.languageList[index].istapped;
    setState(() {
      print(value);
    });
    // if(a == false)  
    // {  
    //   setState(() {  
    //     isSwitched = true;  
    //     //textValue = 'Switch Button is ON';  
    //   });  
    //   print(isSwitched);  
    // }  
    // else  
    // {  
    //   setState(() {  
    //     isSwitched = false;  
    //     //textValue = 'Switch Button is OFF';  
    //   });  
    //   print(isSwitched);  
    // }  
  }  
  @override
  Widget build(BuildContext context) {
      final AuthCon acon = Get.put(AuthCon());
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: greyColor,
      body: Column(
      children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Txt(text: 'Select your preffered Language',fsize: 17,weight: FontWeight.w500,),
                    )
          ],
        ),
        SizedBox(height: 20,),
        Container(
          height: mHeight/2.5,
          width: mWidth/1.1,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: whiteColor),
        child: ListView.builder(
         physics: AlwaysScrollableScrollPhysics(),
         shrinkWrap: true,
         itemCount: acon.languagelistdata?.languageList.length ?? 0,
         itemBuilder: (BuildContext context, int index) {
        return  Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Txt(text: '${acon.languagelistdata?.languageList[index].languageTitle}', fsize: 16,weight: FontWeight.w500,),
              Transform.scale(  
                  scale: 1,  
                  child: Switch(  
                    onChanged: (value) async{
                      toggleSwitch(value,index);
                      if(value == true){
                        await acon.addlanguageapi(acon.languagelistdata?.languageList[index].languageId ?? '');
                        setState(() {
                          
                        });
                      } else {
                        await acon.removelanguageapi(acon.languagelistdata?.languageList[index].languageId ?? '');
                        setState(() {
                          
                        });
                      }
                      print("eeeeeeeee" + value.toString());
                      print(index);
                    },  
                    value: acon.languagelistdata?.languageList[index].istapped ?? false,  
                    activeColor: appColor,  
                    activeTrackColor: appColor,  
                    inactiveThumbColor: greyColor,  
                    inactiveTrackColor: greyColor,  
                  )  
                ),    
            ],),
          ),
              SizedBox(
                      height: mHeight / 57,
                      width: mWidth / 1.31,
                      child: Divider(thickness: 1, color: blackColor),
                    ),
        ],) ;
         }),
           ),
           InkWell(
            onTap: (){
              Get.to(() => searchArtist());
            },
             child: Padding(
               padding: const EdgeInsets.all(30.0),
               child: Container(
                                  height: mHeight/16,
                                  width: mWidth/1.6,
                                  decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
                                  child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                  
                                ),
             ),
           ),
         

        ],
        ),
        )
        );
  }
}