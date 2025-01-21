import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _selectedImage;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _captureImage();
  }

  Future _captureImage() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
    await _uploadImageToServer();
  }

  Future<void> _uploadImageToServer() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUploading = true;
    });
    try {
      final url = Uri.parse('$BASE_URL/artwork/upload');
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('image', _selectedImage!.path));

      var response = await request.send();

      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Image uploaded successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      }

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error uploading image: $error"),
          backgroundColor: Colors.red,
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return _selectedImage != null
        ? Image.file(_selectedImage!)
        : Center(child: CircularProgressIndicator());
  }
}
