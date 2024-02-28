import 'package:flutter/material.dart';

handleError(BuildContext context) {
  final snackBar = SnackBar(
    backgroundColor: Colors.deepOrange,
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
