import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

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
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                    (route) => false
                );
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




Future<bool> showDeleteDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Delete Account',
          style: TextStyle(
            color: Color(0xff008080),
          ),
        ),
        content: Text(
          'Are you sure you want to delete your account?',
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
            onPressed: () async {
              try {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  await user.delete();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    signupRoute,
                        (route) => false,
                  );
                } else {
                  print('User is null');
                }
              } catch (e) {
                await showErrorDialog(
                    context,
                    e.toString()
                );
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Color(0xff008080),
              ),
            ),
          )
        ],
      );
    },
  ).then((value) => value ?? false);
}

Future<void> showResetDialog(
    BuildContext context,
    String text,
    ) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
            'Reset Password',
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