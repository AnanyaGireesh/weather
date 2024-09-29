import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Flutter Demo",
          style: TextStyle(color: Colors.cyanAccent),
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
