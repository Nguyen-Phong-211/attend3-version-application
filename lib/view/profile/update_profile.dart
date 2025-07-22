import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedGender;
  File? _avatarImage;

  void _pickAvatar() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _avatarImage = File(picked.path);
      });
    }
  }

  void _submitUpdate() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thông tin đã được cập nhật')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gradient Header
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
                      child: FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white,)
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Cập nhật hồ sơ',
                    style: TextStyles.titleMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Avatar
            GestureDetector(
              onTap: _pickAvatar,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatarImage != null
                    ? FileImage(_avatarImage!)
                    : const AssetImage('assets/images/default_avatar.png')
                as ImageProvider,
              ),
            ),
            const SizedBox(height: 24),

            // Form Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildInputField(_nameController, 'Họ tên', Icons.person),
                  const SizedBox(height: 16),
                  _buildInputField(_phoneController, 'Số điện thoại', Icons.phone),
                  const SizedBox(height: 16),
                  _buildInputField(_emailController, 'Email', Icons.email),
                  const SizedBox(height: 16),

                  // Gender Dropdown
                  Row(
                    children: [
                      const Icon(Icons.transgender, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Giới tính',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor: Colors.grey,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.5,
                                    child: Radio<String>(
                                      value: 'Nam',
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value;
                                        });
                                      },
                                      activeColor: AppColors.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Nam',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 24),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Radio<String>(
                                    value: 'Nữ',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    activeColor: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Nữ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submitUpdate,
                      icon: const Icon(Icons.save, color: AppColors.white),
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
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint, IconData icon,
      {bool isObscure = false}) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
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
    );
  }
}