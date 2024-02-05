import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help',
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Placeholder()
    );
  }
}