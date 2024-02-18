import 'package:flutter/material.dart';

void showErrorDialog({
  required BuildContext context,
  required String errorMessage,
  String? title,
}) {
  // Using a predefined error icon for all error dialogs
  IconData errorIcon = Icons.error_outline;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(errorIcon, color: Colors.red), // Error icon in red
            const SizedBox(width: 10), // Spacing between the icon and the message
            Expanded(child: Text(errorMessage)), // The error message
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
