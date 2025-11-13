import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class NumberInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const NumberInputField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      style: TextStyles.titleValueInput,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(icon, color: AppColors.primary, size: 15),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        filled: true,
        fillColor: Colors.white,
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