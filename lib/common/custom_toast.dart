import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show(
      String message, {
        ToastGravity gravity = ToastGravity.BOTTOM,
        Color backgroundColor = Colors.black87,
        Color textColor = Colors.white,
        double fontSize = 16.0,
        Toast toastLength = Toast.LENGTH_SHORT,
      }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void success(String message) {
    show(
      message,
      backgroundColor: Colors.green[600]!,
    );
  }

  static void error(String message) {
    show(
      message,
      backgroundColor: Colors.red[600]!,
    );
  }

  static void info(String message) {
    show(
      message,
      backgroundColor: Colors.blueGrey[700]!,
    );
  }
}
