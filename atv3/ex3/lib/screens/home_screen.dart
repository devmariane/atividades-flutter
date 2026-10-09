import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter By Example'),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: CupertinoColors.systemBlue,
      ),
      body: Center(child: Image.asset('assets/logo.png', width: 200)),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
