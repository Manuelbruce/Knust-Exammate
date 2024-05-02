import 'package:flutter/material.dart';

Future<void> showErrorDialog(
    BuildContext context,
    String text,
    ) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
            'An error has occurred',
            style: TextStyle(
              color: Color(0xff008080),
            )
        ),
        content: Text(text,
          style: TextStyle(
            color: Color(0xff008080),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'ok',
              style: TextStyle(
                color: Color(0xff008080),
              ),
            ),
          ),
        ],
      );
    },
  );
}