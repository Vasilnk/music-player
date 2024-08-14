import 'package:flutter/material.dart';

class SearchBarPortion extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchBarPortion({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Search songs',
        ),
      ),
    );
  }
}
