import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color forestGreen = Color(0xFF14532D);
  static const Color natureGreen = Color(0xFF22C55E);
  static const Color beigeTere = Color(0xFFD6C3A5);
  static const Color gold = Color(0xFFF59E0B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color background = Color(0xFFFAFAF5);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE5E5E0);

  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);

  static const Color success = Color(0xFF16A34A);
  static const Color error = Color(0xFFDC2626);
  static const Color warning = Color(0xFFD97706);

  static const Color shadow = Color(0x0D000000);
  static const Color divider = Color(0x0A000000);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [forestGreen, Color(0xFF166534)],
  );

  static const LinearGradient subtleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF0FDF4), Color(0xFFECFDF5)],
  );

  static const LinearGradient greenToGoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [forestGreen, Color(0xFF166534), natureGreen],
  );
}
