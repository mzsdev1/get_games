import 'package:flutter/material.dart';

class LoadProgressIndicator extends StatelessWidget {
  const LoadProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
