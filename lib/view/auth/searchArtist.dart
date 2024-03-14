import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/controller/auth.dart';
import 'package:sreshtgeeth/view/auth/welcome.dart';
import 'package:sreshtgeeth/view/bottomsheet/homepage.dart';

import '../../common/base_colors.dart';
import '../../common/text.dart';
import '../bottomsheet/bottomsheet.dart';

class searchArtist extends StatefulWidget {
  const searchArtist({super.key});

  @override
  State<searchArtist> createState() => _searchArtistState();
}
  AuthCon acon = Get.put(AuthCon());

class _searchArtistState extends State<searchArtist> {
  @override
  void initState() {
    call();
    super.initState();
    
  }

  call()async{
    try {
      await acon.artistapi();
    
    } catch (e) {
      
    }
    checklist = acon.artistdata?.myLanguageList ?? [];
     if(this.mounted){
       setState(() {
      
    });
     }
   
    
    setState(() {
      
    });
  }

  
  List checklist = acon.artistdata?.myLanguageList??[];
  void searchitemto(String query) {
    final suggestions = acon.artistdata!.myLanguageList.where((s) {
      final partname = s.artistName.toString().toLowerCase();
      final input = query.toLowerCase();
      return partname.contains(input);
      //  if(partname.contains(input))
      //  {
      //   return true;
      //  }
      //  return false;


      
    }).toList();
    setState(() => checklist = suggestions);
    print('as' + checklist.toString());
    print('aaaaaaaaaaaaaaaaaaaaaaaaa' + query);
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    mHeight = size.height;
    mWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
              Padding(
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
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Txt(text: 'Pick 2 or more artists you like',color: blackColor,fsize: 20,weight: FontWeight.w500,),
               ),
               Container( 
                 height: mHeight/16,
                 width: mWidth/1.2,
                 decoration: BoxDecoration(  color: greyColor,borderRadius: BorderRadius.circular(8)),
                 child: Row(
                  children: [
                     Container(
                        height: mHeight/3,
                        width: mWidth/1.3,
                       //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                       //color: darkGreyColor,
                       //border: Border.all(color: darkGreyColor,width: 2,)
                       //),
                       child: TextField(
                         decoration: InputDecoration(
                           prefixIcon: Image.asset('assets/Search.png',scale: 3,),
                           border: InputBorder.none,
                           hintText: 'Search Artist',
                           hintStyle: TextStyle(color: darkGreyColor,fontSize: 18)
                         ),
                          onChanged: (value){
                           searchitemto(value);
                         },
                       ),
                     ),
               ],
                 ),),
                 SizedBox(height: 20,),
                 Container(height: mHeight/2.2,
            width: mWidth/1.1,
            //color: Colors.amber,
            child: 
            //acon.artistdata!.myLanguageList.length == 0 ? CircularProgressIndicator():
             GridView.builder(
              
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3,
              //   mainAxisExtent: 
                  ),
              itemCount: checklist.length,
              itemBuilder: (BuildContext ctx, index) {
                final search = checklist[index];
                return Obx(() =>InkWell(
                  onTap: (){
                    acon.artistdata!.myLanguageList[index].select.value =! acon.artistdata!.myLanguageList[index].select.value;
                    print('object' + '${acon.artistdata?.myLanguageList[index].select.toString()}');
                    if (acon.artistdata!.myLanguageList[index].select.value) {
                      acon.addartistapi(acon.artistdata!.myLanguageList[index].artistId);
                    } else {
                      acon.removeartistapi(acon.artistdata!.myLanguageList[index].artistId);
                    }
                  },
                  child:  Container(
                    height: mHeight/10,
                    width: mWidth/3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // color: Colors.amber,
                        
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children:[ Container(
                          decoration: BoxDecoration(
                            //color: redcolor,
                            borderRadius: BorderRadius.circular(47),
                            border: checklist[index].select.value ?Border.all(width: 2,color:redcolor ) :Border.all(width: 0,color: whiteColor )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(checklist[index].profile ?? ''),radius: 45,),
                          ),
                        ),
                        checklist[index].select.value ?Image.asset('assets/artisticon.png',scale: 25,) : Row()
                        ]
                      ),
                      Txt(text: '${checklist[index].artistName}',)
                    ]),
                  ),),
                );
              }),),
              SizedBox(height: 10,),
               InkWell(
              onTap: (){
                
                Get.to(welcome());
               // Get.to(() => Home());
              },
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Container(
                                    height: mHeight/16,
                                    width: mWidth/3,
                                    decoration: BoxDecoration(  color: redcolor,borderRadius: BorderRadius.circular(25)),
                                    child: Center(child: Txt(text: 'Done',fsize: 16,weight: FontWeight.bold,color: whiteColor,)),
                                    
                                  ),
               ),
             ),
               InkWell(
              onTap: (){
                Get.offAll(welcome());
               // Get.to(() => searchArtist());
              },
               child: Container(
                                  height: mHeight/16,
                                  width: mWidth/3,
                                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(25),border: Border.all(width: 1)),
                                  child: Center(child: Txt(text: 'Skip',fsize: 16,weight: FontWeight.bold,color: blackColor,)),
                                  
                                ),
             ),
          ]),
        ),),
        );
  }
}