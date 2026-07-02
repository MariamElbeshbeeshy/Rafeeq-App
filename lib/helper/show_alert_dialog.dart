import 'package:flutter/material.dart';

void ShowMessage(BuildContext context, List<Widget> message, List<Widget> actions) {
  showDialog(
    context: context, // Required
    builder: (context) {
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              
            ],
          ),
          // child: Text(
          //   message,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          // ),
        ),
        actions: actions,
      );
    },
  );
}
