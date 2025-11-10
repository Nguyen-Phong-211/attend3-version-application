import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/setting/presentation/widgets/change_password_header.dart';
import 'package:application/features/setting/presentation/widgets/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessages.informSuccess(context, 'Mật khẩu đã được thay đổi');
    }
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ChangePasswordHeader(),
            ChangePasswordForm(
              formKey: _formKey,
              newPasswordController: _newPasswordController,
              confirmPasswordController: _confirmPasswordController,
              onSubmit: _handleChangePassword,
            ),
          ],
        ),
      ),
    );
  }
}