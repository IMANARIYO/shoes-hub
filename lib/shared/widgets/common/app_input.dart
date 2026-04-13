import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_spacing.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_text_styles.dart';

class AppInput extends StatelessWidget {
  final String hint;
  final String? label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final bool readOnly;
  final int maxLines;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  const AppInput({
    super.key,
    required this.hint,
    this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixWidget,
    this.readOnly = false,
    this.maxLines = 1,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.labelLarge),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          readOnly: readOnly,
          maxLines: maxLines,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          style: AppTextStyles.bodyLarge,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, size: AppSpacing.iconMd)
                : null,
            suffix: suffixWidget,
          ),
        ),
      ],
    );
  }
}
