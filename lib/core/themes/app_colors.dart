import 'package:flutter/material.dart';

/// Single source of truth for all colors in Shoes Hub.
/// Change a value here → entire app updates.
class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────
  static const primary = Color(0xFF1A1A2E);       // deep navy — main brand
  static const primaryLight = Color(0xFF16213E);  // slightly lighter navy
  static const accent = Color(0xFFE94560);        // red-pink — CTA / highlights

  // ── Neutrals ───────────────────────────────────────────
  static const background = Color(0xFFF5F6FA);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceVariant = Color(0xFFF0F0F5);
  static const divider = Color(0xFFE0E0E0);

  // ── Text ───────────────────────────────────────────────
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF6B7280);
  static const textHint = Color(0xFFADB5BD);
  static const textOnDark = Color(0xFFFFFFFF);

  // ── Semantic ───────────────────────────────────────────
  static const success = Color(0xFF27AE60);
  static const warning = Color(0xFFF2994A);
  static const error = Color(0xFFEB5757);
  static const info = Color(0xFF2F80ED);

  // ── Dark theme surfaces ────────────────────────────────
  static const darkBackground = Color(0xFF0F0F1A);
  static const darkSurface = Color(0xFF1A1A2E);
  static const darkSurfaceVariant = Color(0xFF16213E);
}
