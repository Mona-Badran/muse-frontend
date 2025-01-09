import 'package:flutter/material.dart';
import '../../shared/customSearchBar.dart';
import '../../shared/customBottomNavBar.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';

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
