import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_event.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/leave_request/presentation/widgets/approval_filter_drawer.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            final res = await ApprovalFilterDrawer.show(context);
            if (res != null) {
              context.read<ApprovalBloc>().add(ApplyFilters(res));
            }
          },
          icon: AppIcon.iconFilter,
          label: const Text(
            AppLabel.titleButtonFilter,
            style: TextStyle(color: AppColors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.backgroundPrimaryButton,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radius12),
            // side: const BorderSide(color: AppColors.white),
            elevation: 2,
          ),
        ),
      ],
    );
  }
}