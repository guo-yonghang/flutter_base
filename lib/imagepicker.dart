import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile? video;

  //拍照函数
  Future<void> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        image = photo;
      });
    }
  }

  // 选择相册函数
  Future<void> openGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        image = photo;
      });
    }
  }

  //录制视频函数
  Future<void> takeVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        video = file;
      });
    }
  }

  //相册选择视频函数
  Future<void> openVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        video = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              //点击按钮拍照
              ElevatedButton(
                onPressed: takePhoto,
                child: const Text('拍照'),
              ),
              //点击按钮选择相册
              ElevatedButton(
                onPressed: openGallery,
                child: const Text('相册'),
              ),
              ElevatedButton(
                onPressed: takeVideo,
                child: const Text('录制视频'),
              ),
              ElevatedButton(
                onPressed: openVideo,
                child: const Text('选择视频'),
              ),
              image == null
                  ? const Text('No image selected 1.')
                  : Image.file(File(image!.path)),
            ],
          ),
        ));
  }
}
