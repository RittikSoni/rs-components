import 'package:flutter/material.dart';

/// Reusable Custom Dialog
class RsDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    List<RsDialogButton>? buttons,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            if (buttons != null)
              for (final button in buttons)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    button.onPressed?.call();
                  },
                  child: Text(button.text),
                ),
          ],
        );
      },
    );
  }
}

class RsDialogButton {
  final String text;
  final VoidCallback? onPressed;

  RsDialogButton({required this.text, this.onPressed});
}
