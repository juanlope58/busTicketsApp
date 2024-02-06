import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.green);
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.red);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, Colors.blue);
  }

  static void _showSnackBar(BuildContext context, String message, Color textColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Container(
          alignment: Alignment.center,
          child: Text(
            message,
            style: TextStyle(
              color: textColor,
              fontSize: 15.0
            ),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}