import 'package:flutter/material.dart';

/// Raw typography scale — font sizes, weights, line heights.
/// No colors here. Colors are applied in AppTextStyles.
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Inter';

  // ── Display ────────────────────────────────────────────
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.0,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.25,
  );

  // ── Headings ───────────────────────────────────────────
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // ── Body ───────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // ── Labels & Captions ──────────────────────────────────
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
  );

  // ── Buttons ────────────────────────────────────────────
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // ── Price ──────────────────────────────────────────────
  static const TextStyle price = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
  );
}
