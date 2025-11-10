import 'package:flutter/material.dart';
import 'package:application/features/setting/presentation/widgets/avatar_picker.dart';
import 'package:application/features/setting/presentation/widgets/profile_form.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_label.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(AppLabel.titleScaffoldUpdateProfile, style: TextStyles.titleScaffold),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Avatar Picker
            const AvatarPicker(),

            const SizedBox(height: 24),

            // Profile Form
            const ProfileForm(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}