import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/constants/app_constants.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_colors.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_spacing.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_text_styles.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLogo;
  final bool showBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const AppAppBar({
    super.key,
    this.title,
    this.showLogo = false,
    this.showBack = true,
    this.actions,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: showBack,
      title: showLogo
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.storefront, color: AppColors.accent, size: 26),
                const SizedBox(width: AppSpacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppConstants.appName, style: AppTextStyles.h4),
                    Text(
                      AppConstants.appTagline,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ],
            )
          : title != null
              ? Text(title!, style: AppTextStyles.h3)
              : null,
      actions: actions,
      bottom: bottom,
    );
  }
}
