import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_icons.dart';

class ApprovalRequestCard extends StatelessWidget {
  final ApprovalLeaveRequestEntity request;
  final VoidCallback onTap; // open detail

  const ApprovalRequestCard({
    Key? key,
    required this.request,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM');
    final Color statusColor;
    switch (request.status) {
      case 'approved':
        statusColor = Colors.green;
        break;
      case 'rejected':
        statusColor = Colors.red;
        break;
      default: // pending
        statusColor = Colors.orange;
    }

    return Container(
      key: ValueKey(request.id),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border(left: BorderSide(color: statusColor, width: 6)),
        boxShadow: AppShadows.cardShadowGeneralList,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(request.name, style: TextStyles.titleCard),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              '${request.studentClass} • ${request.subject}',
              style: TextStyles.bodyNormal.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                AppIcon.iconCalendar,
                const SizedBox(width: 6),
                Text(
                  '${dateFormat.format(request.from)} - ${dateFormat.format(request.to)}',
                  style: const TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(request.reason, style: const TextStyle(fontSize: 10)),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: AppBorderRadius.radius8,
                border: Border.all(color: statusColor.withValues(alpha: 0.6)),
              ),
              child: Text(
                _getStatusLabel(request.status),
                style: TextStyles.bodySuperSmall.copyWith(color: statusColor),
              ),
            ),
          ],
        ),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: AppColors.backgroundPrimaryButton.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: AppIcon.iconChevronRight,
            onPressed: onTap,
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'approved':
        return 'Đã duyệt';
      case 'rejected':
        return 'Từ chối';
      default:
        return 'Chờ duyệt';
    }
  }
}