import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_colors.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_spacing.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_text_styles.dart';

/// 60-30-10 button variants:
///
///  [cta]      → 10% accent background  — primary call-to-action
///               "Add to Cart", "Buy Now", "Checkout"
///
///  [primary]  → 30% deep navy background — structural action
///               "Save", "Confirm", "Submit"
///
///  [outline]  → 30% primary border, transparent bg — secondary action
///               "View Details", "Cancel", "Back"
///
///  [ghost]    → no bg, no border — tertiary / inline action
///               "See all", "Skip", "Learn more"
enum AppButtonVariant { cta, primary, outline, ghost }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;
  final double? height;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.cta,
    this.isLoading = false,
    this.fullWidth = true,
    this.height,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? AppSpacing.buttonHeightMd;

    final child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: variant == AppButtonVariant.outline ||
                      variant == AppButtonVariant.ghost
                  ? AppColors.primary
                  : AppColors.textOnDark,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                Icon(leadingIcon, size: AppSpacing.iconSm),
                const SizedBox(width: AppSpacing.xs),
              ],
              Text(label),
              if (trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Icon(trailingIcon, size: AppSpacing.iconSm),
              ],
            ],
          );

    final minSize = Size(fullWidth ? double.infinity : 0, buttonHeight);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    );

    switch (variant) {
      // 10% accent — use for the ONE main CTA on a screen
      case AppButtonVariant.cta:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,     // 10%
            foregroundColor: AppColors.textOnDark,
            minimumSize: minSize,
            shape: shape,
            textStyle: AppTextStyles.buttonPrimary,
            elevation: 0,
          ),
          child: child,
        );

      // 30% primary — use for structural / confirmatory actions
      case AppButtonVariant.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,    // 30%
            foregroundColor: AppColors.textOnDark,
            minimumSize: minSize,
            shape: shape,
            textStyle: AppTextStyles.buttonPrimary,
            elevation: 0,
          ),
          child: child,
        );

      // 30% primary border — secondary / alternative action
      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,    // 30%
            minimumSize: minSize,
            side: const BorderSide(
              color: AppColors.primary,            // 30%
              width: 1.5,
            ),
            shape: shape,
            textStyle: AppTextStyles.buttonSecondary,
          ),
          child: child,
        );

      // No color — tertiary / inline action
      case AppButtonVariant.ghost:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,    // 30%
            minimumSize: minSize,
            textStyle: AppTextStyles.buttonSecondary,
          ),
          child: child,
        );
    }
  }
}
