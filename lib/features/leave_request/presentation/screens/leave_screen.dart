import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/leave_request/presentation/widgets/leave_dropdown.dart';
import 'package:application/features/leave_request/presentation/widgets/leave_date_field.dart';
import 'package:application/features/leave_request/presentation/widgets/leave_form_preview.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_event.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_state.dart';
import 'package:application/features/leave_request/domain/usecases/submit_leave_request.dart';
import 'package:application/features/leave_request/data/leave_request_repository_impl.dart';
import 'package:application/features/leave_request/data_sources/leave_request_remote_data_source.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/constants/app_label.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LeaveRequestBloc(
        SubmitLeaveRequest(LeaveRequestRepositoryImpl(
          remoteDataSource: LeaveRequestRemoteDataSource(),
        )),
      ),
      child: const _LeaveScreenContent(),
    );
  }
}

class _LeaveScreenContent extends StatelessWidget {
  const _LeaveScreenContent();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaveRequestBloc, LeaveRequestState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessages.informWarning(context, state.errorMessage!);
        }
        if (state.isSuccess) {
          ScaffoldMessages.informSuccess(context, AppLabel.titleInformLeaveRequestSuccess);
        }
      },
      builder: (context, state) {
        final bloc = context.read<LeaveRequestBloc>();
        final subjects = ['Flutter', 'Toán rời rạc', 'CSDL'];
        final teachers = ['Thầy Nam', 'Cô Huyền', 'Thầy Sơn'];
        final isLoading = state.isSubmitting;

        return LoadingOverlay(
            isLoading: isLoading,
            child: Scaffold(
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
                            child: AppIcon.iconScaffoldChevronLeft,
                          ),
                          const SizedBox(width: 12),
                          Text(AppLabel.titleScaffoldLeaveRequest, style: TextStyles.titleScaffold),
                        ],
                      ),
                    ),

                    const LeaveFormPreview(),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          LeaveDropdown(
                            hint: AppLabel.hintTextInputFilterBySubject,
                            items: subjects,
                            value: state.subject,
                            iconData: FontAwesomeIcons.book,
                            onChanged: (v) => bloc.add(SubjectChanged(v)),
                          ),
                          const SizedBox(height: 16),
                          LeaveDropdown(
                            hint: AppLabel.hintTextSelectLecturer,
                            items: teachers,
                            value: state.teacher,
                            iconData: FontAwesomeIcons.personChalkboard,
                            onChanged: (v) => bloc.add(TeacherChanged(v)),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: LeaveDateField(
                                  hint: AppLabel.hintTextInputStartDate,
                                  date: state.fromDate,
                                  onDateSelected: (d) =>
                                      bloc.add(FromDateChanged(d)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.arrow_right_alt, color: Colors.grey),
                              const SizedBox(width: 12),
                              Expanded(
                                child: LeaveDateField(
                                  hint: AppLabel.hintTextInputEndDate,
                                  date: state.toDate,
                                  onDateSelected: (d) => bloc.add(ToDateChanged(d)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            // controller: provider.reasonController,
                            onChanged: (value) => context.read<LeaveRequestBloc>().add(ReasonChanged(value)),
                            maxLines: 7,
                            style: TextStyles.titleInput,
                            decoration: InputDecoration(
                              hintText: AppLabel.hintTextInputReason,
                              hintStyle: TextStyles.hintTextInput
                                  .copyWith(color: Colors.grey),
                              prefixIcon: const Icon(Icons.edit_note_rounded,
                                color: AppColors.primary, size: 12,),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: AppBorderRadius.radius12,
                                borderSide: const BorderSide(
                                    color: Color(0xFFE0E0E0), width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: AppBorderRadius.radius12,
                                borderSide: const BorderSide(
                                    color: AppColors.inputFocus, width: 1.5),
                              ),
                            ),
                            controller: TextEditingController(text: state.reason)
                              ..selection = TextSelection.collapsed(offset: state.reason.length),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: state.isSubmitting
                                  ? null
                                  : () => bloc.add(SubmitLeaveRequestPressed()),
                              icon: state.isSubmitting
                                  ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white))
                                  : const FaIcon(FontAwesomeIcons.paperPlane,
                                  color: AppColors.white),
                              label: Text(
                                state.isSubmitting
                                    ? 'Đang gửi...'
                                    : 'Gửi đơn nghỉ phép',
                                style: TextStyles.titleMedium
                                    .copyWith(color: Colors.white),
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
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}