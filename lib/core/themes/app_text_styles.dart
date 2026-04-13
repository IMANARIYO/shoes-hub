import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Typography + color combined.
/// Use these in your widgets — never raw TextStyle.
///
/// Usage:
///   Text('Shoes Hub', style: AppTextStyles.h1)
///   Text('\$120', style: AppTextStyles.price)
class AppTextStyles {
  AppTextStyles._();

  // ── Display ────────────────────────────────────────────
  static final TextStyle displayLarge = AppTypography.displayLarge.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle displayMedium = AppTypography.displayMedium.copyWith(
    color: AppColors.textPrimary,
  );

  // ── Headings ───────────────────────────────────────────
  static final TextStyle h1 = AppTypography.h1.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle h2 = AppTypography.h2.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle h3 = AppTypography.h3.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle h4 = AppTypography.h4.copyWith(
    color: AppColors.textPrimary,
  );

  // ── Body ───────────────────────────────────────────────
  static final TextStyle bodyLarge = AppTypography.bodyLarge.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle bodyMedium = AppTypography.bodyMedium.copyWith(
    color: AppColors.textSecondary,
  );

  static final TextStyle bodySmall = AppTypography.bodySmall.copyWith(
    color: AppColors.textSecondary,
  );

  // ── Labels ─────────────────────────────────────────────
  static final TextStyle labelLarge = AppTypography.labelLarge.copyWith(
    color: AppColors.textPrimary,
  );

  static final TextStyle labelMedium = AppTypography.labelMedium.copyWith(
    color: AppColors.textSecondary,
  );

  static final TextStyle caption = AppTypography.caption.copyWith(
    color: AppColors.textHint,
  );

  // ── Buttons ────────────────────────────────────────────
  static final TextStyle buttonPrimary = AppTypography.button.copyWith(
    color: AppColors.textOnDark,
  );

  static final TextStyle buttonSecondary = AppTypography.button.copyWith(
    color: AppColors.primary,
  );

  // ── Price ──────────────────────────────────────────────
  static final TextStyle price = AppTypography.price.copyWith(
    color: AppColors.accent,
  );

  static final TextStyle priceStrikethrough = AppTypography.bodyMedium.copyWith(
    color: AppColors.textHint,
    decoration: TextDecoration.lineThrough,
  );

  // ── On dark backgrounds ────────────────────────────────
  static final TextStyle onDarkTitle = AppTypography.h2.copyWith(
    color: AppColors.textOnDark,
  );

  static final TextStyle onDarkBody = AppTypography.bodyMedium.copyWith(
    color: AppColors.textOnDark.withOpacity(0.85),
  );
}
