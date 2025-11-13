// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:application/core/constants/app_colors.dart';
// import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
// import 'package:application/core/constants/border_radius.dart';
// import 'package:application/core/theme/text_styles.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:application/core/constants/box_shadow_constants.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:application/features/attendance/presentation/widgets/dropdown_filed.dart';
// import 'package:application/features/widgets/scaffold_messages.dart';
// import 'package:application/features/widgets/primary_action_button.dart';
// import 'package:heroicons/heroicons.dart';
// import 'dart:math';
//
// class CreateQrcodeScreen extends StatefulWidget {
//   const CreateQrcodeScreen({super.key});
//
//   @override
//   State<CreateQrcodeScreen> createState() => _CreateQrCodeScreenState();
// }
//
// class _CreateQrCodeScreenState extends State<CreateQrcodeScreen> {
//   String? selectedClass;
//   String? selectedSubject;
//   String? qrData;
//
//   String generateCustomCode() {
//     final now = DateTime.now();
//     final datePart =
//         "${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}${now.year}${now.hour.toString().padLeft(2,'0')}${now.minute.toString().padLeft(2,'0')}${now.second.toString().padLeft(2,'0')}";
//
//     const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//     final rand = Random();
//     final randomPart = List.generate(7, (_) => chars[rand.nextInt(chars.length)]).join();
//
//     return "QR$datePart$randomPart";
//   }
//
//   final TextEditingController radiusController = TextEditingController();
//   final TextEditingController noteController = TextEditingController();
//
//   final List<String> classes = ['CH01', 'CH02', 'CH03'];
//   final List<String> subjects = [
//     'Lập trình Flutter',
//     'Cấu trúc dữ liệu',
//     'Toán rời rạc'
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     radiusController.text = '5';
//   }
//
//   @override
//   void dispose() {
//     radiusController.dispose();
//     noteController.dispose();
//     super.dispose();
//   }
//
//   String encryptQrData(String plainText, String keyStr, String ivStr) {
//     final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' ')); // 32 bytes
//     final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' ')); // 16 bytes
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     return encrypter.encrypt(plainText, iv: iv).base64;
//   }
//
//   String decryptQrData(String encryptedText, String keyStr, String ivStr) {
//     final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
//     final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' '));
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     return encrypter.decrypt64(encryptedText, iv: iv);
//   }
//
//   void _onGenerateQr() {
//     if (selectedClass == null ||
//         selectedSubject == null ||
//         radiusController.text.trim().isEmpty) {
//       ScaffoldMessages.informError(context, 'Vui lòng nhập đầy đủ dữ liệu');
//       return;
//     }
//
//     final note = noteController.text.trim();
//
//     final plainText = '''
//     Năm học: $selectedClass
//     Môn học: $selectedSubject
//     Bán kính: ${radiusController.text}m
//     Ghi chú: ${note.isNotEmpty ? note : 'Không'}
//   ''';
//
//     const keyStr = 'mysecretkey1234567890';
//     const ivStr = 'iv1234567890';
//
//     final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
//     final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' '));
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final encrypted = encrypter.encrypt(plainText, iv: iv).base64;
//
//     setState(() {
//       qrData = encrypted;
//     });
//   }
//
//   Widget _buildNumberField({
//     required String hint,
//     required IconData icon,
//     required TextEditingController controller,
//     ValueChanged<String>? onChanged,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       onChanged: (_) => onChanged,
//       style: TextStyles.titleValueInput,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         hintText: hint,
//         hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 8),
//           child: FaIcon(icon, color: AppColors.primary, size: 15),
//         ),
//         prefixIconConstraints: const BoxConstraints(minWidth: 40),
//         filled: true,
//         fillColor: Colors.white,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: AppBorderRadius.radius12,
//           borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: AppBorderRadius.radius12,
//           borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String hint,
//     required IconData icon,
//     required TextEditingController controller,
//     int maxLine = 6,
//     ValueChanged<String>? onChanged,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLine,
//       onChanged: (_) => onChanged,
//       style: TextStyles.titleValueInput,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(left: 12, right: 8),
//           child: FaIcon(icon, color: AppColors.primary, size: 18),
//         ),
//         prefixIconConstraints: const BoxConstraints(minWidth: 40),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding:
//         const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: AppBorderRadius.radius12,
//           borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: AppBorderRadius.radius12,
//           borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQrPreview() {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(16),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: AppBorderRadius.radius12,
//         border: Border.all(color: Colors.grey.shade200),
//         boxShadow: AppShadows.cardShadowList,
//       ),
//       child: qrData != null
//           ? Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           QrImageView(
//             data: qrData!,
//             version: QrVersions.auto,
//             size: 200.0,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             (selectedSubject ?? '') + " - ${generateCustomCode()}",
//             style: TextStyles.titleInput.copyWith(color: AppColors.black),
//           ),
//         ],
//       )
//           : Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FaIcon(FontAwesomeIcons.qrcode,
//               size: 80, color: Colors.grey.shade400),
//           const SizedBox(height: 12),
//           Text(
//             'Chưa có mã QR — vui lòng nhập thông tin và bấm "Tạo QR Code"',
//             textAlign: TextAlign.center,
//             style: TextStyles.hintTextInput
//                 .copyWith(color: Colors.grey, fontSize: 10),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(bottom: 24),
//         child: Column(
//           children: [
//             // Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
//               decoration: const BoxDecoration(
//                 gradient: AppLinearGradient.linearGradient,
//                 borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
//               ),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const FaIcon(FontAwesomeIcons.chevronLeft,
//                         color: AppColors.white),
//                   ),
//                   const SizedBox(width: 12),
//                   Text('Tạo mã QR', style: TextStyles.titleScaffold),
//                 ],
//               ),
//             ),
//
//             _buildQrPreview(),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   DropdownFiled(
//                     hint: 'Chọn lớp dạy',
//                     items: classes,
//                     value: selectedClass,
//                     iconData: FontAwesomeIcons.solidCalendar,
//                       onChanged: (val) {
//                         setState(() {
//                           selectedClass = val;
//                         });
//                       }
//                   ),
//                   const SizedBox(height: 16),
//                   DropdownFiled(
//                     hint: 'Chọn môn học *',
//                     items: subjects,
//                     value: selectedSubject,
//                     iconData: FontAwesomeIcons.book,
//                       onChanged: (val) {
//                         setState(() {
//                           selectedSubject = val;
//                         });
//                       }
//                   ),
//                   const SizedBox(height: 16),
//                   _buildNumberField(
//                     hint: 'Bán kính quét (m) *',
//                     icon: FontAwesomeIcons.ruler,
//                     controller: radiusController,
//                     onChanged: (_) {
//                       setState(() {});
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   _buildTextField(
//                     hint: 'Ghi chú (tuỳ chọn)',
//                     icon: FontAwesomeIcons.noteSticky,
//                     controller: noteController,
//                     onChanged: (_) {
//                       setState(() {});
//                     },
//                   ),
//                   const SizedBox(height: 24),
//
//                   PrimaryActionButton(
//                     onPressed: _onGenerateQr,
//                     text: 'Tạo QR Code',
//                     icon: HeroIcons.qrCode,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/attendance/presentation/bloc/create_qrcode_bloc.dart';
import 'package:application/features/attendance/presentation/bloc/create_qrcode_event.dart';
import 'package:application/features/attendance/presentation/bloc/create_qrcode_state.dart';
import 'package:application/features/attendance/presentation/widgets/dropdown_filed.dart';
import 'package:application/features/widgets/primary_action_button.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:flutter/services.dart';

class CreateQrcodeScreen extends StatelessWidget {
  const CreateQrcodeScreen({super.key});

  String generateCustomCode() {
    final now = DateTime.now();
    final datePart =
        "${now.day.toString().padLeft(2,'0')}${now.month.toString().padLeft(2,'0')}${now.year}${now.hour.toString().padLeft(2,'0')}${now.minute.toString().padLeft(2,'0')}${now.second.toString().padLeft(2,'0')}";
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    final randomPart = List.generate(7, (_) => chars[rand.nextInt(chars.length)]).join();
    return "QR$datePart$randomPart";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateQrCodeBloc(),
      child: const _CreateQrCodeScreenView(),
    );
  }
}

