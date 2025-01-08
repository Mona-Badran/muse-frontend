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
    return const Placeholder();
  }
}
