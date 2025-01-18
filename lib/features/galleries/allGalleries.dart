import 'package:flutter/material.dart';
import '../../shared/customSearchBar.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';
import 'gallery.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final List<Gallery> galleries = [
  Gallery(
    name: 'Canvas4',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),
  Gallery(
    name: 'Gallery IV',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery2.png',
  ),
  Gallery(
    name: 'The Fourth Wall',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery3.png',
  ),
  Gallery(
    name: 'Quadro',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery4.png',
  ),
  Gallery(
    name: 'Canvas4',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),Gallery(
    name: 'Canvas4',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),Gallery(
    name: 'Canvas4',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),Gallery(
    name: 'Canvas4',
    city: 'City',
    country: 'Country',
    imagePath: 'assets/images/gallery1.png',
  ),
];

class AllGalleries extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Galleries',
          onAvatarTap: () {
            print('Avatar tapped');
          },
          avatarUrl: null,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomSearchBar(
            controller: searchController,
            onChanged: (query) {
              print('Search query: $query');
            },
            hintText: "Search for galleries",
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: galleries.length,
              itemBuilder: (context, index) {
                final gallery = galleries[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GalleryDetailsPage(
                          name: gallery.name,
                          city: gallery.city,
                          country: gallery.country,
                          imagePath: gallery.imagePath,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible (
                        child: ArchImage(
                          imagePath: gallery.imagePath,
                        ),
                      ),
                      Text(
                        gallery.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
