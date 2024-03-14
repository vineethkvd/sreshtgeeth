import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sreshtgeeth/view/Artist/controller/addalbum_controller.dart';

import '../../../common/base_colors.dart';
import '../../../common/text.dart';
import '../../../controller/init.dart';

class addAlbum extends StatefulWidget {
  const addAlbum({super.key});

  @override
  State<addAlbum> createState() => _addAlbumState();
}

class _addAlbumState extends State<addAlbum> {
  PickedFile? _pickedFile;
  final picker = ImagePicker();
  final AddAlbumCon addalbumcon = Get.put(AddAlbumCon());

  @override
  void initState() {
    call();
    // TODO: implement initState
    super.initState();
  }

  call()async{
    await addalbumcon.albumlistapi();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Txt(text: 'Album Details',fsize: 18,weight: FontWeight.bold,),
          leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                    onPressed: () => Get.back(),
                  ),),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8,top: 8,left: 25),
              child: Txt(text: 'Album Title',fsize: 18,weight: FontWeight.w500,),
            )
                  ],),
                  Container(
                          width: mWidth / 1.15,
                          //color: greyColor,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: addalbumcon.album,
                            decoration: InputDecoration(
                               enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(
                               width: 0.8, color: Colors.black), //<-- SEE HERE
                              ),
                              //border: InputBorder.none,
                              //  border: OutlineInputBorder(
                                
                              //  borderRadius: BorderRadius.circular(5)
                              // ),
                             // border: OutlineInputBorder(),
                              filled: true, 
                              fillColor: whiteColor,
                              hintText: 'Album Title',
                            
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8,top: 8,left: 25),
              child: Txt(text: 'Upload Album Cover',fsize: 18,weight: FontWeight.w500,),
            )
                  ],),
                        addalbumcon.storedImage != null
                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: mHeight / 6.5,
                                  width: mWidth / 3.2,
                                  //color: Colors.amber,
                                  child: Image.file(
                      
                         addalbumcon.storedImage as File,
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
                  SizedBox(
                    height: 20,
                  ),
                    Obx(() =>InkWell(
                    onTap: () async{
                      if(addalbumcon.load.value == false){ if(addalbumcon.album.text.isEmpty){
                        Fluttertoast.showToast(msg: 'Enter Album Title');
                      } else if(addalbumcon.storedImage == null){
                        Fluttertoast.showToast(msg: 'Enter Album Cover');
                      } else {
                        await addalbumcon.albumapi();
                        await addalbumcon.albumlistapi();
                        
                        setState(() {
                          
                        });

                        
                      }} else {}
                      
                    },
                     child:  Container(
                                          height: mHeight/16,
                                          width: mWidth/1.1,
                                          decoration: BoxDecoration(  color: pinkColor,borderRadius: BorderRadius.circular(8)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //Image.asset('assets/upload.png',scale: 4,),
                                              SizedBox(width: 7,),
                                              addalbumcon.load.value == true? CupertinoActivityIndicator(color: whiteColor,) :Txt(text: 'Submit',fsize: 18,weight: FontWeight.bold,color: whiteColor,),
                                            ],
                                          ),
                                        ),),
                   ),
                   SizedBox(height: 20,),
                   Row(
                     children: [
                       Padding(
              padding: const EdgeInsets.only(bottom: 8,top: 8,left: 25),
              child: Txt(text: 'Album List',fsize: 18,weight: FontWeight.w500,),
            ),
                     ],
                   ),
                         ListView.builder(  physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
           shrinkWrap: true,
           itemCount: addalbumcon.listdata?.albumList.length ?? 0,
           itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                           Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: mHeight / 16,
                                      width: mWidth / 8.5,
                                      //color: Colors.amber,
                                      child: Image.network(
                                        addalbumcon.listdata?.albumList[index].albumCover ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                    Container(
                     // color: Colors.amber,
                      width: mWidth/1.55,
                      height: mHeight/17,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Txt(text: addalbumcon.listdata?.albumList[index].albumName ?? '',fsize: 14,weight: FontWeight.w500,),
                          //Txt(text: '12-03-2023',fsize: 12,),
                        ],
                      ),
                    ),
                   Column(children: [
                    //Txt(text: 'Eligible Play Minutes',),
                    //Txt(text: '3 mins',),
                   ],)
                  ],),
                ),
              SizedBox(
              height: mHeight / 300,
              child: const Divider(
                thickness: 1,
                color: bgreyColor,
              ),
            ),
              ],
            );
            })

                      ],
                    ),
                  ),
      ),
    );
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
      imageQuality: 25,
    );
    
      addalbumcon.storedImage = File(imageFile!.path);
      await cropimage(addalbumcon.storedImage!.path);
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
    
      addalbumcon.storedImage = File(imageFile!.path);
      await cropimage(addalbumcon.storedImage!.path);
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
    addalbumcon.image = File(croppedFile!.path);

    setState(() {
      
    });
    
}


}