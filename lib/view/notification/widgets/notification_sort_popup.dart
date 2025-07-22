import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'package:application/core/constants/app_colors.dart';

class NotificationSortPopup extends StatelessWidget {
  final SortOption selectedSort;
  final ValueChanged<SortOption> onChanged;

  const NotificationSortPopup({
    super.key,
    required this.selectedSort,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortOption>(
      icon: const FaIcon(FontAwesomeIcons.sort, color: AppColors.white),
      onSelected: onChanged,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: SortOption.newest,
          child: Text('Mới nhất'),
        ),
        PopupMenuItem(
          value: SortOption.oldest,
          child: Text('Cũ nhất'),
        ),
      ],
    );
  }
}