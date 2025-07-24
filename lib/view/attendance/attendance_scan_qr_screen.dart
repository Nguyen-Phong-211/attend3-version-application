import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttendanceScanQrScreen extends StatefulWidget {
  final String subject;
  final String teacher;
  final String time;

  const AttendanceScanQrScreen({
    super.key,
    required this.subject,
    required this.teacher,
    required this.time,
  });

  @override
  State<AttendanceScanQrScreen> createState() => _AttendanceScanQrScreenState();
}

class _AttendanceScanQrScreenState extends State<AttendanceScanQrScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    final frontCamera = cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) return;

    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCameraInitialized
          ? Stack(
        children: [
          // Camera fullscreen
          CameraPreview(_cameraController!),

          // Overlay các phần còn lại
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
                decoration: const BoxDecoration(
                  gradient: AppLinearGradient.linearGradient,
                  borderRadius:
                  AppBorderRadius.borderRadiusBottomLeftRight24,
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
                      'Quét QR Môn học',
                      style: TextStyles.titleScaffold,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Thông tin môn học
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
            ],
          ),

          Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}