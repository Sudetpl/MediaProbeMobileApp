import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/theme/color.dart';

final ThemeData themeData = ThemeData(

  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 18),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
    displaySmall: TextStyle(fontSize: 12),
  ),
);
