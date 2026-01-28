import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:flutter/material.dart';

Future<void> showRetryDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onRetry,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red, size: 120),
            Text(message, style: const TextStyle(fontSize: 18)),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomBtn(
            txt: 'Retry',
            onPress: () {
              Navigator.of(context).pop();
              onRetry();
            },
          ),
        ],
      );
    },
  );
}
