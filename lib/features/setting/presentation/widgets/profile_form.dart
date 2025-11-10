import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'input_field.dart';
import 'date_picker_field.dart';
import 'gender_picker.dart';
import 'package:application/features/setting/presentation/widgets/primary_action_button.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/core/constants/app_label.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _studentCode = TextEditingController();
  final TextEditingController _departmentNameController = TextEditingController();
  final TextEditingController _majorNameController = TextEditingController();
  DateTime? _birthDate;
  String _gender = 'Nam';

  void _submitUpdate() {
    ScaffoldMessages.informSuccess(context, AppLabel.titleInformUpdateSuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          InputField(controller: _studentCode, hint: 'Mã số sinh viên', icon: FontAwesomeIcons.idBadge, disabled: true),
          const SizedBox(height: 16),
          InputField(controller: _departmentNameController, hint: 'Khoa', icon: Icons.school_rounded, disabled: true),
          const SizedBox(height: 16),
          InputField(controller: _majorNameController, hint: 'Chuyên ngành', icon: Icons.local_fire_department_rounded, disabled: true),
          const SizedBox(height: 16),
          InputField(controller: _nameController, hint: 'Họ tên', icon: Icons.person),
          const SizedBox(height: 16),
          InputField(controller: _phoneController, hint: 'Số điện thoại', icon: Icons.phone),
          const SizedBox(height: 16),
          InputField(controller: _emailController, hint: 'Email', icon: Icons.email),
          const SizedBox(height: 16),

          DatePickerField(birthDate: _birthDate, onDateSelected: (date) => setState(() => _birthDate = date)),
          const SizedBox(height: 20),

          GenderPicker(gender: _gender, onChanged: (val) => setState(() => _gender = val)),

          const SizedBox(height: 24),
          PrimaryActionButton(onPressed: _submitUpdate, text: 'Lưu thay đổi', icon: HeroIcons.checkCircle),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _studentCode.dispose();
    _departmentNameController.dispose();
    _majorNameController.dispose();
    super.dispose();
  }
}