import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerFlutter(),
    );
  }
}

class ImagePickerFlutter extends StatefulWidget {
  const ImagePickerFlutter({Key? key}) : super(key: key);

  @override
  State<ImagePickerFlutter> createState() => _ImagePickerFlutterState();
}

class _ImagePickerFlutterState extends State<ImagePickerFlutter> {
  var _image;
  var imagePicker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(children: [
        MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            XFile image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            setState(() {
              _image = File(image.path);
            });
          },
          child: Text('From gallery'),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            XFile image =
                await imagePicker.pickImage(source: ImageSource.camera);
            setState(() {
              _image = File(image.path);
            });
          },
          child: Text('From Camera'),
        ),
        Container(
          color: Colors.grey,
          height: 300,
          width: 300,
          child: _image != null
              ? Image.file(_image, height: 300, width: 300)
              : Text("pick or click image"),
        ),
      ]),
    );
  }
}
