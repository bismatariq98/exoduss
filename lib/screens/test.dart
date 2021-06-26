// import 'dart:io';
// import 'dart:async';
// import 'package:exoduss/main.dart';
// import 'package:exoduss/screens/picker_method.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:flutter_absolute_path/flutter_absolute_path.dart';
// // import 'package:wechat_assets_picker/wechat_assets_picker.dart';
// // import 'package:wechat_camera_picker/wechat_camera_picker.dart';
// class Test extends StatefulWidget {
  

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test>  {
//   List<File> _files;
//   @override
//   void initState() { 
//     super.initState();
//     // imagePickerTest();
//     init();
//   }

//    final int maxAssetsCount = 9;

//   List<AssetEntity> assets = <AssetEntity>[];

//   bool isDisplayingDetail = true;

//   int get assetsLength => assets.length;

 


//      List<PickMethod> get pickMethods {
//     return <PickMethod>[
//       PickMethod.image(maxAssetsCount),
//       PickMethod.video(maxAssetsCount),
//       PickMethod.audio(maxAssetsCount),
//       PickMethod.camera(
//         maxAssetsCount: maxAssetsCount,
//         handleResult: (BuildContext context, AssetEntity result) =>
//             Navigator.of(context).pop(<AssetEntity>[...assets, result]),
//       ),
//       PickMethod.common(maxAssetsCount),
//       PickMethod.threeItemsGrid(maxAssetsCount),
//       PickMethod.customFilterOptions(maxAssetsCount),
//       PickMethod.prependItem(maxAssetsCount),
//       PickMethod(
//         icon: '🎭',
//         name: 'WeChat Moment',
//         description: 'Pick assets like the WeChat Moment pattern.',
//         method: (BuildContext context, List<AssetEntity> assets) {
//           return AssetPicker.pickAssets(
//             context,
//             maxAssets: maxAssetsCount,
//             specialPickerType: SpecialPickerType.wechatMoment,
//           );
//         },
//       ),
//       PickMethod.noPreview(maxAssetsCount),
//       PickMethod(
//         icon: '🎚',
//         name: 'Custom image preview thumb size',
//         description: 'You can reduce the thumb size to get faster load speed.',
//         method: (BuildContext context, List<AssetEntity> assets) {
//           return AssetPicker.pickAssets(
//             context,
//             maxAssets: maxAssetsCount,
//             selectedAssets: assets,
//             requestType: RequestType.image,
//             previewThumbSize: const <int>[150, 150],
//             gridThumbSize: 80,
//           );
//         },
//       ),
//     ];
//   }

//   Future<void> selectAssets(PickMethod model) async {
//     final List<AssetEntity> result = await model.method(context, assets);
//     if (result != null) {
//       assets = List<AssetEntity>.from(result);
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }

//    Future<void> init() async {
//     /// uri can be of android scheme content or file
//     /// for iOS PHAsset identifier is supported as well

//     // List assets = await selectImagesFromGallery();
//     List<File> files = [];
//     for ( AssetEntity assetEntity in assets) {
//       final filePath =
//           await FlutterAbsolutePath.getAbsolutePath(assetEntity.relativePath);
//       files.add(File(filePath));
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _files = files;
//     });
//   }
// final _picker = ImagePicker();
// //  List<Asset> assets = await imagePickerTest();
//    List newList = [];


  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//            Container(
//                       height: MediaQuery.of(context).size.height ,
//                       child: GridView.builder(
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               crossAxisSpacing: 4,
//                               mainAxisSpacing: 4),
//                           itemBuilder: (_, i) {
//                             // var file = selectedModel.files[i];
//                             return GestureDetector(
//                               child: 
//                               // Image.asset("assets/camera.png"),
//                               Image.file(
//                                 File("${_files}"),
//                                 fit: BoxFit.cover,
//                               ),
//                               onTap: () {
//                                 // setState(() {
//                                 //   image = file;
//                                 // });
//                               },
//                             );
//                           },
//                           itemCount: 18),
//                     )
//     );
//   }


// }