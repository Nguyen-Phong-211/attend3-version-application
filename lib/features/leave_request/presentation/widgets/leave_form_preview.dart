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
    final today = DateTime.now();
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
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // ---------- HEADER ----------
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("TRƯỜNG ĐẠI HỌC CÔNG NGHIỆP TPHCM",
                                      style: TextStyles.titleSuperSmall),
                                  Text(
                                      "state.department" ??
                                          '...........................................',
                                      style: TextStyles.titleSuperSmall),
                                  const Divider(thickness: 1, height: 12),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text("CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM",
                                      style: TextStyles.titleSuperSmall),
                                  Text("Độc lập - Tự do - Hạnh phúc",
                                      style: TextStyles.titleSuperSmallItalic),
                                  Divider(thickness: 1, height: 12),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // ---------- LOCATION & DATE ----------
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "TP. Hồ Chí Minh, ngày ${today.day} tháng ${today.month} năm ${today.year}",
                            style: TextStyles.bodyNormal8,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ---------- TITLE ----------
                        const Center(
                          child: Text(
                            "ĐƠN XIN NGHỈ HỌC",
                            style: TextStyles.titleMedium,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ---------- RECIPIENT ----------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kính gửi: Giảng viên phụ trách môn ${state.subject ?? '....................................................'}",
                              style: TextStyles.bodyNormal8,
                            ),
                            Text(
                              "Thầy/Cô: ${state.teacher ?? '....................................................'}",
                              style: TextStyles.bodyNormal8,
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // ---------- STUDENT INFO TABLE ----------
                        Table(
                          columnWidths: const {
                            0: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Họ và tên:",
                                    style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.fullName" ?? '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Mã số sinh viên:",
                                    style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.studentCode" ??
                                        '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Năm học:",
                                    style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.year" ?? '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Học kỳ:",
                                    style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.semester" ?? '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child:
                                    Text("Lớp:", style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.className" ??
                                        '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Khoa:",
                                    style: TextStyles.bodyNormal8),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                    "state.department" ??
                                        '.....................',
                                    style: TextStyles.bodyNormal8),
                              ),
                            ]),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // ---------- CONTENT ----------
                        Text(
                          "Em làm đơn này kính xin phép Thầy/Cô cho em được nghỉ buổi học môn ${state.subject ?? '.....................'}.",
                          style: TextStyles.bodyNormal8,
                        ),
                        Text(
                          "Thời gian xin nghỉ: "
                          "${state.fromDate != null ? "${state.fromDate!.day}/${state.fromDate!.month}/${state.fromDate!.year}" : "__/__/____"} "
                          "đến hết ngày: ${state.toDate != null ? "${state.toDate!.day}/${state.toDate!.month}/${state.toDate!.year}" : "__/__/____"}.",
                          style: TextStyles.bodyNormal8,
                        ),
                        Text(
                            "Lý do: ${state.reason.isNotEmpty == true ? state.reason : '...................................................'}",
                            style: TextStyles.bodyNormal8),
                        const SizedBox(height: 8),
                        const Text(
                          "Em cam kết sẽ tự học bù, hoàn thành đầy đủ các bài tập và nội dung học tập trong thời gian nghỉ. "
                          "Kính mong Thầy/Cô xem xét và chấp thuận.",
                          style: TextStyles.bodyNormal8,
                        ),
                        const SizedBox(height: 8),
                        const Text("Em xin chân thành cảm ơn!",
                            style: TextStyles.bodyNormal8),

                        const SizedBox(height: 24),

                        // ---------- SIGNATURE ----------
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("NGƯỜI LÀM ĐƠN",
                                  style: TextStyles.titleSmall),
                              const Text("(Ký và ghi rõ họ tên)",
                                  style: TextStyles.bodyNormalItalic8),
                              const SizedBox(height: 16),
                              Text("state.fullName" ?? '.....................',
                                  style: TextStyles.titleSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}