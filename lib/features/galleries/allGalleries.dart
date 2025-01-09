import 'package:flutter/material.dart';

final List<Gallery> galleries = [
  Gallery(
    name: 'Museum Name',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),
  Gallery(
    name: 'Museum Name',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery2.png',
  ),
  Gallery(
    name: 'Museum Name',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery3.png',
  ),
  Gallery(
    name: 'Museum Name',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery4.png',
  ),
];

class AllGalleries extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class Gallery {
  final String name;
  final String city;
  final String country;
  final String imagePath;

  Gallery({
    required this.name,
    required this.city,
    required this.country,
    required this.imagePath,
  });
}
