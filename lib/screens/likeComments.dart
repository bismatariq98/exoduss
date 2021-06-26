import 'package:exoduss/widgets/headertwo.dart';
import 'package:get/get.dart';

import 'main_screen.dart';
import 'package:flutter/material.dart';


class LikeComment extends StatefulWidget {


  @override
  _LikeCommentState createState() => _LikeCommentState();
}

class _LikeCommentState extends State<LikeComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(height: Get.height,
        width: Get.width,
        child: Column(
          children:[
            headersTwo("name"),
            SingleChildScrollView(
              child: Container(
                height: 500,
                width: Get.width,
                child:ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context,i){
                   return Container(height: 80,
                   width: Get.width,
                   color: Colors.white,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                          Container(
                   height: 80,
                   width: 80,
            
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(70),
                   image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
                 ),),
            
                 Row(
                   children: [
                   Container(
                     height: 70,
                     width: 200,
                     child: Text("Here is your best Comment",style: TextStyle(fontSize:25),)),
                      Text("12d")
                   ],
                 ),
                       Container(
                   height: 80,
                   width: 80,
            
                   decoration: BoxDecoration(
                    
                   image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
                 ),),
            
            
                   ],),
                   );
            
                }),
              ),
            ),
      
      
          ]
          ),
        
          ),
      ));
  }
}