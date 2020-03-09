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
List<String> listPath;
int value = 0;
bool update = false;
List<String> listAlbuns =  new List<String>();



@override
   initState()  {
    super.initState();
    
}

  Future<void> _addItem() async {

     var result = await PhotoManager.requestPermission();
      if (result) {
           list = await PhotoManager.getAssetPathList();
          
              for(var name in list){
                listAlbuns.add(name.name);
              }

            lista_photos = list[0];
            assetList = await lista_photos.getAssetListPaged(0, 20);
            listPath = new List<String>();
            for (var i = 0; i != assetList.length; i++){
              var file = (await assetList[i].file).path + ';' + (await assetList[i+1].file).path + ';' + (await assetList[i+2].file).path ;
              listPath.add(file);
              i += 2;
              value = value + 1;
          }

      

      } else {
          /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
      }
}

  @override
  Widget build(BuildContext context) {


    var dropdownValue;
        return
        FutureBuilder(
        future: _addItem(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
             if (snapshot.connectionState == ConnectionState.done) {
                 return Material(
          child:
           Stack(children: <Widget>[
              Align(alignment: Alignment.topRight, 
              child: Container(       

                margin: EdgeInsets.only(right: 50),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 1,
                  style: TextStyle(
                    color: Colors.deepPurple),
                    underline: Container(height: 2,color: Colors.deepPurpleAccent,),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        
                        
                        });},
                        items: listAlbuns
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
      })
      .toList(),
  ),
              )
          ),
          Container( margin: EdgeInsets.only(top: 50, bottom: 10),  
          child:
          ListView.builder(
          itemCount: this.value,
          itemBuilder: (context, index) => this._buildRow(index)),  

          )],)
    );
             } else
                 return Text('Loading...');
        },
    );
        
        
             
       
      }

  _buildRow(int index)  {

    var path = listPath[index].split(';');


    return Container(margin: EdgeInsets.only(top: 5, left: 12, right: 5 ),child: Row(children: <Widget>[
      Container(
        height: 100,width: 125, decoration: new BoxDecoration(
        image: new DecorationImage(
          image: FileImage(new File(path[0])),
            fit: BoxFit.cover,),
            ),
      ),

Container(
        height: 100,width: 125, decoration: new BoxDecoration(
        image: new DecorationImage(
          image: FileImage(new File(path[1])),
            fit: BoxFit.cover,),
            ),
      ),
      
      Container(
        height: 100,width: 125, decoration: new BoxDecoration(
        image: new DecorationImage(
          image: FileImage(new File(path[2])),
            fit: BoxFit.cover,),
            ),
      ),


    ]),) ; 


//       FaIcon(FontAwesomeIcons.file),
// Text(entity.title, style: TextStyle(fontSize: 20,),)

        // 


    ;
  }
}
