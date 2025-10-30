import 'package:application/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/leave_request/presentation/screens/leave_request_detail_screen.dart';
import 'approval_request_card.dart';

class ApprovalRequestList extends StatelessWidget {
  final List<ApprovalLeaveRequestEntity> requests;
  final void Function(String id) onOpenDetail;

  const ApprovalRequestList({
    Key? key,
    required this.requests,
    required this.onOpenDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.imageIconEmptyData, width: 60, height: 60, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              AppLabel.titleReturnEmptyData,
              style: TextStyles.titleSmall.copyWith(color: Colors.grey.shade400,),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // List have data
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // parent scrollable
        shrinkWrap: true,
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final r = requests[index];
          return ApprovalRequestCard(
            request: r,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ApprovedLeaveRequestDetailScreen(request: r),
                ),
              );
            },
          );
        },
      ),
    );
  }
}