// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sreshtgeeth/view/auth/searchArtist.dart';

// import '../../common/base_colors.dart';
// import '../../common/text.dart';

// class selectChurch extends StatefulWidget {
//   const selectChurch({super.key});

//   @override
//   State<selectChurch> createState() => _selectChurchState();
// }

// class _selectChurchState extends State<selectChurch> {

//   String dropdownvalue = 'church 1';   
  
//   // List of items in our dropdown menu
//   var items = [    
//     'church 1',
//     'church 2',
//     'church 3',
//     'church 4',
//     'church 5',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     mHeight = size.height;
//     mWidth = size.width;
//     return SafeArea(child: Scaffold(backgroundColor: whiteColor,body: Column(
//       children: [
//         Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: blackColor,
//                   ),
//                   onPressed: () => Get.back(),
//                   ),
//                 ],),
//             ),
//              Padding(
//                padding: const EdgeInsets.all(12.0),
//                child: Txt(text: 'Select Church Name',color: blackColor,fsize: 20,weight: FontWeight.w500,),
//              ),
//              Container(
//               height: mHeight/17,
//               width: mWidth/1.2,
//                decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: greyColor, //<-- SEE HERE
//                 ),
//                child: DropdownButton(
//                 value: dropdownvalue,
//                 // Down Arrow Icon
//                 icon:  Image.asset('assets/downarrow.png',scale: 3,),    
//                 items: items.map((String items) {
//                   return DropdownMenuItem(
//                     value: items,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Container(
//                          height: mHeight/18,
//                         width: mWidth/1.5,
//                         child: Txt(text: items,fsize: 16,)),
//                     ),
//                   );
//                 }).toList(),
//                 // After selecting the desired option,it will
//                 // change button value to selected value
             
//                onChanged:  (String? newValue) { 
//                   setState(() {
//                     dropdownvalue = newValue!;
//                   });
//                 },),
//              ),

//              InkWell(
//             onTap: (){
//               Get.to(() => searchArtist());
//             },
//              child: Padding(
//                padding: const EdgeInsets.all(50.0),
//                child: Container(
//                                   height: mHeight/16,
//                                   width: mWidth/1.9,
//                                   decoration: BoxDecoration(  color: blackColor,borderRadius: BorderRadius.circular(8)),
//                                   child: Center(child: Txt(text: 'Next',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
//                                 ),
//              ),
//            ),
         
//       ],
//     ),
//     ));
//   }
// }