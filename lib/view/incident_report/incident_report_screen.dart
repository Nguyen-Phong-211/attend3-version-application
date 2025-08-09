import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncidentReportScreen extends StatefulWidget {
  const IncidentReportScreen({super.key});

  @override
  State<IncidentReportScreen> createState() => _IncidentReportScreenState();
}

class _IncidentReportScreenState extends State<IncidentReportScreen> {
  String selectedClass = 'Lập trình Flutter';
  String selectedIssue = 'Không nhận diện khuôn mặt';
  final TextEditingController descriptionController = TextEditingController();

  final List<String> classList = [
    'Lập trình Flutter',
    'Trí tuệ nhân tạo',
    'Cơ sở dữ liệu',
  ];

  final List<String> issueTypes = [
    'Không nhận diện khuôn mặt',
    'Bị điểm danh sai',
    'Ứng dụng bị lỗi',
    'Khác',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Báo cáo sự cố', style: TextStyles.titleScaffold),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSectionCard(
                  title: 'Thông tin lớp học',
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        child: const Icon(Icons.class_, color: AppColors.primary),
                      ),
                      title: Text('Lớp học', style: TextStyles.titleMedium),
                      subtitle: Text(selectedClass, style: TextStyles.bodyNormal),
                      trailing: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedClass,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: TextStyles.bodyNormal.copyWith(color: AppColors.black),
                          dropdownColor: AppColors.white,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedClass = value);
                            }
                          },
                          items: classList.map((value) {
                            IconData icon;
                            switch (value) {
                              case 'Lập trình Flutter':
                                icon = Icons.flutter_dash;
                                break;
                              case 'Trí tuệ nhân tạo':
                                icon = Icons.memory;
                                break;
                              case 'Cơ sở dữ liệu':
                                icon = Icons.storage;
                                break;
                              default:
                                icon = Icons.class_;
                            }

                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Icon(icon, size: 18, color: AppColors.primary),
                                  const SizedBox(width: 8),
                                  Text(value, style: TextStyles.bodyNormal.copyWith(fontWeight: FontWeight.w500)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Loại sự cố',
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: Colors.redAccent.withValues(alpha: 0.1),
                        child: const Icon(Icons.report_problem, color: Colors.redAccent),
                      ),
                      title: Text('Sự cố', style: TextStyles.titleMedium),
                      subtitle: Text(selectedIssue, style: TextStyles.bodyNormal),
                      trailing: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedIssue,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: TextStyles.bodyNormal.copyWith(color: AppColors.black),
                          dropdownColor: AppColors.white,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedIssue = value);
                            }
                          },
                          items: issueTypes.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  const Icon(Icons.bug_report, size: 18, color: Colors.redAccent),
                                  const SizedBox(width: 8),
                                  Text(value, style: TextStyles.bodyNormal.copyWith(fontWeight: FontWeight.w500)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Mô tả chi tiết',
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Nhập nội dung mô tả',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          // Màu viền khi bình thường
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
                          ),

                          // Màu viền khi focus
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.inputFocus, width: 2), // xanh đậm
                          ),

                          // Màu viền khi có lỗi
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.red, width: 2.0),
                          ),

                          // Màu viền khi có lỗi và đang focus
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Đã gửi báo cáo sự cố'),
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 4),
                      ),
                    );
                    descriptionController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Gửi báo cáo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.titleMedium.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: CardShadows.cardShadowList,
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
