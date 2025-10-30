import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_event.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_state.dart';
import 'package:application/features/leave_request/presentation/widgets/approval_header.dart';
import 'package:application/features/leave_request/presentation/widgets/approval_request_list.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/features/widgets/button_filter.dart';
import 'leave_request_detail_screen.dart';

class ApprovalLeaveRequestScreen extends StatelessWidget {
  const ApprovalLeaveRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider should be provided from upper layer via GetIt in main or route.
    context.read<ApprovalBloc>().add(LoadApprovalRequests());
    return BlocBuilder<ApprovalBloc, ApprovalState>(
        builder: (context, state) {
          return LoadingOverlay(
              isLoading: state.isLoading,
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ApprovalHeader(onFilterApplied: (filters) {
                          // dispatch filter event
                          context.read<ApprovalBloc>().add(ApplyFilters(filters ?? {}));
                        }),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: const FilterButton(),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<ApprovalBloc, ApprovalState>(
                          builder: (context, state) {
                            if (state.error != null) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 80),
                                child: Text(
                                  'Error: ${state.error}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }

                            return ApprovalRequestList(
                              requests: state.filteredRequests,
                              onOpenDetail: (id) {
                                context.read<ApprovalBloc>().add(SelectRequest(id));
                                final selected = context.read<ApprovalBloc>().state.selectedRequest;

                                final request = selected ??
                                    state.allRequests.firstWhere(
                                          (e) => e.id == id,
                                      orElse: () => state.filteredRequests.first,
                                    );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ApprovedLeaveRequestDetailScreen(request: request),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}