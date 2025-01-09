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

    );
  }
}
class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Events Page"));
  }
}