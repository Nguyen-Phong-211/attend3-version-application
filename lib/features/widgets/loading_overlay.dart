import 'package:flutter/material.dart';
import 'package:application/core/constants/border_radius.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color backgroundColor;
  final Color indicatorColor;
  final double opacity;
  final String message;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor = Colors.black,
    this.indicatorColor = Colors.blueAccent,
    this.opacity = 0.2,
    this.message = 'Đang xử lý. Vui lòng đợi...',
  });

  @override
  Widget build(BuildContext context) {
    // Lấy font từ theme hiện tại
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: backgroundColor.withValues(alpha: opacity),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppBorderRadius.radius16,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        message,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 10,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}