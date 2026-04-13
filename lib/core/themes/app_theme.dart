import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  // ── Light Theme ────────────────────────────────────────
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: AppTypography.fontFamily,
        scaffoldBackgroundColor: AppColors.background,

        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.error,
          onPrimary: AppColors.textOnDark,
          onSecondary: AppColors.textOnDark,
          onSurface: AppColors.textPrimary,
          onError: AppColors.textOnDark,
        ),

        // ── AppBar ──────────────────────────────────────
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3,
          iconTheme: const IconThemeData(color: AppColors.textPrimary),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

        // ── Text ────────────────────────────────────────
        textTheme: TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          headlineLarge: AppTextStyles.h1,
          headlineMedium: AppTextStyles.h2,
          headlineSmall: AppTextStyles.h3,
          titleLarge: AppTextStyles.h4,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.caption,
        ),

        // ── ElevatedButton ──────────────────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textOnDark,
            minimumSize: const Size(double.infinity, AppSpacing.buttonHeightMd),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            textStyle: AppTextStyles.buttonPrimary,
            elevation: 0,
          ),
        ),

        // ── OutlinedButton ──────────────────────────────
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            minimumSize: const Size(double.infinity, AppSpacing.buttonHeightMd),
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            textStyle: AppTextStyles.buttonSecondary,
          ),
        ),

        // ── TextButton ──────────────────────────────────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.buttonSecondary,
          ),
        ),

        // ── InputDecoration ─────────────────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceVariant,
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm + AppSpacing.xs,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),

        // ── Card ────────────────────────────────────────
        cardTheme: CardThemeData(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            side: const BorderSide(color: AppColors.divider, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),

        // ── Chip ────────────────────────────────────────
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surfaceVariant,
          selectedColor: AppColors.primary,
          labelStyle: AppTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          side: BorderSide.none,
        ),

        // ── BottomNavigationBar ─────────────────────────
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textHint,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        // ── Divider ─────────────────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: 1,
          space: 1,
        ),
      );

  // ── Dark Theme ─────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: AppTypography.fontFamily,
        scaffoldBackgroundColor: AppColors.darkBackground,

        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.darkSurface,
          error: AppColors.error,
          onPrimary: AppColors.textOnDark,
          onSecondary: AppColors.textOnDark,
          onSurface: AppColors.textOnDark,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkSurface,
          foregroundColor: AppColors.textOnDark,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3.copyWith(color: AppColors.textOnDark),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        cardTheme: CardThemeData(
          color: AppColors.darkSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            side: const BorderSide(color: AppColors.darkSurfaceVariant, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.textOnDark,
            minimumSize: const Size(double.infinity, AppSpacing.buttonHeightMd),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            elevation: 0,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurfaceVariant,
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm + AppSpacing.xs,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
          ),
        ),
      );
}
