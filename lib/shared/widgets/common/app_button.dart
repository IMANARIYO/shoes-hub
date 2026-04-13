import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_spacing.dart';

enum AppButtonVariant { primary, secondary, outline, ghost }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;
  final double? height;
  final IconData? leadingIcon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = true,
    this.height,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final buttonHeight = height ?? AppSpacing.buttonHeightMd;
    final content = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: variant == AppButtonVariant.primary
                  ? Colors.white
                  : cs.primary,
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
            ],
          );

    final size = fullWidth
        ? const Size(double.infinity, 0)
        : Size(0, buttonHeight);

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, buttonHeight),
          ),
          child: content,
        );

      case AppButtonVariant.secondary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: cs.secondary,
            foregroundColor: Colors.white,
            minimumSize: Size(fullWidth ? double.infinity : 0, buttonHeight),
          ),
          child: content,
        );

      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(minimumSize: size),
          child: content,
        );

      case AppButtonVariant.ghost:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
    }
  }
}
