import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String? selectedSemester;
  String? selectedYear;
  String? selectedSubject;
  String? qrData;

  final TextEditingController radiusController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final List<String> semesters = ['Học kỳ 1', 'Học kỳ 2', 'Học kỳ hè'];
  final List<String> years = ['2022 - 2023', '2023 - 2024', '2024 - 2025'];
  final List<String> subjects = [
    'Lập trình Flutter',
    'Cấu trúc dữ liệu',
    'Toán rời rạc'
  ];

  @override
  void initState() {
    super.initState();
    radiusController.text = '5';
  }

  @override
  void dispose() {
    radiusController.dispose();
    noteController.dispose();
    super.dispose();
  }

  String encryptQrData(String plainText, String keyStr, String ivStr) {
    final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' ')); // 32 bytes
    final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' ')); // 16 bytes
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  String decryptQrData(String encryptedText, String keyStr, String ivStr) {
    final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
    final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' '));
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.decrypt64(encryptedText, iv: iv);
  }

  void _onGenerateQr() {
    if (selectedYear == null ||
        selectedSemester == null ||
        selectedSubject == null ||
        radiusController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Vui lòng nhập đầy đủ Năm học, Học kỳ, Môn học và Bán kính'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final note = noteController.text.trim();

    final plainText = '''
      Năm học: $selectedYear
      Học kỳ: $selectedSemester
      Môn học: $selectedSubject
      Bán kính: ${radiusController.text}m
      Ghi chú: ${note.isNotEmpty ? note : 'Không'}
    ''';

    const keyStr = 'mysecretkey1234567890';
    const ivStr = 'iv1234567890';

    final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
    final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' '));
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv).base64;

    setState(() {
      qrData = encrypted;
    });
  }

  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required String? value,
    required Function(String?) onChanged,
    required IconData iconData,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      icon: const FaIcon(
        FontAwesomeIcons.chevronDown,
        color: AppColors.black,
        size: 14,
      ),
      style: TextStyles.hintTextInput
          .copyWith(color: AppColors.black, fontFamily: 'Quicksand'),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(iconData, color: AppColors.primary, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
        ),
      ),
      dropdownColor: Colors.white,
      borderRadius: AppBorderRadius.radius12,
      onChanged: onChanged,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyles.titleInput.copyWith(color: AppColors.black),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildNumberField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (_) => setState(() {}),
      style: TextStyles.titleInput,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(icon, color: AppColors.primary, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: (_) => setState(() {}),
      style: TextStyles.titleInput,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(icon, color: AppColors.primary, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
        ),
      ),
    );
  }

  Widget _buildQrPreview() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: CardShadows.cardShadowList,
      ),
      child: Center(
        child: qrData != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QrImageView(
                    data: qrData!,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(height: 12),
                  Text(
                      (selectedSubject ?? '') + " - 190269088578263",
                      style:
                        TextStyles.titleInput.copyWith(color: AppColors.black),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.qrcode,
                      size: 80, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  Text(
                    'Chưa có mã QR — vui lòng nhập thông tin và bấm "Tạo QR Code"',
                    textAlign: TextAlign.center,
                    style: TextStyles.hintTextInput
                        .copyWith(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
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
                    child: const FaIcon(FontAwesomeIcons.chevronLeft,
                        color: AppColors.white),
                  ),
                  const SizedBox(width: 12),
                  Text('Tạo mã QR', style: TextStyles.titleScaffold),
                ],
              ),
            ),

            _buildQrPreview(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildDropdown(
                    hint: 'Chọn năm học *',
                    items: years,
                    value: selectedYear,
                    onChanged: (val) => setState(() => selectedYear = val),
                    iconData: FontAwesomeIcons.solidCalendar,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    hint: 'Chọn học kỳ *',
                    items: semesters,
                    value: selectedSemester,
                    onChanged: (val) => setState(() => selectedSemester = val),
                    iconData: FontAwesomeIcons.parachuteBox,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    hint: 'Chọn môn học *',
                    items: subjects,
                    value: selectedSubject,
                    onChanged: (val) => setState(() => selectedSubject = val),
                    iconData: FontAwesomeIcons.book,
                  ),
                  const SizedBox(height: 16),
                  _buildNumberField(
                    hint: 'Bán kính quét (m) *',
                    icon: FontAwesomeIcons.ruler,
                    controller: radiusController,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hint: 'Ghi chú (tuỳ chọn)',
                    icon: FontAwesomeIcons.noteSticky,
                    controller: noteController,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),

                  // Nút tạo QR
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _onGenerateQr,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppBorderRadius.radius12,
                        ),
                      ),
                      icon: const FaIcon(FontAwesomeIcons.qrcode,
                          color: Colors.white, size: 18),
                      label: Text(
                        'Tạo QR Code',
                        style: TextStyles.titleMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
