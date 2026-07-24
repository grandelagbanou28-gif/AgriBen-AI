import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color forestGreen = Color(0xFF1B5E20);
  static const Color natureGreen = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF81C784);
  static const Color paleGreen = Color(0xFFC8E6C9);
  static const Color beige = Color(0xFFF5F0E6);
  static const Color warmBeige = Color(0xFFEDE6D6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color orangeAlert = Color(0xFFFF6D00);
  static const Color lightOrange = Color(0xFFFFF3E0);
  static const Color darkText = Color(0xFF1A1A2E);
  static const Color mediumText = Color(0xFF4A4A5A);
  static const Color lightText = Color(0xFF8E8E9E);
  static const Color cardShadow = Color(0x1A000000);
  static const Color divider = Color(0x0D000000);
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color warningYellow = Color(0xFFF9A825);
  static const Color errorRed = Color(0xFFC62828);
  static const Color background = Color(0xFFF8F6F0);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [forestGreen, natureGreen],
  );

  static const LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE8F5E9), Color(0xFFF1F8E9)],
  );
}
