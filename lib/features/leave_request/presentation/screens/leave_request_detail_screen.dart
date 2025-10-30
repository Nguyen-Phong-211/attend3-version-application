import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_header.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_info_section.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_attachments.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_approval_form.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_action_button.dart';
import 'package:application/features/leave_request/presentation/widgets/detail_leave_request_status.dart';

class ApprovedLeaveRequestDetailScreen extends StatefulWidget {
  final ApprovalLeaveRequestEntity request;

  const ApprovedLeaveRequestDetailScreen({super.key, required this.request});

  @override
  State<ApprovedLeaveRequestDetailScreen> createState() => _ApprovedLeaveRequestDetailScreenState();
}

class _ApprovedLeaveRequestDetailScreenState extends State<ApprovedLeaveRequestDetailScreen> {
  String? _approvalStatus;
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final req = widget.request;
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailLeaveRequestHeader(
              title: AppLabel.titleScaffoldDetailLeaveRequest,
              onBack: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailLeaveRequestInfoSection(req: req, dateFormat: dateFormat),
                  const SizedBox(height: 16),
                  const Text('Minh chứng', style: TextStyles.bodyMedium),
                  const SizedBox(height: 8),
                  const DetailLeaveRequestAttachments(),
                  const SizedBox(height: 20),
                  DetailLeaveRequestStatus(status: req.status),
                  if (req.status == 'pending') ...[
                    const SizedBox(height: 24),
                    DetailLeaveRequestApprovalForm(
                      approvalStatus: _approvalStatus,
                      reasonController: _reasonController,
                      onChanged: (v) => setState(() => _approvalStatus = v),
                    ),
                    const SizedBox(height: 32),
                    DetailLeaveRequestActionButton(
                      status: req.status,
                      approvalStatus: _approvalStatus,
                      reasonController: _reasonController,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}