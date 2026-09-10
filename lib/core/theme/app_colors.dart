import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF00A878);
  static const Color primaryDark = Color(0xFF087F5B);
  static const Color primaryLight = Color(0xFFE8F8F2);

  // Light theme
  static const Color lightBackground = Color(0xFFFFFDF7);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF17201C);

  // Dark theme
  static const Color darkBackground = Color(0xFF101714);
  static const Color darkSurface = Color(0xFF18211D);
  static const Color darkText = Color(0xFFF5F7F6);

  // Common
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Semantic
  static const Color success = Color(0xFF2E9B6F);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFF4B400);
  static const Color info = Color(0xFF2196F3);

  // Neutral
  static const Color grey = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFE5E7EB);
  static const Color darkGrey = Color(0xFF9CA3AF);
  static const Color lightDivider = Color(0xFFE8E8E8);
  static const Color darkDivider = Color(0xFF29332F);
}
