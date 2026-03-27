import 'package:flutter/material.dart';

class AppColors {
  // Primary Gradient
  static const Color primaryStart = Color(0xFF008332);
  static const Color primaryEnd = Color(0xFF50E36D);

  // Backgrounds
  static const Color scaffoldBackground = Color(0xFFF8FBFE);
  static const Color cardBackground = Color(0xFFD1ECFF);
  static const Color resultCardBackground = Colors.white;
  static const Color savingsCardBackground = Color(0xFFE8FAF1);

  // Text
  static const Color textPrimary = Color(0xFF032D3F);
  static const Color textSecondary = Color(0xFF5A7F8F);
  static const Color textTertiary = Color(0xFF90A4AE);

  // Others
  static const Color gasolineIcon = Color(0xFF7A98FF);
  static const Color ethanolIcon = Color(0xFF50E36D);
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color progressBarBase = Color(0xFFD1ECFF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryStart, primaryEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
