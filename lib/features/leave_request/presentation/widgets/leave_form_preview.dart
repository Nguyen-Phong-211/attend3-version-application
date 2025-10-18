import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_state.dart';

class LeaveFormPreview extends StatelessWidget {
  const LeaveFormPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveRequestBloc, LeaveRequestState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderRadius.radius12,
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: AppShadows.cardShadowList,
          ),
          child: Column(
            children: [
              Text(
                'CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                style: TextStyles.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Độc lập - Tự do - Hạnh phúc',
                style: TextStyles.titleSmall.copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 12),
              Text(
                'ĐƠN XIN NGHỈ PHÉP',
                style: TextStyles.titleMedium,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kính gửi: ${state.teacher ?? '....................................................'}", style: TextStyles.bodyNormal9),
                    const SizedBox(height: 8),
                    Text("Em là sinh viên học môn: ${state.subject ?? '....................................................'}", style: TextStyles.bodyNormal9),
                    const SizedBox(height: 8),
                    Text("Học kỳ: ........, Năm học: ....................", style: TextStyles.bodyNormal9),
                    const SizedBox(height: 8),
                    Text(
                      "Em làm đơn này xin phép được nghỉ từ ngày: "
                          "${state.fromDate != null ? "${state.fromDate!.day}/${state.fromDate!.month}/${state.fromDate!.year}" : "__/__/____"} "
                          "đến ngày: ${state.toDate != null ? "${state.toDate!.day}/${state.toDate!.month}/${state.toDate!.year}" : "__/__/____"}.",
                      style: TextStyles.bodyNormal9,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Lý do: ${state.reason.isNotEmpty == true ? state.reason : ".............................................................................."}",
                      style: TextStyles.bodyNormal9,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Em xin cam kết hoàn thành đầy đủ bài học và bài tập trong thời gian nghỉ. "
                          "Rất mong thầy/cô xem xét và chấp thuận.",
                      style: TextStyles.bodyNormal9,
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "TP.HCM, ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}",
                            style: TextStyles.bodyNormal9,
                          ),
                          const SizedBox(height: 8),
                          Text("Sinh viên ký tên", style: TextStyles.bodyNormal9.copyWith(fontStyle: FontStyle.italic)),
                          const SizedBox(height: 8),
                          Text("Nguyễn Văn A", style: TextStyles.bodyNormal9.copyWith(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}