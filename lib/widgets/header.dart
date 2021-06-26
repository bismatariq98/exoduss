import 'package:exoduss/main.dart';
import 'package:flutter/material.dart';

Widget headers(){
return        Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(
  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
             Container(
  
               height: 70,
  
               width: 70,
  
               decoration: BoxDecoration(
  
                         image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.cover)
  
             ),),
  
             Text("Your Name",style: TextStyle(color: Colors.white,fontSize: 30),),
  
              Container(
  
               height: 70,
  
               width: 70,
  
               decoration: BoxDecoration(
  
                         image: DecorationImage(image: AssetImage("assets/cog.png"),fit: BoxFit.cover)
  
             ),),
  
          ],),
); 
}