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

class AllGalleries extends StatefulWidget {
  const AllGalleries({super.key});

  @override
  State<AllGalleries> createState() => _AllGalleriesState();
}

class _AllGalleriesState extends State<AllGalleries> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
