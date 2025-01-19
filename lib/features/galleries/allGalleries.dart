import 'package:flutter/material.dart';
import '../../shared/customSearchBar.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';
import 'gallery.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
