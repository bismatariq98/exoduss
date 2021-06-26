
import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:exoduss/screens/files.dart';
import 'package:exoduss/widgets/headertwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:storage_path/storage_path.dart';
class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<CameraDescription> _cameras;
  CameraController _controller;
  bool _isReady = false;

  List<FileModel> files;
  FileModel selectedModel;
  String image;
  @override
  void initState() {
    super.initState();
    getImagesPath();
     _setUpCamera();

  }

    void _setUpCamera() async {
    try {
      // initialize cameras.
      _cameras = await availableCameras();
      // initialize camera controllers.
      // Current bug for high / medium with samsung devices.
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.medium,
      );

      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }
//   String imagePath = "";
//  Future<void> getImagesPath() async {
//     String imagespath = "";
//     try {
//       imagespath = await StoragePath.imagesPath;
//       var response = jsonDecode(imagespath);
//       print(response);
//       var imageList = response as List;
//       List<FileModel> list =
//           imageList.map<FileModel>((json) => FileModel.fromJson(json)).toList();

//       setState(() {
//         // selectedModel = files[0];
//         image = list[11].files[0];
//       });
//     } on PlatformException {
//       imagespath = 'Failed to get path';
//     }
//     return imagespath;
//   }
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
       floatingActionButton: getFooter(),
      backgroundColor: Colors.black,
      body: SafeArea(

        child:
        
         Column(
          children: <Widget>[
            headersTwo("Your Name"),
            getBody(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Row(
            //       children: <Widget>[
            //         Icon(Icons.clear),
            //         SizedBox(width: 10),
            //         DropdownButtonHideUnderline(
            //             child: DropdownButton<FileModel>(
            //           items: getItems(),
            //           onChanged: (FileModel d) {
            //             assert(d.files.length > 0);
            //             image = d.files[0];
            //             setState(() {
            //               selectedModel = d;
            //             });
            //           },
            //           value: selectedModel,
            //         ))
            //       ],
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(
            //         'Next',
            //         style: TextStyle(color: Colors.blue),
            //       ),
            //     )
            //   ],
            // ),
            // Divider(),
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.45,
            //     child: 
                
            //     image != null
            //         ? Image.file(File(image),
            //             height: MediaQuery.of(context).size.height * 0.45,
            //             width: MediaQuery.of(context).size.width)
            //         : Container()),
            Divider(),
            selectedModel !=null || image !=null ?
            // selectedModel == null && selectedModel.files.length < 1 
                // ? Container()
                Stack(
                  children:[
                     Positioned(
                      top: 0,
                      left: 0,
                      right: 0,

                     child: 
                              
                   Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4),
                          itemBuilder: (_, i) {
                            var file = selectedModel.files[i];
                            return GestureDetector(
                              child: Image.file(
                                File(file),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                setState(() {
                                  image = file;
                                });
                              },
                            );
                          },
                          itemCount: selectedModel.files.length),
                    ),
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
                  ] 
          
                ):
                  Text("No data",style: TextStyle(color:Colors.white))
          ],
        )
      ),
    );
  }


 Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (_isReady == false ||
        _controller == null ||
        !_controller.value.isInitialized) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        width: Get.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))),
      );
    }

    return Container(
      width: Get.width,
      height: MediaQuery.of(context).size.height * 0.30,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview()),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }



   Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              MaterialCommunityIcons.folder,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 7, color: Colors.white)),
          ),
          SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Entypo.video_camera,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),
    );
  }

}






// import 'package:exoduss/picker/picker.dart';
// import 'package:exoduss/picker/selection.dart';
// import 'package:exoduss/picker/thumbnail.dart';
// import 'package:exoduss/screens/media.dart';

// import 'main_screen.dart';
// import 'package:flutter/material.dart';


// class SelectionGrid extends StatefulWidget {
//   const SelectionGrid({ Key key }) : super(key: key);

//   @override
//   _SelectionGridState createState() => _SelectionGridState();
// }

// class _SelectionGridState extends State<SelectionGrid> {
//   MediaPickerSelection selection;
//     showImage()async{
// final result = await MediaPicker.show(context);
//               if (result != null) {
//                 setState(() => selection = result);
//               }
//     }
    
//     @override
//   void initState() {
//     // TODO: implement initState
//     showImage();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body:  SelectionGridTwo(
//           selection: selection,
//         ),
//     );
//   }
// }

// class SelectionGridTwo extends StatelessWidget {
//   final MediaPickerSelection selection;

//   const SelectionGridTwo({
//     @required this.selection,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(20.0),
//       padding: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//         color: Colors.black12,
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//       child: selection == null || selection.selectedMedias.isEmpty
//           ? Text("No selection")
//           : Wrap(
//               spacing: 10.0,
//               runSpacing: 10.0,
//               children: <Widget>[
//                 ...selection.selectedMedias.map<Widget>(
//                   (x) => GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MediaViewerPage(media: x),
//                         ),
//                       );
//                     },
//                     child: SizedBox(
//                       width: 128,
//                       height: 128,
//                       child: MediaThumbnailImage(media: x),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
