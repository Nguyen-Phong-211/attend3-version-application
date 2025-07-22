import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class AttendanceByCameraScreen extends StatefulWidget {
  final String subject;
  final String teacher;
  final String time;

  const AttendanceByCameraScreen({
    super.key,
    required this.subject,
    required this.teacher,
    required this.time,
  });

  @override
  State<AttendanceByCameraScreen> createState() => _AttendanceByCameraScreenState();
}

class _AttendanceByCameraScreenState extends State<AttendanceByCameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _openCamera() async {
    final photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _capturedImage = photo;
      });
      // TODO: Gửi ảnh tới server để điểm danh ở đây
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
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
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Điểm danh bằng camera',
                  style: TextStyles.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // INFO BLOCK
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Môn học: ${widget.subject}', style: TextStyles.titleMedium),
                Text('Giảng viên: ${widget.teacher}', style: TextStyles.bodySmall),
                Text('Thời gian: ${widget.time}', style: TextStyles.bodySmall),
                Text('Vui lòng liên hệ giảng viên giảng viên trong trường họp không điểm danh được', style: TextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),

          const SizedBox(height: 16),

          // IMAGE / CAMERA RESULT
          Expanded(
            child: Center(
              child: _capturedImage != null
                  ? Image.file(
                File(_capturedImage!.path),
                height: 300,
              )
                  : const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}