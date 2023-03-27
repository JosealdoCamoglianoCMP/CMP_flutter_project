import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  void errorSnackBar(String msg, BuildContext context) {
    FloatingSnackBar(
      message: msg,
      context: context,
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1500),
      textColor: Colors.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
