import 'package:flutter/material.dart';
import '../../shared/customSearchBar.dart';
import '../../shared/archImage.dart';
import '../../shared/customAppBar.dart';
import 'gallery.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config.dart';

class AllGalleries extends StatefulWidget {
  const AllGalleries({super.key});

  @override
  State<AllGalleries> createState() => _AllGalleriesState();
}

class _AllGalleriesState extends State<AllGalleries> {
  final TextEditingController searchController = TextEditingController();

  List<dynamic> galleries = [];
  bool isLoading = false; // Loading state

  void fetchGalleries(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('$BASE_URL/search?search=$query');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          galleries = data;
        });
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to load galleries: ${response.statusCode}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error fetching galleries: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                      Flexible(
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
