import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';

class DetailLeaveRequestStatus extends StatelessWidget {
  final String status;
  const DetailLeaveRequestStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case 'approved':
        color = Colors.green;
        text = 'Đã duyệt';
        break;
      case 'rejected':
        color = Colors.red;
        text = 'Từ chối';
        break;
      default:
        color = Colors.orange;
        text = 'Chưa duyệt';
    }

    return Row(
      children: [
        const Text('Trạng thái: ', style: TextStyles.bodyMedium),
        Text(text, style: TextStyles.bodyNormal.copyWith(color: color)),
      ],
    );
  }
}