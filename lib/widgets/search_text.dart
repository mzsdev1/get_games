import 'package:flutter/material.dart';

class NiceTextField extends StatelessWidget {
  const NiceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'Enter text',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
