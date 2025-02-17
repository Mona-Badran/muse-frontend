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

  Future<void> fetchAllGalleries() async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('$BASE_URL/gallery');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          galleries = jsonDecode(response.body);
        });
      } else if (response.statusCode == 404) {
        setState(() {
          galleries = [];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No galleries found."),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to fetch galleries: ${response.statusCode}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error fetching galleries: $error"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> searchGalleries(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('$BASE_URL/gallery/search?search=$query');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          galleries = jsonDecode(response.body);
        });
      } else if (response.statusCode == 404) {
        setState(() {
          galleries = [];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No galleries found for \"$query\"."),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to search galleries: ${response.statusCode}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error searching galleries: $error"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllGalleries();
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
              if (query.isEmpty) {
                fetchAllGalleries();
              } else {
                searchGalleries(query);
              }
            },
            hintText: "Search for galleries",
          ),
        ),
        Expanded(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : galleries.isEmpty
                  ? Center(child: Text("No galleries found"))
                  : Padding(
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
                                    name: gallery['name'],
                                    imagePath: gallery['imagePath'],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 135,
                                  child: gallery['imagePath'] != null &&
                                          gallery['imagePath'].isNotEmpty
                                      ? ArchImage(
                                          imagePath: gallery['imagePath'],
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(100),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.image_rounded,
                                                size: 50,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  gallery['name'],
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
