import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBar({
    required this.controller,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[600],
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
