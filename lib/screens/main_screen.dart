import 'package:exoduss/const/constant.dart';
import 'package:exoduss/main.dart';
import 'package:exoduss/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(height: Get.height,width: Get.width,
        child: Column(children: [
           headers(),
           Container(height: Get.height -430,width: Get.width,decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage("assets/cog.png"),fit: BoxFit.cover)
           ),),
      
            headers(),
            Expanded(child: Text("Write Some Cool Shit Here,Maybe something or just Cool Stuff",style: smalltext,)),
           SizedBox(height: 10,),
       Expanded(child: Text("Write Some Cool Shit Here,",style: smalltextTwo,)),
        ],),
        
        ),
      ),
      
    );
  }
}