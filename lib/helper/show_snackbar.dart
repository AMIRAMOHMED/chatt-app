

import 'package:flutter/material.dart';

void shwoSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}