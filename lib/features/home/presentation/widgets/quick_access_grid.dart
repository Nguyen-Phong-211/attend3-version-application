import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/features/widgets/custom_button.dart';
import 'package:application/features/home/presentation/screen/all_quick_access.dart';
import 'package:application/features/leave_request/presentation/screens/approval_leave_quest_screen.dart';
import 'package:application/features/leave_request/presentation/screens/leave_screen.dart';
import 'package:application/features/statistics/presentation/screen/statistic_student_screen.dart';
import 'package:application/features/schedule/presentation/screen/schedule_study_screen.dart';
import 'package:application/features/schedule/presentation/screen/schedule_teaching_screen.dart';

import 'package:application/view/contact_lecturer/contact_lecturer_screen.dart';
import 'package:application/view/qrcode/qrcode_screen.dart';
import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLabel.titleSectionHomeTaskToday, style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllQuickAccessScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppLabel.titleViewAll,
                      style: TextStyles.titleSmall.copyWith(color: AppColors.textPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  // role student
                  CustomButton(
                      label: AppLabel.titleAttendanceQRCode,
                      iconPath: AppImages.imageIconAttendanceQRCode,
                      backgroundColor: AppColors.backgroundButtonAttendanceQRCode,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AttendanceByQrcodeScreen()
                          ),
                        );
                      }),
                  CustomButton(
                      label: AppLabel.titleRegisterFace,
                      iconPath: AppImages.imageIconRegisterFace,
                      backgroundColor: AppColors.backgroundButtonRegisterFace,
                      onTap: () {}),
                  CustomButton(
                      label: AppLabel.titleLeaveRequest,
                      iconPath: AppImages.imageIconLeaveRequest,
                      backgroundColor: AppColors.backgroundButtonLeaveRequest,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LeaveScreen()
                          ),
                        );
                      }),
                  // role lecturer
                  CustomButton(
                      label: AppLabel.titleCreatedQRCode,
                      iconPath: AppImages.imageIconCreateQRCode,
                      backgroundColor: AppColors.backgroundButtonCreateQRCode,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QrCodeScreen()
                          ),
                        );
                      }),
                  CustomButton(
                      label: AppLabel.titleApprovedLeave,
                      iconPath: AppImages.imageIconApprovedLeave,
                      backgroundColor: AppColors.backgroundButtonApprovedLeave,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ApprovalLeaveRequestScreen()
                          ),
                        );
                      }),
                  CustomButton(
                      label: AppLabel.titleScheduleTeaching,
                      iconPath: AppImages.imageIconScheduleTeaching,
                      backgroundColor: AppColors.backgroundButtonScheduleTeaching,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScheduleTeachingScreen()
                          ),
                        );
                      }),
                  CustomButton(
                      label: AppLabel.titleStaticForStudent,
                      iconPath: AppImages.imageIconDashboardForStudent,
                      backgroundColor: AppColors.backgroundButtonDashboardForStudent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StatisticStudentScreen()
                          ),
                        );
                      }),
                  // all role
                  CustomButton(
                      label: AppLabel.titleContactLecturer,
                      iconPath: AppImages.imageIconContactLecturer,
                      backgroundColor: AppColors.backgroundButtonContactLecturer,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactLecturerScreen()
                          ),
                        );
                      }),
                  CustomButton(
                      label: AppLabel.titleScheduleLearning,
                      iconPath: AppImages.imageIconScheduleLearning,
                      backgroundColor: AppColors.backgroundButtonScheduleLearning,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScheduleStudyScreen()
                          ),
                        );
                      }),
                ],
              )
            ],
          ),
        )
    );
  }
}