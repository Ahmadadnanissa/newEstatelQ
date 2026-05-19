import 'package:flutter/material.dart';

class CustomMessage {
  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),

              const SizedBox(width: 10),

              Expanded(child: Text(message)),
            ],
          ),

          backgroundColor: Colors.green,

          behavior: SnackBarBehavior.floating,

          margin: const EdgeInsets.all(15),

          duration: const Duration(seconds: 2),
        ),
      );
  }

  static void error(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),

              const SizedBox(width: 10),

              Expanded(child: Text(message)),
            ],
          ),

          backgroundColor: Colors.red,

          behavior: SnackBarBehavior.floating,

          margin: const EdgeInsets.all(15),

          duration: const Duration(seconds: 3),
        ),
      );
  }
}
