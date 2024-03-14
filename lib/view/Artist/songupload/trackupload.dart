import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sreshtgeeth/view/Artist/controller/uploadsong_controller.dart';
import 'package:sreshtgeeth/view/Artist/songupload/uploadSongs.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../artistHomepage.dart';

class trackUpload extends StatefulWidget {
  final vocal;
  const trackUpload({this.vocal,super.key});
  @override
  State<trackUpload> createState() => _trackUploadState();
}

class _trackUploadState extends State<trackUpload> {
  PickedFile? _pickedFile;
  final picker = ImagePicker();
  final UploadSongCon uploadsongcon = Get.put(UploadSongCon());
   bool isChecked = false;
   bool isCheckedd = false;
   bool isCheckeddd = false;


  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.audio,
  //   );

  //   if (result != null) {
  //     setState(() {
  //       uploadsongcon.filePath = result.files.single.path!;
  //       uploadsongcon.selectedfile = File(result.files.single.path!) ;
  //     });
  //   }
  // }
  
  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      setState(() {
        uploadsongcon.filePathh = result.files.single.path!;
        uploadsongcon.selectedfiles = File(result.files.single.path!) ;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(text: 'Track Upload',fsize: 18,weight: FontWeight.bold,),
          leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                           widget.vocal == 'Yes' ? SizedBox():Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Txt(text: 'Upload Your Audio in Wav / Mp3',fsize: 14,weight: FontWeight.w500,)
                              ],
                            ),
                          ),
                          widget.vocal == 'Yes' ? SizedBox():uploadsongcon.filePathh == '' ?Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: ()async{
                               await _pickFiles();
                              },
                              child: Image.asset('assets/songupload.png',scale: 3,)),
                          ): Text(uploadsongcon.filePathh),
                           widget.vocal == 'Yes' ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Txt(text: 'Audio without vocals',fsize: 14,weight: FontWeight.w500,)
                              ],
                            ),
                          ): SizedBox(),
                          widget.vocal == 'Yes' ? uploadsongcon.filePathh == '' ?Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: ()async{
                               await _pickFiles();
                              },
                              child: Image.asset('assets/songupload.png',scale: 3,)),
                          ): Text(uploadsongcon.filePathh)
                          : SizedBox(),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Txt(text: 'Upload Your Cover Art 1:1',fsize: 14,weight: FontWeight.w500,)
                              ],
                            ),
                          ),
                          uploadsongcon.image != null
                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: mHeight / 6.5,
                                  width: mWidth / 3.2,
                                  //color: Colors.amber,
                                  child: Image.file(
                      
                         uploadsongcon.image as File,
                          fit: BoxFit.cover,
                        ),
                                ),
                              )
                  : InkWell(
                    onTap: (){
                      imagePicker();
                    },
                    child: Container(
                      height: 150,
                      child: Image.asset('assets/songupload.png')),
                  ),

                           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Checkbox(
      checkColor: Colors.white,
     // fillColor: Colors.green,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          print('object' + isChecked.toString());
        });}),
               
                Container(
                  width: mWidth/1.3,
                  child: Column(
                    children: [
                      Text(
                        "I Agree that the content I am uploading on this page is completely original and I am the copyright owner of it",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
               
               
              ]),
               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Checkbox(
      checkColor: Colors.white,
     // fillColor: Colors.green,
      value: isCheckedd,
      onChanged: (bool? value) {
        setState(() {
          isCheckedd = value!;
        });}),
               
                Container(
                  width: mWidth/1.3,
                  child: Column(
                    children: [
                      Text(
                        "I Agree that the content I am uploading on this page is completely original religious song nor hate spreading song nor vulgar song",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
               
               
              ]),
               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Checkbox(
      checkColor: Colors.white,
     // fillColor: Colors.green,
      value: isCheckeddd,
      onChanged: (bool? value) {
        setState(() {
          isCheckeddd = value!;
        });}),
               
                Container(
                  width: mWidth/1.3,
                  child: Column(
                    children: [
                      Text(
                        "I Agree that the content I am uploading on this page is not a cover song nor a remake song nor a reused song & I own this song in every aspect.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                
               
               
              ]),
               Padding(
                padding: const EdgeInsets.all(20.0),
                child:Obx(() => InkWell(
                  onTap: ()async {
                    if(uploadsongcon.image == null) {
                                        Fluttertoast.showToast(msg: 'Select Cover Image');
                                       } else if(isChecked == false || isCheckedd == false || isCheckeddd == false){
                                        Fluttertoast.showToast(msg: 'Accept the condition');
                                       } 
                        if(widget.vocal == 'No'){
                       if(uploadsongcon.filePathh == ''){
                                        Fluttertoast.showToast(msg: 'Select Audio');
                                       }  else {
                                              await uploadsongcon.uploadtrackapi();
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
                                        const Text(
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
                                  Image.asset('assets/songadmin.png',scale: 3.5,),
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
                                       backgroundColor: pinkColor, foregroundColor: whiteColor),
                                      child: const Txt(
                                        text: 'Ok',
                                        fsize: 20,
                                        color: whiteColor,
                                      ),
                                      onPressed: () async {
                                       // acon.storage.remove('driverId');
                                      
                                        Get.back();
                                        // SharedPreferences pref =
                                        //     await SharedPreferences.getInstance();
                                        // pref.clear();
                                        // Navigator.of(context)
                                        //     .pushAndRemoveUntil(
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 Login()),
                                        //         (Route<dynamic> route) =>
                                        //             false);
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
                  
                      }
                        }
                        if(uploadsongcon.image == null) {
                                        Fluttertoast.showToast(msg: 'Select Cover Image');
                                       } else if(isChecked == false || isCheckedd == false || isCheckeddd == false){
                                        Fluttertoast.showToast(msg: 'Accept the condition');
                                       } 
                       if(widget.vocal == 'Yes'){
                         if(uploadsongcon.filePathh == ''){
                          Fluttertoast.showToast(msg: 'Select Audio');
                         }   else {

                                              await uploadsongcon.uploadtrackapi();
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
                                  Image.asset('assets/songadmin.png',scale: 3.5,),
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
                                       backgroundColor: pinkColor, foregroundColor: whiteColor),
                                      child: const Txt(
                                        text: 'Ok',
                                        fsize: 20,
                                        color: whiteColor,
                                      ),
                                      onPressed: () async {
                                       // acon.storage.remove('driverId');
                                      
                                        Get.back();
                                        // SharedPreferences pref =
                                        //     await SharedPreferences.getInstance();
                                        // pref.clear();
                                        // Navigator.of(context)
                                        //     .pushAndRemoveUntil(
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 Login()),
                                        //         (Route<dynamic> route) =>
                                        //             false);
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
                  
                      }
                      }
                      
                  },
                  child: Container(
                                        height: mHeight/16,
                                        width: mWidth/1.1,
                                        decoration: BoxDecoration(  color: pinkColor,borderRadius: BorderRadius.circular(8)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            //Image.asset('assets/upload.png',scale: 4,),
                                            SizedBox(width: 7,),
                                           uploadsongcon.load.value == true ? CupertinoActivityIndicator(color: whiteColor,): Txt(text: 'Submit',fsize: 18,weight: FontWeight.bold,color: whiteColor,),
                                          ],
                                        ),
                                        
                                      ),
                ),),
              ),
               InkWell(
                onTap: () {
                  Get.offAll(ArtistHome());
                },
                 child: Container(
                                          height: mHeight/16,
                                          width: mWidth/1.15,
                                          decoration: BoxDecoration(  border: Border.all(color: blackColor),borderRadius: BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //Image.asset('assets/upload.png',scale: 4,),
                                              SizedBox(width: 7,),
                                              Txt(text: 'Cancel',fsize: 18,weight: FontWeight.bold,),
                                            ],
                                          ),
                                          
                                        ),
               ),
                                      SizedBox(height: 10,)
            
                        ],
                      ),
                    ),
                  ),
    ),);
  }

    
    imagePicker() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        padding: EdgeInsets.only(left: 90, top: 12, bottom: 12, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
                takePicture();
                // galaryPickerSource(id, type, extra);
              },
              icon: Icon(
                Icons.image_outlined,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.back();
                takecameraPicture();
                //    cameraPickerSource(id, type, extra);
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

      takePicture() async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      imageQuality: 25
    );
    uploadsongcon.storedImage = File(imageFile!.path);
      await cropimage(uploadsongcon.storedImage!.path);
    setState(() {
      // init.getimage();
    });
    // imagepicker();
    // init.getimage();
  }
 
      takecameraPicture() async {
    
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
      imageQuality: 25,
    );
    uploadsongcon.storedImage = File(imageFile!.path);
      await cropimage(uploadsongcon.storedImage!.path);
    
    setState(() {
      // init.getimage();
    });
    // imagepicker();
    // init.getimage();
  }


  Future<Null> cropimage(String? source)async{
  CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: source.toString(),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
     uploadsongcon.image = File(croppedFile!.path);

    setState(() {
      
    });
    
}

}