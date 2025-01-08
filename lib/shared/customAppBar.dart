import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onAvatarTap;
  final String? avatarUrl;

  const CustomAppBar({
    required this.title,
    required this.onAvatarTap,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return const AppBar(
      backgroundColor: Color(0xFFFEF7E6),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
