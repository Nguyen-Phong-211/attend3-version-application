import 'package:flutter/material.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/border_radius.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color backgroundColor;
  final Color indicatorColor;
  final double opacity;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor = Colors.black,
    this.indicatorColor = Colors.blueAccent,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor.withValues(alpha: opacity),
            child: Center(
              child: ClipRRect(
                borderRadius: AppBorderRadius.radius16,
                child: Image.asset(
                  AppImages.imageIconLoading,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}