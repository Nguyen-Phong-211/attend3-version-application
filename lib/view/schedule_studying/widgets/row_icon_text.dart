import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';

class RowIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.iconColor),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
      ],
    );
  }
}