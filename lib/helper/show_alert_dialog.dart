import 'package:flutter/material.dart';

void ShowMessage(
  BuildContext context,
  List<Widget> message,
  List<Widget> actions,
) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: message),
        ),
        actions: actions,
      );
    },
  );
}
