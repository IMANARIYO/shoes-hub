import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_spacing.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? color;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppSpacing.radiusLg;
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.md),
          child: child,
        ),
      ),
    );
  }
}
