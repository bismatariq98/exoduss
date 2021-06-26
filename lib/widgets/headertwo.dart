import 'package:flutter/material.dart';
import 'package:exoduss/main.dart';
import 'package:get/get.dart';



Widget headersTwo(String name){
return        Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(
  
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
             Container(
  
               height: 50,
  
               width: 50,
  
               decoration: BoxDecoration(
  
                         image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.contain)
  
             ),),
             SizedBox(width:40),
  
             Text(name,style: TextStyle(color: Colors.white,fontSize: 30),),
  
            //   Container(
  
            //    height: 70,
  
            //    width: 70,
  
            //    decoration: BoxDecoration(
  
            //              image: DecorationImage(image: AssetImage("assets/cog.png"),fit: BoxFit.cover)
  
            //  ),),
  
          ],),
); 
}