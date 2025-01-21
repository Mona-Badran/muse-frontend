import 'package:flutter/material.dart';
import '../../config.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';
class ResultPage extends StatelessWidget {
  final String imageUrl;

  const ResultPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Artwork",
        onAvatarTap: () {},
        avatarUrl: null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArchImage(
              imagePath: imageUrl.startsWith('http')
                  ? imageUrl
                  : '$BASE_URL$imageUrl',  // Use BASE_URL for production URLs
              width: double.infinity,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
