import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerkey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content:
          Text(message, style: TextStyle(color: Colors.white, fontSize: 20)),
    );

    messengerkey.currentState!.showSnackBar(snackBar);
  }
}
