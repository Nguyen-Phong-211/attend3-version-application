import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'password_field.dart';
import 'primary_action_button.dart';

class ChangePasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSubmit;

  const ChangePasswordForm({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.onSubmit,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  bool _isValidPassword(String password) {
    final hasLetters = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumbers = RegExp(r'\d').hasMatch(password);
    return password.length >= 8 && hasLetters && hasNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            const SizedBox(height: 32),
            PasswordField(
              controller: widget.newPasswordController,
              hint: 'Mật khẩu mới',
              obscure: _obscureNew,
              toggle: () => setState(() => _obscureNew = !_obscureNew),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Vui lòng nhập mật khẩu mới';
                if (!_isValidPassword(value)) return 'Mật khẩu phải trên 8 ký tự, gồm chữ và số';
                return null;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              controller: widget.confirmPasswordController,
              hint: 'Xác nhận mật khẩu',
              obscure: _obscureConfirm,
              toggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Vui lòng nhập xác nhận mật khẩu';
                if (value != widget.newPasswordController.text) return 'Mật khẩu xác nhận không khớp';
                return null;
              },
            ),
            const SizedBox(height: 32),
            PrimaryActionButton(
              onPressed: widget.onSubmit,
              text: 'Lưu thay đổi',
              icon: HeroIcons.checkCircle,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}