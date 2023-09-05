import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("leled sakine"),
      ),
      body: const Center(
        child: Text(
          "Sonunda geldik ve deniyoruz",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
