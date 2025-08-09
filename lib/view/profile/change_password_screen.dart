import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // Gọi API đổi mật khẩu ở đây
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mật khẩu đã được thay đổi')),
      );
    }
  }

  bool _isValidPassword(String password) {
    final hasLetters = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumbers = RegExp(r'\d').hasMatch(password);
    return password.length >= 8 && hasLetters && hasNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
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
                  Text(
                    'Đổi mật khẩu',
                    style: TextStyles.titleScaffold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildPasswordField(
                      controller: _newPasswordController,
                      hint: 'Mật khẩu mới',
                      obscure: _obscureNew,
                      toggle: () => setState(() => _obscureNew = !_obscureNew),
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      hint: 'Xác nhận mật khẩu',
                      obscure: _obscureConfirm,
                      toggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                      isConfirm: true,
                    ),
                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _handleChangePassword,
                        icon: const Icon(Icons.lock_reset, color: AppColors.white),
                        label: Text(
                          'Lưu thay đổi',
                          style: TextStyles.titleMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.backgroundPrimaryButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: AppBorderRadius.radius12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required VoidCallback toggle,
    bool isConfirm = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primary,
          ),
          onPressed: toggle,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng nhập $hint';
        }
        if (!isConfirm && !_isValidPassword(value)) {
          return 'Mật khẩu phải trên 8 ký tự, gồm chữ và số';
        }
        if (isConfirm && value != _newPasswordController.text) {
          return 'Mật khẩu xác nhận không khớp';
        }
        return null;
      },
    );
  }
}