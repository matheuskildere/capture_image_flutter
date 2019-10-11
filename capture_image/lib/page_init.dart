import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageInit extends StatefulWidget {
  @override
  _PageInitState createState() => _PageInitState();
}


class _PageInitState extends State<PageInit> {
  @override
  File _imageFile;

  Future <Null> _pickImageFromCamera() async {
    final File imageFile =
      await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() => this._imageFile = imageFile);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera, color: Colors.black,),
              iconSize: 50,
              onPressed: ()async => await _pickImageFromCamera(),  
            ),
          ],
        ),
      ),

      body:Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children:<Widget>[
          if (_imageFile != null)...[
            Center(
              child: Image.file(_imageFile,width: 300, height: 300)
            )
          ]
        ]
      ),
    ); 
  }
}