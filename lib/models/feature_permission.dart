import 'package:flutter/cupertino.dart';

class FeaturePermission {
  final String id;
  final String label;
  final String iconPath;
  final Color backgroundColor;
  final Widget Function(BuildContext context) destination;
  final List<String> roles; // e.g. ['student', 'lecturer', 'admin']

  const FeaturePermission({
    required this.id,
    required this.label,
    required this.iconPath,
    required this.backgroundColor,
    required this.destination,
    required this.roles,
  });
}