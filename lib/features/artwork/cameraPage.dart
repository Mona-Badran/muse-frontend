import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _pickImageFromCamera();
  }

  Future _pickImageFromCamera() async {
    final XFile? returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) {
      return;
    }

    final savedImagePath = await _saveImageLocally(File(returnedImage.path));

    setState(() {
      _selectedImage  = File(savedImagePath);
    });
  }

  Future<String> _saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final capturedFolder = Directory('${directory.path}/captured');
    if (!await capturedFolder.exists()) {
      await capturedFolder.create(recursive: true);
    }
    final String newPath = '${capturedFolder.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImage = await imageFile.copy(newPath);
    print("Image saved at: ${savedImage.path}");
    return savedImage.path;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedImage != null
            ? Image.file(_selectedImage!)
            : CircularProgressIndicator(),
      ),
    );
  }
}