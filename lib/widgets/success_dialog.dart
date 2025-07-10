// lib/widgets/success_dialog.dart
import 'package:flutter/material.dart';

Future<void> showSuccessDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String buttonText,
  required VoidCallback onButtonPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button to close
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green.shade600,
              size: 28,
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[Text(message)]),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close the dialog first
              onButtonPressed(); // Then execute the callback
            },
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      );
    },
  );
}
