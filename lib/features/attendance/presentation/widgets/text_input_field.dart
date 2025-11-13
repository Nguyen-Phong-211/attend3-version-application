import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class TextInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const TextInputField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.maxLines = 6,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      style: TextStyles.titleValueInput,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(icon, color: AppColors.primary, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
        ),
      ),
    );
  }
}