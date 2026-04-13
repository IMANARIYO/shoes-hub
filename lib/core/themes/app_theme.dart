import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// ════════════════════════════════════════════════════════
///  AppTheme — enforces 60-30-10 rule across all components
///
///  60% AppColors.background / surface   → dominant neutral
///  30% AppColors.primary deep navy      → structure & nav
///  10% AppColors.accent red-pink        → CTA & highlights
/// ════════════════════════════════════════════════════════
class AppTheme {
  AppTheme._();

  // ════════════════════════════════════════════════════════
  //  LIGHT THEME
  // ════════════════════════════════════════════════════════
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: AppTypography.fontFamily,

        // 60% — scaffold is always the dominant neutral
        scaffoldBackgroundColor: AppColors.background,

        colorScheme: const ColorScheme.light(
          // 30% — primary is the structural color
          primary: AppColors.primary,
          onPrimary: AppColors.textOnDark,
          // 10% — secondary slot holds the accent (CTA)
          secondary: AppColors.accent,
          onSecondary: AppColors.textOnDark,
          // 60% — surface is white cards/sheets
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          error: AppColors.error,
          onError: AppColors.textOnDark,
        ),

        // ── AppBar → 30% primary ────────────────────────
        // AppBar uses surface (60%) so it blends with the page,
        // with primary (30%) text/icons for structure.
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.surface,       // 60%
          foregroundColor: AppColors.primary,        // 30%
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3,          // 30% text
          iconTheme: const IconThemeData(
            color: AppColors.primary,                // 30%
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

        // ── Text ────────────────────────────────────────
        textTheme: TextTheme(
          displayLarge:  AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          headlineLarge: AppTextStyles.h1,
          headlineMedium: AppTextStyles.h2,
          headlineSmall: AppTextStyles.h3,
          titleLarge:    AppTextStyles.h4,
          bodyLarge:     AppTextStyles.bodyLarge,
          bodyMedium:    AppTextStyles.bodyMedium,
          bodySmall:     AppTextStyles.bodySmall,
          labelLarge:    AppTextStyles.labelLarge,
          labelMedium:   AppTextStyles.labelMedium,
          labelSmall:    AppTextStyles.caption,
        ),

        // ── ElevatedButton → 10% accent (CTA only) ──────
        // Primary CTA buttons are ALWAYS accent (10%).
        // This is the most important 60-30-10 enforcement.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,       // 10% — CTA
            foregroundColor: AppColors.textOnDark,
            minimumSize: const Size(
              double.infinity,
              AppSpacing.buttonHeightMd,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            textStyle: AppTextStyles.buttonPrimary,
            elevation: 0,
          ),
        ),

        // ── OutlinedButton → 30% primary (secondary action)
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,      // 30%
            minimumSize: const Size(
              double.infinity,
              AppSpacing.buttonHeightMd,
            ),
            side: const BorderSide(
              color: AppColors.primary,              // 30%
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            textStyle: AppTextStyles.buttonSecondary,
          ),
        ),

        // ── TextButton → 30% primary (ghost action) ─────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,      // 30%
            textStyle: AppTextStyles.buttonSecondary,
          ),
        ),

        // ── Input → 60% surface fill ─────────────────────
        // Inputs sit on the dominant 60% surface.
        // Focus ring uses 30% primary for structure.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceVariant,       // 60%
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
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
            borderSide: const BorderSide(
              color: AppColors.primary,              // 30% focus ring
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1.5,
            ),
          ),
        ),

        // ── Card → 60% surface ───────────────────────────
        cardTheme: CardThemeData(
          color: AppColors.surface,                  // 60%
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            side: const BorderSide(
              color: AppColors.divider,              // 60% border
              width: 1,
            ),
          ),
          margin: EdgeInsets.zero,
        ),

        // ── Chip → 60% bg, 30% selected ─────────────────
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surfaceVariant, // 60%
          selectedColor: AppColors.primary,          // 30%
          labelStyle: AppTextStyles.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          side: BorderSide.none,
        ),

        // ── BottomNav → 60% bg, 30% selected, 10% badge ─
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,        // 60%
          selectedItemColor: AppColors.primary,      // 30%
          unselectedItemColor: AppColors.textHint,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        // ── NavigationBar (Material 3) ───────────────────
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.surface,        // 60%
          indicatorColor: AppColors.primary.withOpacity(0.12), // 30% tint
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.primary); // 30%
            }
            return const IconThemeData(color: AppColors.textHint);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppTextStyles.labelMedium.copyWith(
                color: AppColors.primary,            // 30%
              );
            }
            return AppTextStyles.labelMedium;
          }),
        ),

        // ── FloatingActionButton → 10% accent ───────────
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.accent,         // 10%
          foregroundColor: AppColors.textOnDark,
          elevation: 2,
        ),

        // ── Badge → 10% accent ───────────────────────────
        badgeTheme: const BadgeThemeData(
          backgroundColor: AppColors.accent,         // 10%
          textColor: AppColors.textOnDark,
        ),

        // ── Divider → 60% neutral ────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,                  // 60%
          thickness: 1,
          space: 1,
        ),

        // ── ProgressIndicator → 10% accent ──────────────
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.accent,                   // 10%
        ),

        // ── Switch / Checkbox / Radio → 10% accent ──────
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.accent;               // 10%
            }
            return AppColors.textHint;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.accent.withOpacity(0.3); // 10% tint
            }
            return AppColors.divider;
          }),
        ),

        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.accent;               // 10%
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(AppColors.textOnDark),
          side: const BorderSide(color: AppColors.primary, width: 1.5), // 30%
        ),
      );

  // ════════════════════════════════════════════════════════
  //  DARK THEME  (same 60-30-10, inverted surfaces)
  //
  //  60% → darkBackground / darkSurface
  //  30% → light text / icons (darkPrimary)
  //  10% → accent stays the same red-pink
  // ════════════════════════════════════════════════════════
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: AppTypography.fontFamily,

        scaffoldBackgroundColor: AppColors.darkBackground, // 60%

        colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimary,            // 30% light text/icons
          onPrimary: AppColors.darkBackground,
          secondary: AppColors.accent,               // 10% CTA
          onSecondary: AppColors.textOnDark,
          surface: AppColors.darkSurface,            // 60%
          onSurface: AppColors.textOnDark,
          error: AppColors.error,
          onError: AppColors.textOnDark,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkSurface,    // 60%
          foregroundColor: AppColors.textOnDark,     // 30%
          elevation: 0,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3.copyWith(
            color: AppColors.textOnDark,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,       // 10% CTA
            foregroundColor: AppColors.textOnDark,
            minimumSize: const Size(
              double.infinity,
              AppSpacing.buttonHeightMd,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            elevation: 0,
          ),
        ),

        cardTheme: CardThemeData(
          color: AppColors.darkSurface,              // 60%
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            side: const BorderSide(
              color: AppColors.darkSurfaceVariant,   // 60%
              width: 1,
            ),
          ),
          margin: EdgeInsets.zero,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurfaceVariant,   // 60%
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
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
            borderSide: const BorderSide(
              color: AppColors.accent,               // 10% focus in dark
              width: 1.5,
            ),
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.accent,         // 10%
          foregroundColor: AppColors.textOnDark,
        ),

        badgeTheme: const BadgeThemeData(
          backgroundColor: AppColors.accent,         // 10%
          textColor: AppColors.textOnDark,
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkSurface,    // 60%
          selectedItemColor: AppColors.accent,       // 10% in dark
          unselectedItemColor: AppColors.textHint,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.accent,                   // 10%
        ),
      );
}
