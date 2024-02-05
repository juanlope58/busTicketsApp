import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My account',
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: const Placeholder()
    );
  }
}