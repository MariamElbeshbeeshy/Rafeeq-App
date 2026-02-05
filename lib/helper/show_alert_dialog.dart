import 'package:flutter/material.dart';

void ShowMessage(
  BuildContext context,
  String title,
  String message,
  List<Widget>? actions,
) {
  showDialog(
    context: context, // Required
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
      );
    },
  );
}