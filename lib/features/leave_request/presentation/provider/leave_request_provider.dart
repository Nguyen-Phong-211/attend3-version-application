import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../view/approval_leave_quest/approval_leave_quest_screen.dart';
import '../bloc/leave_request_bloc.dart';
import '../bloc/leave_request_event.dart';

/// Provider for Leave Request screen
/// - holds selected dates, lists (semesters/years/etc.)
/// - exposes setter methods and submit logic (mock)
class LeaveRequestProvider extends ChangeNotifier {
  // Form state
  DateTime? fromDate;
  DateTime? toDate;

  String? selectedSubject;
  String? selectedTeacher;

  final TextEditingController reasonController = TextEditingController();

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  // Mock data (replace with API-provided lists later)
  final List<String> subjects = ['Lập trình Flutter', 'Cấu trúc dữ liệu', 'Toán rời rạc'];
  final List<String> teachers = ['Thầy Nam', 'Cô Huyền', 'Thầy Sơn'];

  // --- Setters used by UI ---
  void setSubject(String? value) {
    selectedSubject = value;
    notifyListeners();
  }

  void setTeacher(String? value) {
    selectedTeacher = value;
    notifyListeners();
  }

  // these are the methods you were calling from the UI
  void setFromDate(DateTime date) {
    fromDate = date;
    notifyListeners();
  }

  void setToDate(DateTime date) {
    toDate = date;
    notifyListeners();
  }

  // Optional helper to clear/reset form
  void resetForm() {
    fromDate = null;
    toDate = null;
    selectedSubject = null;
    selectedTeacher = null;
    reasonController.clear();
    notifyListeners();
  }

  // Example validation (simple)
  String? validateBeforeSubmit() {
    if (selectedSubject == null) return 'Vui lòng chọn môn học';
    if (selectedTeacher == null) return 'Vui lòng chọn giảng viên';
    if (fromDate == null || toDate == null) return 'Vui lòng chọn ngày';
    if (toDate!.isBefore(fromDate!)) return 'Ngày kết thúc phải sau ngày bắt đầu';
    if (reasonController.text.trim().isEmpty) return 'Vui lòng nhập lý do';
    return null;
  }

  // Mock submit (replace with repository/api call)
  Future<bool> submitLeave(BuildContext context) async {
    final error = validateBeforeSubmit();
    if (error != null) {
      // you can show snack bar here or bubble error up to UI
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return false;
    }

    _isSubmitting = true;
    notifyListeners();

    // simulate network
    await Future.delayed(const Duration(seconds: 1));

    _isSubmitting = false;
    notifyListeners();

    // On success return true (in real impl handle response)
    return true;
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }
}

class ApprovalProvider extends StatelessWidget {
  const ApprovalProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApprovalBloc>(
      create: (_) => GetIt.instance<ApprovalBloc>()
        ..add(LoadApprovalListEvent()),
      child: const ApprovalLeaveRequestScreen(),
    );
  }
}