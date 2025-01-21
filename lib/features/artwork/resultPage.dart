import 'package:flutter/material.dart';
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
    );
  }
}