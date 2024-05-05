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

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: const Text(
            'Sign out',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          content: Text(
            'Are you sure you want to Log out ?',
            style: TextStyle(
              color: Color(0xff008080),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xff008080),
                ),
              ),

            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Log out',
                style: TextStyle(
                  color: Color(0xff008080),
                ),

              ),

            )
          ]
      );
    },
  ).then((value) => value ?? false);
}
