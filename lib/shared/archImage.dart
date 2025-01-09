import 'package:flutter/material.dart';

class ArchImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const ArchImage({
    required this.imagePath,
    this.width = double.infinity,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(100),
      ),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
