// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:image_gallery/image_gallery.dart';
// import 'package:photo_manager/photo_manager.dart';



// class UploadImageScreen extends StatefulWidget {
//   @override
//   _UploadImageScreenState createState() => new _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   List<Object> allImage = new List();
//   var result =  PhotoManager.requestPermission();

//   @override
//   void initState() {
//     super.initState();
//     loadImageList();
//   }

//   Future<void> loadImageList() async {
//     List allImageTemp;
//       allImageTemp = await FlutterGallaryPlugin.getAllImages;


//     setState(() {
//       this.allImage = allImageTemp;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('Image Gallery'),
//         ),
//         body: _buildGrid()
//         ,
//       ),
//     );
//   }

//   Widget _buildGrid() {
//     return GridView.extent(
//         maxCrossAxisExtent: 150.0,
//         // padding: const EdgeInsets.all(4.0),
//         mainAxisSpacing: 4.0,
//         crossAxisSpacing: 4.0,
//         children: _buildGridTileList(allImage.length));
//   }

//   List<Container> _buildGridTileList(int count) {

//     return List<Container>.generate(
//     count,
//     (int index) =>
//     Container(child: Image.file(File(allImage[index].toString()),
//     width: 96.0,
//     height: 96.0,
//     fit: BoxFit.contain,)));
//   }
// }


import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path/path.dart' as path;

class UploadImageScreen extends StatefulWidget {
  @override
  UploadImageScreenState createState() => UploadImageScreenState();
}

class UploadImageScreenState extends State  {
List<AssetPathEntity> list;
AssetPathEntity lista_photos;
List<AssetEntity> assetList;
int value = 0;

    void getFiles() async {
      var result = await PhotoManager.requestPermission();
      if (result) {
           list = await PhotoManager.getAssetPathList();
          // print(list[0].name);
           
            lista_photos = list[0];
            assetList = await lista_photos.getAssetListPaged(0, lista_photos.assetCount);
            value = lista_photos.assetCount;
      } else {
          /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
      }
    }


  _addItem() {
    setState(() {
      value = value + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    getFiles();
File file;
    return  Material(
      child: Stack(children: <Widget>[
          Container(color: Colors.black, height: 100,),
          Container( margin: EdgeInsets.only(top: 100), 
          child:

            Container(
    child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(widget.galleryItems[index].image),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: HeroAttributes(tag: galleryItems[index].id),
        );
      },
      itemCount: galleryItems.length,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes,
          ),
        ),
      ),
      backgroundDecoration: widget.backgroundDecoration,
      pageController: widget.pageController,
      // onPageChanged: onPageChanged,
    )
  )



          // ListView.builder(
          // itemCount: this.value,
          // itemBuilder: (context, index) => this._buildRow(index))
          // ),  
      ],)
    );
  }

//   Future<Uint8List> _getFile(entity ) async {
//     // File file = await entity.file;

//   Uint8List thumbBytes = ;

//     return thumbBytes;
// }

  _buildRow(int index)  async {
    AssetEntity entity = assetList[index];
    var image =  await entity.thumbData;

    return Container(
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all( Radius.circular(40.0),),
        image: new DecorationImage(
          image: new MemoryImage(image,),
            fit: BoxFit.cover,),
            ),

//       FaIcon(FontAwesomeIcons.file),
// Text(entity.title, style: TextStyle(fontSize: 20,),)

        // 


     margin: EdgeInsets.only(top: 8, left: 40) ,)
    ;
  }
}
