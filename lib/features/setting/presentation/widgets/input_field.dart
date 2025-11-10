import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isObscure;
  final bool disabled;
  const InputField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isObscure = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final field = SizedBox(
      height: 47,
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        readOnly: disabled,
        style: TextStyles.titleValueInput,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          hintText: hint,
          hintStyle: TextStyles.hintTextInput,
          prefixIcon: Icon(icon, color: AppColors.primary, size: 16),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: BorderSide(color: AppColors.inputFocus, width: 1.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
        ),
      ),
    );

    return disabled
        ? IgnorePointer(child: Opacity(opacity: 0.7, child: field))
        : field;
  }
}