class _CreateQrCodeScreenView extends StatefulWidget {
  const _CreateQrCodeScreenView({super.key});
  @override
  State<_CreateQrCodeScreenView> createState() => _CreateQrCodeScreenViewState();
}

class _CreateQrCodeScreenViewState extends State<_CreateQrCodeScreenView> {
  final TextEditingController radiusController = TextEditingController(text: '5');
  final TextEditingController noteController = TextEditingController();
  final classes = ['CH01','CH02','CH03'];
  final subjects = ['Lập trình Flutter','Cấu trúc dữ liệu','Toán rời rạc'];

  String generateCustomCode() {
    final now = DateTime.now();
    final datePart =
        "${now.day.toString().padLeft(2,'0')}${now.month.toString().padLeft(2,'0')}${now.year}${now.hour.toString().padLeft(2,'0')}${now.minute.toString().padLeft(2,'0')}${now.second.toString().padLeft(2,'0')}";
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    final randomPart = List.generate(7, (_) => chars[rand.nextInt(chars.length)]).join();
    return "QR$datePart$randomPart";
  }

  @override
  void dispose() {
    radiusController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<CreateQrCodeBloc, CreateQrCodeState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessages.informError(context, state.error!);
          }
        },
        builder: (context, state) {
          radiusController.text = state.radius;
          noteController.text = state.note;

          return SingleChildScrollView(
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
                        child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                      ),
                      const SizedBox(width: 12),
                      Text('Tạo mã QR', style: TextStyles.titleScaffold),
                    ],
                  ),
                ),

                // QR Preview
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppBorderRadius.radius12,
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: AppShadows.cardShadowList,
                  ),
                  child: state.qrData != null
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrImageView(data: state.qrData!, version: QrVersions.auto, size: 200),
                      const SizedBox(height: 12),
                      Text(
                        '${state.selectedSubject ?? ''} - ${generateCustomCode()}',
                        style: TextStyles.titleInput.copyWith(color: AppColors.black),
                      ),
                    ],
                  )
                      : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.qrcode, size: 80, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        'Chưa có mã QR — vui lòng nhập thông tin và bấm "Tạo QR Code"',
                        textAlign: TextAlign.center,
                        style: TextStyles.hintTextInput.copyWith(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      DropdownFiled(
                        hint: 'Chọn lớp dạy',
                        items: classes,
                        value: state.selectedClass,
                        iconData: FontAwesomeIcons.solidCalendar,
                        onChanged: (val) => context.read<CreateQrCodeBloc>().add(ClassSelectedEvent(val!)),
                      ),
                      const SizedBox(height: 16),
                      DropdownFiled(
                        hint: 'Chọn môn học *',
                        items: subjects,
                        value: state.selectedSubject,
                        iconData: FontAwesomeIcons.book,
                        onChanged: (val) => context.read<CreateQrCodeBloc>().add(SubjectSelectedEvent(val!)),
                      ),
                      const SizedBox(height: 16),
                      // Number field
                      TextField(
                        controller: radiusController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: TextStyles.titleValueInput,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          hintText: 'Bán kính quét (m) *',
                          hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: FaIcon(FontAwesomeIcons.ruler, color: AppColors.primary, size: 15),
                          ),
                          prefixIconConstraints: const BoxConstraints(minWidth: 40),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: AppBorderRadius.radius12,
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: AppBorderRadius.radius12,
                            borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
                          ),
                        ),
                        onChanged: (val) => context.read<CreateQrCodeBloc>().add(RadiusChangedEvent(val)),
                      ),
                      const SizedBox(height: 16),
                      // Note field
                      TextField(
                        controller: noteController,
                        maxLines: 6,
                        style: TextStyles.titleValueInput,
                        decoration: InputDecoration(
                          hintText: 'Ghi chú (tuỳ chọn)',
                          hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: FaIcon(FontAwesomeIcons.noteSticky, color: AppColors.primary, size: 18),
                          ),
                          prefixIconConstraints: const BoxConstraints(minWidth: 40),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: AppBorderRadius.radius12,
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: AppBorderRadius.radius12,
                            borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
                          ),
                        ),
                        onChanged: (val) => context.read<CreateQrCodeBloc>().add(NoteChangedEvent(val)),
                      ),
                      const SizedBox(height: 24),
                      PrimaryActionButton(
                        text: 'Tạo QR Code',
                        onPressed: () => context.read<CreateQrCodeBloc>().add(GenerateQrCodeEvent()),
                        icon: HeroIcons.qrCode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}