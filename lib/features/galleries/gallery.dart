import 'package:flutter/material.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';
import '../../shared/customButton.dart';

class GalleryDetailsPage extends StatelessWidget {
  final String name;
  final String city;
  final String country;
  final String imagePath;

  const GalleryDetailsPage({
    Key? key,
    required this.name,
    required this.city,
    required this.country,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: name,
        onAvatarTap: () {
          print('Avatar tapped');
        },
        avatarUrl: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ArchImage(
              imagePath: imagePath,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Events Page"));
  }
}