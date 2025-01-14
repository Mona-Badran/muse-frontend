import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras; // List of available cameras
  late CameraController _controller;   // CameraController to manage the camera
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    // Fetch available cameras
    cameras = await availableCameras();

    // Check if cameras are available
    if (cameras.isNotEmpty) {
      // Initialize the camera controller with the first camera
      _controller = CameraController(
        cameras[0], // Choose the rear camera by default
        ResolutionPreset.high, // Set the resolution
      );

      // Initialize the controller
      await _controller.initialize();

      if (!mounted) return;

      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera')),
      body: isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(_controller), // Camera preview widget
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: () async {
                try {
                  // Capture a photo
                  XFile file = await _controller.takePicture();
                  print("Photo saved to: ${file.path}");
                  // You can use this file path to display the image
                } catch (e) {
                  print("Error capturing photo: $e");
                }
              },
              child: Icon(Icons.camera),
            ),
          ),
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
