import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';

class DetailLeaveRequestInfoSection extends StatelessWidget {
  final ApprovalLeaveRequestEntity req;
  final DateFormat dateFormat;

  const DetailLeaveRequestInfoSection({super.key, required this.req, required this.dateFormat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Họ tên', req.name),
        _buildInfoRow('Lớp', req.studentClass),
        _buildInfoRow('Môn học', req.subject),
        _buildInfoRow('Thời gian', '${dateFormat.format(req.from)} - ${dateFormat.format(req.to)}'),
        _buildInfoRow('Lý do', req.reason),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 90, child: Text(label, style: TextStyles.bodyMedium)),
        Expanded(child: Text(value, style: TextStyles.bodyNormal)),
      ],
    ),
  );
}