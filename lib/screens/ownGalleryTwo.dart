import 'dart:convert';
import 'dart:io';

import 'package:exoduss/screens/files.dart';
import 'package:exoduss/widgets/headertwo.dart';
import 'package:get/get.dart';
import 'package:storage_path/storage_path.dart';

import 'main_screen.dart';
import 'package:flutter/material.dart';

class OwnGalleryTwo extends StatefulWidget {


  @override
  _OwnGalleryTwoState createState() => _OwnGalleryTwoState();
}

class _OwnGalleryTwoState extends State<OwnGalleryTwo> {

  @override
  void initState() { 
    super.initState();
     getImagesPath();
  }
    List<FileModel> files;
  FileModel selectedModel;
  String image;
    getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files.length > 0)
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body:SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(children: [
           Positioned(
            top: 1,
            // left: 0,
            // right: 0,
            child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
               Container(
                 height: 80,
                 width: 80,
    
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(70),
                 image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
               ),),
               Text("Hi Name Here",style: TextStyle(color:Colors.white,fontSize:30,))
              //               Container(
              //    height: 80,
              //    width: 80,
    
              //    decoration: BoxDecoration(
              //      borderRadius: BorderRadius.circular(70),
              //    image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
              //  ),),
            ],)),
                 Positioned(
            top: 58,
            left: 0,
            right: 0,
            child: 
        Divider(height: 6,color:Colors.white),
            ),
          Positioned(
            top: Get.height *0.09,
            left: 0,
            right:0,
            child: 
           Container(
                        height: MediaQuery.of(context).size.height ,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4),
                            itemBuilder: (_, i) {
                              var file = selectedModel.files[i];
                              return GestureDetector(
                                child: 
                                // Image.asset("assets/camera.png"),
                                Image.file(
                                  File(file),
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  // setState(() {
                                  //   image = file;
                                  // });
                                },
                              );
                            },
                            itemCount: selectedModel.files.length),
                      )
          ),
          Positioned(
            top: Get.height /2,
            left: 0,
            right: 0,
            child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
               Container(
                 height: 80,
                 width: 80,
    
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(70),
                 image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
               ),),
                            Container(
                 height: 80,
                 width: 80,
    
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(70),
                 image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
               ),),
            ],))
        ],),
      ),
    )     
    );
  }
}