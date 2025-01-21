import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:muse/features/artwork/resultPage.dart';
import 'package:path_provider/path_provider.dart';
import '../../config.dart';

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

  Future<void> _pickImageFromCamera() async {
    final XFile? returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) {
      return;
    }

    final savedImagePath = await _saveImageLocally(File(returnedImage.path));

    setState(() {
      _selectedImage = File(savedImagePath);
    });
    await _uploadImage(File(savedImagePath));
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

  Future<void> _uploadImage(File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$BASE_URL/artwork/upload'),
    );

    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final Map<String, dynamic> responseJson = jsonDecode(responseData.body);

        String imageUrl = responseJson['imageUrl'];
        print("Image URL received: $imageUrl");

        setState(() {
          _selectedImage = null;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(imageUrl: imageUrl),
          ),
        );
      } else {
        print("Image upload failed: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload image")),
        );
      }
    } catch (e) {
      print("Error uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading image")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedImage == null
            ? CircularProgressIndicator()
            : Image.file(_selectedImage!),
      ),
    );
  }
}