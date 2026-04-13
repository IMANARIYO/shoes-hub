import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_colors.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const AppLoader({super.key, this.color, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}
