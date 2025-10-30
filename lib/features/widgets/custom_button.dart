import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    this.backgroundColor = const Color(0xFFE0F7FA),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.08),
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Image.asset(iconPath, height: 30, width: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyles.bodySuperSmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
