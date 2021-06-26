import 'package:exoduss/screens/camera.dart';
import 'package:exoduss/screens/gallery.dart';
import 'package:exoduss/screens/likeComments.dart';
import 'package:exoduss/screens/ownGallery.dart';
import 'package:exoduss/screens/ownGalleryTwo.dart';
import 'package:exoduss/screens/test.dart';

import 'main_screen.dart';
import 'package:exoduss/main.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int menuvalue = 1;
  
  @override
  Widget build(BuildContext context) {
Widget child = MainScreen();
     switch (menuvalue) {
      case 0:
       child= OwnGalleryTwo();
        break;
      case 1:
       child=  MainScreen();
        break;
      case 2:
          child=  MyHomePage();
        break;
      case 3:
         child=  LikeComment();
        break;
      case 4:
         child=  OwnGallery ();
        break;
    }
    return 
   Scaffold(
    backgroundColor: Colors.black,
     body: SizedBox.expand(child: child),
             bottomNavigationBar:
          new Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                  primaryColor: Colors.red,
                  textTheme: Theme
                      .of(context)
                      .textTheme
                      .copyWith(caption: new TextStyle(color: Colors.black)
                  )
              ),
              child: BottomNavigationBar(

                onTap: (newIndex) => setState(() => menuvalue = newIndex),
                currentIndex: menuvalue,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.red,
                items: [
                  BottomNavigationBarItem(
                    icon: new Image.asset('assets/heart.png', width: 52,height: 52, fit:BoxFit.fill),
                    activeIcon:new Image.asset('assets/heart.png', width: 52,height: 52,  fit:BoxFit.fill),
                    title: Container(),
                  ),
                  BottomNavigationBarItem(
                    icon: new Image.asset('assets/letter.png', width: 52,height: 52, fit:BoxFit.fill),
                    activeIcon:new Image.asset('assets/letter.png', width: 52,height: 52,  fit:BoxFit.fill),
                    title: Container(),
                  ),
                  BottomNavigationBarItem(
                    icon: new Image.asset('assets/camera.png', width: 52,height: 52, fit:BoxFit.fill),
                    activeIcon:new Image.asset('assets/camera.png', width: 52,height: 52,  fit:BoxFit.fill),
                    title: Container(),
                  ),
                  BottomNavigationBarItem(
                    icon: new Image.asset('assets/navigation.png', width: 52,height: 52, fit:BoxFit.fill ),
                    activeIcon:new Image.asset('assets/navigation.png', width: 52,height: 52,  fit:BoxFit.fill),
                    title: Container(),
                  ),
                  BottomNavigationBarItem(
                    icon: new Image.asset('assets/lock.png', width: 52,height: 52, fit:BoxFit.fill),
                    activeIcon:new Image.asset('assets/lock.png', width: 52,height: 52,  fit:BoxFit.fill),
                    title: Container(),
                  ),
                ],
              )
          ),
   );
  }
}