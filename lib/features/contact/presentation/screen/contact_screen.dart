import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/utils/validator.dart';
import 'package:application/features/widgets/primary_action_button.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/contact/presentation/widgets/contact_header.dart';
import 'package:application/features/contact/presentation/widgets/dropdown_section.dart';
import 'package:application/features/contact/presentation/widgets/teacher_profile_card.dart';
import 'package:application/features/contact/presentation/widgets/message_form.dart';
import 'package:application/features/contact/domain/entities/contact_entity.dart';
import 'package:application/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:application/features/contact/presentation/bloc/contact_event.dart';
import 'package:application/features/contact/presentation/bloc/contact_state.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String? selectedSubject;
  String? selectedClass;
  String? selectedTeacher;
  String? selectedTypePerson;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  /// Sample data - replace later with API
  final List<String> subjects = ['Lập trình Flutter', 'Cấu trúc dữ liệu', 'Toán rời rạc'];
  final List<String> classes = ['CH01', 'CH02', 'CH03'];
  final List<String> teachers = ['Thầy Nam', 'Cô Huyền', 'Thầy Sơn'];
  final List<String> typePersons = ['Giảng viên', 'Quản trị viên'];

  final Map<String, Map<String, String>> teacherProfiles = {
    'Thầy Nam': {
      'name': 'Nguyễn Văn Nam',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'department': 'Khoa CNTT',
      'email': 'nam.nguyen@university.edu.vn',
    },
    'Cô Huyền': {
      'name': 'Trần Thị Huyền',
      'avatar': 'https://i.pravatar.cc/150?img=47',
      'department': 'Khoa Khoa học máy tính',
      'email': 'huyen.tran@university.edu.vn',
    },
    'Thầy Sơn': {
      'name': 'Phạm Đức Sơn',
      'avatar': 'https://i.pravatar.cc/150?img=12',
      'department': 'Khoa Hệ thống thông tin',
      'email': 'son.pham@university.edu.vn',
    },
  };

  void _onSubmit(BuildContext context) {
    final errorMessage = Validators.validateContactForm(
      typePerson: selectedTypePerson,
      teacher: selectedTeacher,
      subject: selectedSubject,
      className: selectedClass,
      title: titleController.text,
      message: messageController.text,
    );

    if (errorMessage != null) {
      ScaffoldMessages.informError(context, errorMessage);
      return;
    }

    final contact = ContactEntity(
      typePerson: selectedTypePerson!,
      teacher: selectedTeacher,
      subject: selectedSubject,
      className: selectedClass,
      title: titleController.text,
      message: messageController.text,
    );

    context.read<ContactBloc>().add(SendContactEvent(contact));
  }

  @override
  Widget build(BuildContext context) {
    final bool isTeacherSelected = selectedTypePerson == 'Giảng viên';
    final bool showTeacherProfile =
        isTeacherSelected && selectedTeacher != null && selectedSubject != null && selectedClass != null;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            ScaffoldMessages.informSuccess(context, 'Đã gửi liên hệ thành công!');
            titleController.clear();
            messageController.clear();
            setState(() {
              selectedTeacher = null;
              selectedSubject = null;
              selectedClass = null;
              selectedTypePerson = null;
            });
          } else if (state is ContactError) {
            ScaffoldMessages.informError(context, state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const ContactHeader(title: 'Liên hệ'),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      DropdownSection(
                        selectedTypePerson: selectedTypePerson,
                        selectedTeacher: selectedTeacher,
                        selectedSubject: selectedSubject,
                        selectedClass: selectedClass,
                        onChangedTypePerson: (val) => setState(() {
                          selectedTypePerson = val;
                          selectedTeacher = null;
                          selectedSubject = null;
                          selectedClass = null;
                        }),
                        onChangedTeacher: (val) => setState(() => selectedTeacher = val),
                        onChangedSubject: (val) => setState(() => selectedSubject = val),
                        onChangedClass: (val) => setState(() => selectedClass = val),
                        typePersons: typePersons,
                        teachers: teachers,
                        subjects: subjects,
                        classes: classes,
                      ),

                      if (showTeacherProfile)
                        TeacherProfileCard(profile: teacherProfiles[selectedTeacher]!),

                      const SizedBox(height: 16),
                      MessageForm(
                        titleController: titleController,
                        messageController: messageController,
                      ),
                      const SizedBox(height: 24),

                      // Loading / Normal button
                      state is ContactLoading
                          ? const Center(child: CircularProgressIndicator())
                          : PrimaryActionButton(
                        onPressed: () => _onSubmit(context),
                        text: 'Gửi liên hệ',
                        icon: HeroIcons.checkCircle,
                      ),

                      const SizedBox(height: 40),
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