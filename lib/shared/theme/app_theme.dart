import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final principalAppTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.textGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
    ),
  );
}
